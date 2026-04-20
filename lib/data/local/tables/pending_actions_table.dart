import 'package:drift/drift.dart';

/// Local queue for operations that must be sent to the server.
///
/// Matches the spec (§4.2, §7.1).
class PendingActionsTable extends Table {
  /// Auto-increment local surrogate key.
  IntColumn get id => integer().autoIncrement()();

  /// Client-generated UUID — used as idempotency key on the server.
  TextColumn get actionId => text()();

  /// Movement type: IN | OUT | INVENTORY_COUNT
  TextColumn get type => text()();

  /// JSON blob with the full sync action payload.
  TextColumn get payload => text()();

  /// True once the server has confirmed this action.
  BoolColumn get synced =>
      boolean().withDefault(const Constant(false))();

  /// Number of sync attempts made so far.
  IntColumn get attempts =>
      integer().withDefault(const Constant(0))();

  /// queued | syncing | failed | done | dead
  TextColumn get status =>
      text().withDefault(const Constant('queued'))();

  /// Server-side rejection reason (e.g. INSUFFICIENT_STOCK).
  TextColumn get failReason => text().nullable()();

  /// When the action was first queued.
  DateTimeColumn get createdAt => dateTime()();

  /// Earliest time the next retry may be attempted (exponential backoff).
  DateTimeColumn get nextRetryAt => dateTime().nullable()();
}
