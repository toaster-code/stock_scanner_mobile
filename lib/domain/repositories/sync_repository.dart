import '../entities/pending_action.dart';

abstract class SyncRepository {
  Future<void> enqueuePendingAction(PendingAction action);

  Future<List<PendingAction>> listPendingActions({
    int? limit,
    int? offset,
  });

  Future<void> markActionCompleted(String actionId);

  Future<void> purgeCompletedActions();

  Future<void> syncAll();
}
