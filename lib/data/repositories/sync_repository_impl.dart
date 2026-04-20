import 'dart:convert';

import 'package:drift/drift.dart';

import '../../domain/entities/pending_action.dart';
import '../../domain/repositories/sync_repository.dart';
import '../local/database.dart';
import '../local/daos/pending_actions_dao.dart';
import '../remote/api_client.dart';
import '../remote/dtos/sync_payload_dto.dart';
import '../../core/utils/metadata_collector.dart';

class SyncRepositoryImpl implements SyncRepository {
  final AppDatabase _database;
  final ApiClient _apiClient;

  SyncRepositoryImpl({
    required AppDatabase database,
    required ApiClient apiClient,
  })  : _database = database,
        _apiClient = apiClient;

  PendingActionsDao get _dao => _database.pendingActionsDao;

  // ── Enqueue ────────────────────────────────────────────────────────────────

  @override
  Future<void> enqueue(PendingAction action) async {
    await _dao.enqueue(PendingActionsTableCompanion(
      actionId: Value(action.actionId),
      type: Value(action.type),
      payload: Value(action.payload),
      synced: Value(action.synced),
      attempts: Value(action.attempts),
      status: Value(action.status.name),
      failReason: Value(action.failReason),
      createdAt: Value(action.createdAt),
      nextRetryAt: Value(action.nextRetryAt),
    ));
  }

  // ── Read ───────────────────────────────────────────────────────────────────

  @override
  Future<List<PendingAction>> getUnsyncedActions() async {
    final rows = await _dao.getUnsynced();
    return rows.map(_mapRow).toList();
  }

  @override
  Stream<int> watchUnsyncedCount() => _dao.watchUnsyncedCount();

  @override
  Stream<List<PendingAction>> watchAll() =>
      _dao.watchAll().map((rows) => rows.map(_mapRow).toList());

  // ── Sync batch ─────────────────────────────────────────────────────────────

  @override
  Future<void> syncBatch(List<PendingAction> actions) async {
    if (actions.isEmpty) return;

    final deviceId = await MetadataCollector.instance.getDeviceId();

    final syncActions = actions.map((a) {
      final Map<String, dynamic> p =
          jsonDecode(a.payload) as Map<String, dynamic>;
      return SyncActionDto(
        actionId: a.actionId,
        type: a.type,
        itemId: p['itemId'] as String,
        quantity: (p['quantity'] as num).toInt(),
        location: (p['location'] as String?) ?? 'DEFAULT',
        timestamp: p['timestamp'] as String,
        sessionId: p['sessionId'] as String,
        lat: (p['lat'] as num?)?.toDouble(),
        lng: (p['lng'] as num?)?.toDouble(),
        imageKey: p['imageKey'] as String?,
      );
    }).toList();

    final result = await _apiClient.sync(
      SyncPayloadDto(deviceId: deviceId, actions: syncActions),
    );

    // Mark successes.
    await _dao.markSynced(result.synced);

    // Handle failures.
    for (final failure in result.failed) {
      if (failure.reason == 'INSUFFICIENT_STOCK') {
        // Cannot auto-retry — surface to operator.
        await _dao.markFailed(failure.actionId, failure.reason);
      } else {
        // Schedule retry with exponential backoff.
        await _dao.scheduleRetry(failure.actionId);
      }
    }
  }

  // ── Mapping ────────────────────────────────────────────────────────────────

  PendingAction _mapRow(PendingActionsTableData row) => PendingAction(
        localId: row.id,
        actionId: row.actionId,
        type: row.type,
        payload: row.payload,
        synced: row.synced,
        attempts: row.attempts,
        status: PendingActionStatus.values.firstWhere(
          (s) => s.name == row.status,
          orElse: () => PendingActionStatus.queued,
        ),
        failReason: row.failReason,
        createdAt: row.createdAt,
        nextRetryAt: row.nextRetryAt,
      );
}

