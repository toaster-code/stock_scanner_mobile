import '../entities/pending_action.dart';

abstract class SyncRepository {
  /// Add an action to the local queue.
  Future<void> enqueue(PendingAction action);

  /// All actions ready for the next sync attempt.
  Future<List<PendingAction>> getUnsyncedActions();

  /// Send [actions] to the server in one batch and handle the result.
  Future<void> syncBatch(List<PendingAction> actions);

  /// Live count of pending (not-yet-synced, not-dead) actions.
  Stream<int> watchUnsyncedCount();

  /// All actions for display in the sync-status screen.
  Stream<List<PendingAction>> watchAll();
}

