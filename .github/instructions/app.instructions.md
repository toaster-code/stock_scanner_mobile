# 📦 Inventory Control Mobile System — Full Technical Specification

**Version:** 2.0  
**Stack:** Flutter 3.x · Node.js (Fastify) · PostgreSQL 15 · Drift · Riverpod  
**Target:** Production-ready. Offline-first. Audit-complete.

---

## Table of Contents

1. [Project Overview](#1-project-overview)
2. [Architecture](#2-architecture)
3. [Folder Structure](#3-folder-structure)
4. [Database Schema](#4-database-schema)
5. [Mobile — Feature Specs](#5-mobile--feature-specs)
6. [Backend — API Spec](#6-backend--api-spec)
7. [Sync Engine](#7-sync-engine)
8. [State Management](#8-state-management)
9. [Security](#9-security)
10. [Error Handling](#10-error-handling)
11. [Testing](#11-testing)
12. [Infrastructure & Deployment](#12-infrastructure--deployment)
13. [Implementation Roadmap](#13-implementation-roadmap)
14. [Anti-Patterns Reference](#14-anti-patterns-reference)

---

## 1. Project Overview

### 1.1 Purpose

A warehouse mobile application for field operators that works **fully offline**, syncs when connectivity is restored, and produces **auditable records** (image + GPS + timestamp + user) for every stock movement.

### 1.2 Operational Modes

| Mode | Color Code | Trigger | Core Action |
|---|---|---|---|
| INBOUND | 🔵 Blue | Receiving goods | Scan items → increase stock |
| OUTBOUND | 🔴 Red | Picking/shipping | Validate against picking list → decrease stock |
| INVENTORY | 🟡 Yellow | Physical counting | Free-scan → generate count report |

### 1.3 Non-Functional Requirements

| Requirement | Target |
|---|---|
| Scan latency (detect → action) | < 300ms |
| UI frame rate | 60 FPS sustained |
| Offline duration supported | Unlimited (queue-based) |
| Image max size after compression | 300 KB |
| JWT token expiry | 8h access / 30d refresh |
| API response time (p95) | < 200ms |
| Sync retry strategy | Exponential backoff (max 5 attempts) |

---

## 2. Architecture

### 2.1 System Topology

```
┌──────────────────────────────────┐
│        Flutter Mobile App        │
│  ┌────────────────────────────┐  │
│  │  Presentation (Screens/UI) │  │
│  ├────────────────────────────┤  │
│  │  Application (Use Cases)   │  │
│  ├────────────────────────────┤  │
│  │  Domain (Entities/Repos)   │  │
│  ├────────────────────────────┤  │
│  │  Data (API + Drift LocalDB)│  │
│  └────────────────────────────┘  │
└──────────┬───────────────────────┘
           │ REST / JSON / JWT
           │ (WiFi / VPN)
┌──────────▼───────────────────────┐
│     Node.js Backend (Fastify)    │
│  ┌──────────┐  ┌───────────────┐ │
│  │ Routes   │  │ Services      │ │
│  │ Auth     │  │ Sync Engine   │ │
│  │ Items    │  │ Image Store   │ │
│  │ Stock    │  │ Audit Logger  │ │
│  └──────────┘  └───────────────┘ │
└──────────┬───────────────────────┘
           │
  ┌────────▼────────┐   ┌──────────────┐
  │   PostgreSQL    │   │  File Store  │
  │   (main DB)     │   │  (disk/S3)   │
  └─────────────────┘   └──────────────┘
```

### 2.2 Mobile Clean Architecture — Layer Responsibilities

```
lib/
├── presentation/       ← Widgets, screens, Riverpod providers (UI state only)
├── application/        ← Use cases: ScanItemUseCase, SyncQueueUseCase, etc.
├── domain/             ← Pure Dart entities & repository interfaces (no Flutter deps)
└── data/
    ├── repositories/   ← Implementations of domain interfaces
    ├── local/          ← Drift database, DAOs
    └── remote/         ← HTTP client, DTOs, API endpoints
```

**Rule:** Inner layers never import outer layers. Domain has zero external dependencies.

---

## 3. Folder Structure

### 3.1 Flutter App

```
lib/
├── main.dart
├── app.dart                          # MaterialApp, router, theme
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── api_endpoints.dart
│   │   └── app_strings.dart
│   ├── errors/
│   │   ├── failures.dart             # Sealed class: NetworkFailure, ParseFailure, etc.
│   │   └── exceptions.dart
│   ├── network/
│   │   ├── dio_client.dart           # Dio instance + interceptors
│   │   ├── connectivity_service.dart # Stream<ConnectivityStatus>
│   │   └── token_interceptor.dart    # JWT attach + refresh logic
│   └── utils/
│       ├── image_compressor.dart
│       ├── metadata_collector.dart   # GPS + deviceId + timestamp
│       └── barcode_throttle.dart
│
├── domain/
│   ├── entities/
│   │   ├── item.dart
│   │   ├── movement.dart
│   │   ├── stock_entry.dart
│   │   └── pending_action.dart
│   └── repositories/
│       ├── item_repository.dart      # abstract interface
│       ├── movement_repository.dart
│       ├── stock_repository.dart
│       └── sync_repository.dart
│
├── data/
│   ├── local/
│   │   ├── database.dart             # Drift AppDatabase
│   │   ├── tables/
│   │   │   ├── items_table.dart
│   │   │   ├── movements_table.dart
│   │   │   └── pending_actions_table.dart
│   │   └── daos/
│   │       ├── items_dao.dart
│   │       ├── movements_dao.dart
│   │       └── pending_actions_dao.dart
│   ├── remote/
│   │   ├── api_client.dart           # Retrofit/Dio typed client
│   │   └── dtos/
│   │       ├── item_dto.dart
│   │       ├── movement_dto.dart
│   │       └── sync_payload_dto.dart
│   └── repositories/
│       ├── item_repository_impl.dart
│       ├── movement_repository_impl.dart
│       ├── stock_repository_impl.dart
│       └── sync_repository_impl.dart
│
├── application/
│   ├── scan/
│   │   ├── scan_item_use_case.dart
│   │   └── validate_scan_use_case.dart
│   ├── movement/
│   │   ├── create_movement_use_case.dart
│   │   └── get_movements_use_case.dart
│   ├── sync/
│   │   ├── sync_queue_use_case.dart
│   │   └── flush_pending_actions_use_case.dart
│   └── auth/
│       └── login_use_case.dart
│
└── presentation/
    ├── providers/
    │   ├── scan_provider.dart
    │   ├── movement_provider.dart
    │   ├── sync_provider.dart
    │   └── auth_provider.dart
    ├── screens/
    │   ├── login/
    │   │   └── login_screen.dart
    │   ├── home/
    │   │   └── home_screen.dart
    │   ├── inbound/
    │   │   ├── inbound_screen.dart
    │   │   └── widgets/
    │   │       ├── scan_overlay.dart
    │   │       └── inbound_item_tile.dart
    │   ├── outbound/
    │   │   ├── outbound_screen.dart
    │   │   └── widgets/
    │   │       └── picking_list_tile.dart
    │   ├── inventory/
    │   │   └── inventory_screen.dart
    │   └── sync_status/
    │       └── sync_status_screen.dart
    └── widgets/
        ├── scanner_view.dart          # Reusable camera + overlay widget
        ├── feedback_overlay.dart      # Green/red flash
        └── connectivity_banner.dart   # Offline banner
```

### 3.2 Backend

```
backend/
├── src/
│   ├── server.js                     # Fastify instance + plugin registration
│   ├── config/
│   │   ├── env.js                    # dotenv schema validation (zod)
│   │   └── database.js               # pg Pool config
│   ├── plugins/
│   │   ├── auth.js                   # JWT verify hook
│   │   ├── upload.js                 # multipart file handling
│   │   └── errorHandler.js
│   ├── routes/
│   │   ├── auth.routes.js
│   │   ├── items.routes.js
│   │   ├── stock.routes.js
│   │   ├── movements.routes.js
│   │   ├── sync.routes.js
│   │   └── upload.routes.js
│   ├── services/
│   │   ├── auth.service.js
│   │   ├── item.service.js
│   │   ├── stock.service.js
│   │   ├── movement.service.js
│   │   ├── sync.service.js
│   │   └── upload.service.js
│   ├── db/
│   │   ├── queries/
│   │   │   ├── items.queries.js
│   │   │   ├── stock.queries.js
│   │   │   └── movements.queries.js
│   │   └── migrations/
│   │       ├── 001_initial_schema.sql
│   │       └── 002_audit_table.sql
│   └── utils/
│       ├── pagination.js
│       └── conflict_resolver.js
├── tests/
│   ├── unit/
│   └── integration/
├── uploads/                          # Dev only; prod → S3
├── .env.example
└── package.json
```

---

## 4. Database Schema

### 4.1 PostgreSQL (Backend)

```sql
-- ────────────────────────────
-- Extensions
-- ────────────────────────────
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ────────────────────────────
-- Users & Roles
-- ────────────────────────────
CREATE TYPE user_role AS ENUM ('operator', 'supervisor', 'admin');

CREATE TABLE users (
  id            UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  username      TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  role          user_role NOT NULL DEFAULT 'operator',
  active        BOOLEAN NOT NULL DEFAULT true,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ────────────────────────────
-- Items / Products
-- ────────────────────────────
CREATE TABLE items (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name        TEXT NOT NULL,
  barcode     TEXT UNIQUE NOT NULL,
  unit        TEXT NOT NULL DEFAULT 'pcs',
  category    TEXT,
  active      BOOLEAN NOT NULL DEFAULT true,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_items_barcode ON items(barcode);
CREATE INDEX idx_items_active  ON items(active);

-- ────────────────────────────
-- Stock (per location)
-- ────────────────────────────
CREATE TABLE stock (
  item_id     UUID NOT NULL REFERENCES items(id),
  location    TEXT NOT NULL DEFAULT 'DEFAULT',
  quantity    INT  NOT NULL DEFAULT 0 CHECK (quantity >= 0),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  PRIMARY KEY (item_id, location)
);

-- ────────────────────────────
-- Movements (audit log)
-- ────────────────────────────
CREATE TYPE movement_type AS ENUM ('IN', 'OUT', 'INVENTORY_COUNT');

CREATE TABLE movements (
  id           UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  type         movement_type NOT NULL,
  item_id      UUID NOT NULL REFERENCES items(id),
  quantity     INT NOT NULL CHECK (quantity > 0),
  location     TEXT NOT NULL DEFAULT 'DEFAULT',
  user_id      UUID NOT NULL REFERENCES users(id),
  device_id    TEXT,
  timestamp    TIMESTAMPTZ NOT NULL,           -- client-provided (field event time)
  server_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  image_url    TEXT,
  lat          DOUBLE PRECISION,
  lng          DOUBLE PRECISION,
  notes        TEXT,
  session_id   UUID,                            -- groups movements in one operation
  synced_from  TEXT                             -- device identifier for traceability
);

CREATE INDEX idx_movements_item_id  ON movements(item_id);
CREATE INDEX idx_movements_user_id  ON movements(user_id);
CREATE INDEX idx_movements_timestamp ON movements(timestamp DESC);
CREATE INDEX idx_movements_session   ON movements(session_id);

-- ────────────────────────────
-- Picking Lists (OUTBOUND)
-- ────────────────────────────
CREATE TABLE picking_lists (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  reference   TEXT UNIQUE NOT NULL,
  status      TEXT NOT NULL DEFAULT 'OPEN',   -- OPEN | IN_PROGRESS | COMPLETE
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE picking_list_items (
  id               UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  picking_list_id  UUID NOT NULL REFERENCES picking_lists(id),
  item_id          UUID NOT NULL REFERENCES items(id),
  quantity_expected INT NOT NULL,
  quantity_picked   INT NOT NULL DEFAULT 0,
  status            TEXT NOT NULL DEFAULT 'PENDING'  -- PENDING | PARTIAL | COMPLETE | OVERPICK
);

-- ────────────────────────────
-- Sync Conflict Log
-- ────────────────────────────
CREATE TABLE sync_conflicts (
  id            UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  action_id     UUID NOT NULL,
  device_id     TEXT,
  reason        TEXT NOT NULL,
  payload       JSONB NOT NULL,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 4.2 Drift Local Schema (Mobile)

```dart
// lib/data/local/tables/items_table.dart
class ItemsTable extends Table {
  TextColumn get id       => text()();
  TextColumn get name     => text()();
  TextColumn get barcode  => text().unique()();
  TextColumn get unit     => text().withDefault(const Constant('pcs'))();
  TextColumn get category => text().nullable()();
  BoolColumn get active   => boolean().withDefault(const Constant(true))();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// lib/data/local/tables/pending_actions_table.dart
class PendingActionsTable extends Table {
  IntColumn  get id        => integer().autoIncrement()();
  TextColumn get actionId  => text()();           // UUID from client
  TextColumn get type      => text()();           // IN | OUT | INVENTORY_COUNT
  TextColumn get payload   => text()();           // JSON blob
  BoolColumn get synced    => boolean().withDefault(const Constant(false))();
  IntColumn  get attempts  => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get nextRetryAt => dateTime().nullable()();
}
```

---

## 5. Mobile — Feature Specs

### 5.1 Scanner Engine

**Widget: `ScannerView`**

```dart
class ScannerView extends ConsumerWidget {
  final void Function(String barcode) onDetect;
  final ScannerOverlayStyle overlayStyle;

  // Internal state: lastScanTime (throttle), torch toggle
}
```

**Throttle rule:** 300ms between accepted scans. Drop duplicates silently.

**Detection lifecycle:**
```
Camera frame
  → MobileScanner onDetect callback
  → throttle check
  → null check on rawValue
  → processScan(code)
    → ValidateScanUseCase.call(code)
    → emit ScanResult (valid | invalid | duplicate)
    → trigger feedback (audio + haptic + visual)
```

**Visual overlay states:**

| State | Color | Duration |
|---|---|---|
| Idle | Neutral grey frame | — |
| Valid scan | Full-screen green flash | 300ms |
| Invalid scan | Full-screen red flash | 500ms |
| Duplicate | Yellow flash + "already scanned" | 400ms |

---

### 5.2 Metadata Collection

**`MetadataCollector` (singleton service)**

```dart
class OperationMetadata {
  final DateTime timestamp;   // UTC ISO8601
  final double? lat;
  final double? lng;
  final String userId;
  final String deviceId;
  final String sessionId;     // UUID per operation session
}
```

- GPS: request permission on app start; cache last known position with 30s TTL.
- DeviceId: persist in `flutter_secure_storage` on first run (UUID v4).
- SessionId: generated fresh on each INBOUND / OUTBOUND / INVENTORY session open.

---

### 5.3 Image Capture Flow

```
Operator taps "Capture"
  → camera.takePicture()
  → ImageCompressor.compress(maxSizeKB: 300, quality: 80)
  → save to local app dir as: <sessionId>_<timestamp>.jpg
  → link image path to pending action payload
  → upload deferred to sync phase (multipart POST /upload)
```

**Do not block scan flow on image capture.** Image capture is a separate user-triggered step.

---

### 5.4 INBOUND Mode — Detailed Flow

```
1. Home → tap "INBOUND"
2. (Optional) Scan document QR → load expected items list from cache
3. Tap "Capture photo" (mandatory before starting)
4. Enter continuous scan mode
   a. Scan barcode
   b. Look up item in local DB (Drift)
   c. Check if item is expected (if list loaded)
   d. User feedback (valid/invalid/unknown)
   e. Append to in-memory session list
5. Tap "Complete"
6. Review summary screen (items + quantities)
7. Confirm → flush all items as PendingAction{type: IN} to Drift queue
8. Trigger sync if online
```

---

### 5.5 OUTBOUND Mode — Detailed Flow

```
1. Home → tap "OUTBOUND"
2. Load picking list (scan QR or select from list)
3. Display pending items (with expected quantities)
4. Enter guided scan mode:
   a. Scan item barcode
   b. Check against picking list
   c. Valid → mark item as +1 picked, visual strike-through
   d. Invalid (not in list) → red flash + vibrate long
   e. Overpick (quantity > expected) → warning dialog
5. When all items picked → "Complete" enabled
6. Confirm → flush PendingAction{type: OUT} per item
7. Update picking list status locally → sync to server
```

---

### 5.6 INVENTORY Mode — Detailed Flow

```
1. Home → tap "INVENTORY"
2. Free-scan mode (no validation against expected)
3. Each scan:
   a. Find item in local DB
   b. Increment count map: Map<String barcode, int count>
   c. Show running count next to item
4. Operator can adjust counts manually (+/-)
5. "Finalize" → generate count report
6. (Optional) Capture photo as evidence
7. Flush PendingAction{type: INVENTORY_COUNT} per item with final count
```

---

### 5.7 Offline Banner & Sync Status

- `ConnectivityService` exposes `Stream<ConnectivityStatus>`.
- When offline: display persistent amber banner "Offline — X operations queued".
- When back online: auto-trigger `SyncQueueUseCase`.
- Sync status screen: list of pending actions with status (queued / syncing / failed / done).

---

## 6. Backend — API Spec

### 6.1 Authentication

```
POST /auth/login
Body:   { "username": string, "password": string }
200:    { "accessToken": string, "refreshToken": string, "user": UserDTO }
401:    { "error": "INVALID_CREDENTIALS" }

POST /auth/refresh
Body:   { "refreshToken": string }
200:    { "accessToken": string }
401:    { "error": "TOKEN_EXPIRED" }
```

### 6.2 Items

```
GET /items
Query:  ?page=1&limit=100&search=barcode_or_name&active=true
200:    { "data": ItemDTO[], "total": number, "page": number }

GET /items/:id
200:    ItemDTO

POST /items         (admin only)
Body:   { "name", "barcode", "unit", "category" }
201:    ItemDTO

PATCH /items/:id    (admin only)
Body:   Partial<ItemDTO>
200:    ItemDTO
```

### 6.3 Stock

```
GET /stock
Query:  ?item_id=uuid&location=string
200:    { "data": StockDTO[] }

GET /stock/summary
200:    { "data": StockSummaryDTO[] }   # aggregated across locations
```

### 6.4 Movements

```
POST /movements
Body:   MovementDTO (single)
201:    { "id": uuid }

GET /movements
Query:  ?item_id&user_id&type&from&to&page&limit
200:    { "data": MovementDTO[], "total": number }
```

### 6.5 Upload

```
POST /upload
Content-Type: multipart/form-data
Fields: file (image/jpeg), movement_id (uuid)
200:    { "url": string }
```

### 6.6 Sync (Batch)

```
POST /sync
Auth:   Bearer <token>
Body:
{
  "deviceId": "string",
  "actions": [
    {
      "actionId": "uuid",          // client-generated, idempotency key
      "type": "IN" | "OUT" | "INVENTORY_COUNT",
      "itemId": "uuid",
      "quantity": number,
      "location": "string",
      "timestamp": "ISO8601",
      "sessionId": "uuid",
      "lat": number | null,
      "lng": number | null,
      "imageKey": "string | null"  // S3 key or local upload token
    }
  ]
}

200:
{
  "synced": ["uuid", ...],
  "failed": [
    { "actionId": "uuid", "reason": "string" }
  ]
}
```

**Server behavior per action:**
1. Check idempotency: if `actionId` already in DB → return as synced (skip).
2. Validate item exists.
3. Apply stock delta within a transaction.
4. Insert movement record.
5. Commit or rollback atomically.
6. Stock quantity has `CHECK (quantity >= 0)` — OUT that would go negative → failed with `INSUFFICIENT_STOCK`.

---

## 7. Sync Engine

### 7.1 Client-Side Queue (Drift)

```dart
class SyncQueueUseCase {
  Future<void> flush() async {
    final pending = await pendingActionsDao.getUnsynced();
    if (pending.isEmpty) return;

    try {
      final result = await syncRepository.sync(pending);
      await pendingActionsDao.markSynced(result.synced);
      await _handleFailed(result.failed);
    } catch (e) {
      // Network error: schedule retry
    }
  }

  Future<void> _handleFailed(List<FailedAction> failed) async {
    for (final f in failed) {
      if (f.reason == 'INSUFFICIENT_STOCK') {
        // Notify user — cannot auto-retry
        await pendingActionsDao.markFailed(f.actionId, f.reason);
      } else {
        // Increment attempts + set nextRetryAt (exponential backoff)
        await pendingActionsDao.scheduleRetry(f.actionId);
      }
    }
  }
}
```

### 7.2 Retry Schedule

| Attempt | Delay |
|---|---|
| 1 | 5 seconds |
| 2 | 30 seconds |
| 3 | 5 minutes |
| 4 | 30 minutes |
| 5 | 2 hours |
| > 5 | Mark as DEAD — user manual review |

### 7.3 Conflict Resolution Rule

**Server is authoritative.** The client never resolves conflicts itself.

- If server rejects an action (e.g., stock inconsistency), the failure is stored locally and surfaced to the user.
- Server uses `actionId` as idempotency key — duplicate submissions are silently de-duplicated.

---

## 8. State Management

### 8.1 Providers (Riverpod)

```dart
// Auth
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) => ...);

// Scan session
final scanSessionProvider = StateNotifierProvider.autoDispose<ScanSessionNotifier, ScanSessionState>((ref) => ...);

// Connectivity
final connectivityProvider = StreamProvider<ConnectivityStatus>((ref) {
  return ref.watch(connectivityServiceProvider).statusStream;
});

// Pending actions count (badge)
final pendingCountProvider = StreamProvider<int>((ref) {
  return ref.watch(pendingActionsDaoProvider).watchUnsyncedCount();
});

// Item lookup (cached)
final itemByBarcodeProvider = FutureProvider.family<Item?, String>((ref, barcode) async {
  return ref.watch(itemRepositoryProvider).findByBarcode(barcode);
});
```

### 8.2 ScanSessionState

```dart
@freezed
class ScanSessionState with _$ScanSessionState {
  const factory ScanSessionState({
    required OperationMode mode,               // INBOUND | OUTBOUND | INVENTORY
    required List<ScannedItem> scannedItems,
    required ScanFeedback lastFeedback,        // VALID | INVALID | DUPLICATE | IDLE
    String? pickingListId,
    required bool isActive,
    String? imagePath,
  }) = _ScanSessionState;
}
```

---

## 9. Security

### 9.1 Mobile

- Tokens stored in `flutter_secure_storage` (Keychain on iOS, EncryptedSharedPreferences on Android).
- Token refresh done transparently via Dio interceptor.
- SSL pinning (optional, recommended for production): use `http_certificate_pinning`.
- Do not log barcodes or GPS coordinates.

### 9.2 Backend

```javascript
// Input validation with Zod on every route
const movementSchema = z.object({
  type: z.enum(['IN', 'OUT', 'INVENTORY_COUNT']),
  itemId: z.string().uuid(),
  quantity: z.number().int().positive(),
  timestamp: z.string().datetime(),
  lat: z.number().nullable().optional(),
  lng: z.number().nullable().optional(),
});
```

- Never trust `quantity` or `itemId` from client without DB verification.
- Rate limit login endpoint: 10 attempts / minute per IP.
- Images: validate MIME type server-side before storing (not just extension).
- Use parameterized queries only. Zero raw SQL with user input.

---

## 10. Error Handling

### 10.1 Failures (Domain Layer — Sealed Class)

```dart
sealed class Failure {
  const Failure(this.message);
  final String message;
}

class NetworkFailure    extends Failure { const NetworkFailure()   : super('No network'); }
class ServerFailure     extends Failure { const ServerFailure(super.message); }
class LocalDbFailure    extends Failure { const LocalDbFailure(super.message); }
class ValidationFailure extends Failure { const ValidationFailure(super.message); }
class AuthFailure       extends Failure { const AuthFailure()      : super('Unauthorized'); }
```

### 10.2 Use Case Return Type

```dart
typedef Result<T> = Either<Failure, T>;
// Use `fpdart` or `dartz` package
```

### 10.3 UI Error Display Rules

| Failure Type | UI Behavior |
|---|---|
| NetworkFailure | Amber banner (queued offline) |
| ValidationFailure (scan) | Red overlay flash + vibrate long |
| AuthFailure | Force logout → login screen |
| ServerFailure (sync) | Toast + retry button |
| LocalDbFailure | Critical dialog (data may be at risk) |

---

## 11. Testing

### 11.1 Flutter

```
test/
├── unit/
│   ├── domain/
│   │   ├── validate_scan_use_case_test.dart
│   │   └── sync_queue_use_case_test.dart
│   └── data/
│       └── item_repository_impl_test.dart       # mock Drift + mock API
├── widget/
│   ├── scanner_view_test.dart
│   └── inbound_screen_test.dart
└── integration/
    └── full_offline_sync_test.dart              # simulate offline → scan → sync
```

**Required coverage:** ≥ 80% on domain and application layers.

### 11.2 Backend (Jest)

```
tests/
├── unit/
│   ├── sync.service.test.js           # conflict logic
│   └── movement.service.test.js       # stock delta math
└── integration/
    ├── auth.routes.test.js
    ├── sync.routes.test.js            # full batch sync round-trip
    └── movements.routes.test.js
```

**Test database:** Separate PostgreSQL DB (`_test` suffix), migrations run before each suite.

---

## 12. Infrastructure & Deployment

### 12.1 Local Development

```bash
# Backend
cp .env.example .env
docker compose up -d postgres      # PostgreSQL on :5432
npm run migrate                    # run migrations
npm run dev                        # Fastify on :3000

# Flutter
flutter pub get
flutter run --dart-define=API_URL=http://192.168.1.10:3000
```

### 12.2 docker-compose.yml (Dev)

```yaml
version: '3.9'
services:
  postgres:
    image: postgres:15-alpine
    environment:
      POSTGRES_USER: inventory
      POSTGRES_PASSWORD: secret
      POSTGRES_DB: inventory_dev
    ports:
      - "5432:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data

  backend:
    build: ./backend
    environment:
      DATABASE_URL: postgres://inventory:secret@postgres:5432/inventory_dev
      JWT_SECRET: changeme
      PORT: 3000
    ports:
      - "3000:3000"
    depends_on:
      - postgres

volumes:
  pgdata:
```

### 12.3 Environment Variables (.env)

```
DATABASE_URL=
JWT_SECRET=
JWT_REFRESH_SECRET=
JWT_EXPIRES_IN=8h
JWT_REFRESH_EXPIRES_IN=30d
UPLOAD_DIR=./uploads
MAX_UPLOAD_SIZE_KB=1024
PORT=3000
NODE_ENV=development
```

### 12.4 Remote / Production

- **VPN:** WireGuard (mobile connects to office server).
- **Reverse proxy:** Traefik or Nginx with HTTPS.
- **Image storage:** MinIO (self-hosted S3-compatible) or AWS S3.
- **Monitoring:** Grafana + Loki (logs) or self-hosted Datadog alternative.

---

## 13. Implementation Roadmap

### Phase 1 — Foundation (Week 1–2)

- [ ] Backend: DB migrations + Fastify setup + auth endpoints
- [ ] Flutter: project structure + Drift setup + Dio client + auth screens
- [ ] Flutter: `ScannerView` widget (throttled, with feedback)
- [ ] Flutter: `MetadataCollector` service

### Phase 2 — Core Features (Week 3–4)

- [ ] INBOUND mode end-to-end (scan → local save → sync)
- [ ] OUTBOUND mode (picking list load + guided scan)
- [ ] Image capture + compression + local link
- [ ] Offline queue (PendingActions Drift table)
- [ ] `POST /sync` endpoint with idempotency

### Phase 3 — Reliability (Week 5)

- [ ] Retry engine with exponential backoff
- [ ] Sync conflict logging
- [ ] Connectivity banner
- [ ] Token refresh interceptor
- [ ] INVENTORY mode

### Phase 4 — Quality & Polish (Week 6)

- [ ] Unit + widget tests (Flutter)
- [ ] Jest integration tests (Backend)
- [ ] Performance audit: scan latency, 60 FPS validation
- [ ] Security review: input validation, token storage
- [ ] Docker Compose for production-like deploy

---

## 14. Anti-Patterns Reference

> These must NEVER appear in the codebase.

| Anti-Pattern | Why Forbidden | Correct Approach |
|---|---|---|
| `setState` in scan loop | Causes jank / frame drops | Riverpod StreamProvider or Notifier |
| Business logic in Widget | Untestable, tightly coupled | Application layer use cases |
| Raw SQL with string interpolation | SQL injection | Parameterized queries only |
| Storing JWT in SharedPreferences | Insecure on rooted devices | `flutter_secure_storage` |
| Trusting client-sent `quantity` without server check | Fraud / data corruption | Validate + apply in DB transaction |
| Snapshot-based scanning (single image) | Slow, misses items | Continuous video frame detection |
| Full image upload before sync | Blocks operation on slow network | Upload deferred, referenced by key |
| Blocking main thread for image compress | UI freeze | Use `compute()` or isolate |
| Resolving conflicts client-side | Data integrity risk | Server authoritative, conflict logged |
| No idempotency on sync | Duplicate movements on retry | `actionId` UUID idempotency key |

---

*End of Specification — v2.0*
