import '../../domain/repositories/sync_repository.dart';

/// Legacy use case kept for backward compatibility.
/// Prefer [SyncQueueUseCase] for new code.
class SyncPendingActionsUseCase {
  final SyncRepository repository;

  SyncPendingActionsUseCase({required this.repository});

  Future<void> call() async {
    final pending = await repository.getUnsyncedActions();
    if (pending.isEmpty) return;
    await repository.syncBatch(pending);
  }
}
