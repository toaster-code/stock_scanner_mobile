import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/pending_actions_table.dart';

part 'pending_actions_dao.g.dart';

/// Retry delay schedule (seconds): 5s, 30s, 5m, 30m, 2h.
const _retryDelays = [5, 30, 300, 1800, 7200];

@DriftAccessor(tables: [PendingActionsTable])
class PendingActionsDao extends DatabaseAccessor<AppDatabase>
    with _$PendingActionsDaoMixin {
  final AppDatabase db;

  PendingActionsDao(this.db) : super(db);

  // ── Write ──────────────────────────────────────────────────────────────────

  Future<void> enqueue(PendingActionsTableCompanion entry) async {
    await into(pendingActionsTable).insertOnConflictUpdate(entry);
  }

  Future<void> markSynced(List<String> actionIds) async {
    if (actionIds.isEmpty) return;
    await (update(pendingActionsTable)
          ..where((t) => t.actionId.isIn(actionIds)))
        .write(const PendingActionsTableCompanion(
      synced: Value(true),
      status: Value('done'),
    ));
  }

  Future<void> markFailed(String actionId, String reason) async {
    await (update(pendingActionsTable)
          ..where((t) => t.actionId.equals(actionId)))
        .write(PendingActionsTableCompanion(
      status: const Value('failed'),
      failReason: Value(reason),
    ));
  }

  Future<void> scheduleRetry(String actionId) async {
    final row = await (select(pendingActionsTable)
          ..where((t) => t.actionId.equals(actionId)))
        .getSingleOrNull();
    if (row == null) return;

    final attempts = row.attempts + 1;

    if (attempts > _retryDelays.length) {
      // Mark as dead — requires manual operator review.
      await (update(pendingActionsTable)
            ..where((t) => t.actionId.equals(actionId)))
          .write(PendingActionsTableCompanion(
        attempts: Value(attempts),
        status: const Value('dead'),
      ));
    } else {
      final delay = _retryDelays[attempts - 1];
      final nextRetry = DateTime.now().add(Duration(seconds: delay));
      await (update(pendingActionsTable)
            ..where((t) => t.actionId.equals(actionId)))
          .write(PendingActionsTableCompanion(
        attempts: Value(attempts),
        status: const Value('queued'),
        nextRetryAt: Value(nextRetry),
      ));
    }
  }

  Future<void> purgeCompleted() async {
    await (delete(pendingActionsTable)
          ..where((t) => t.status.isIn(['done'])))
        .go();
  }

  // ── Read ───────────────────────────────────────────────────────────────────

  Future<List<PendingActionsTableData>> getUnsynced() {
    final now = DateTime.now();
    return (select(pendingActionsTable)
          ..where((t) =>
              t.synced.equals(false) &
              t.status.isNotIn(['dead', 'done']) &
              (t.nextRetryAt.isNull() |
                  t.nextRetryAt.isSmallerOrEqualValue(now))))
        .get();
  }

  Future<List<PendingActionsTableData>> listAll() =>
      select(pendingActionsTable).get();

  Stream<int> watchUnsyncedCount() {
    final countExp = pendingActionsTable.id.count();
    return (selectOnly(pendingActionsTable)
          ..addColumns([countExp])
          ..where(pendingActionsTable.synced.equals(false) &
              pendingActionsTable.status.isNotIn(['dead', 'done'])))
        .map((row) => row.read(countExp) ?? 0)
        .watchSingle();
  }

  Stream<List<PendingActionsTableData>> watchAll() =>
      (select(pendingActionsTable)
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
          .watch();
}

