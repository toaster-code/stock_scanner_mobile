import '../../domain/repositories/sync_repository.dart';

class SyncPendingActionsUseCase {
  final SyncRepository repository;

  SyncPendingActionsUseCase({required this.repository});

  Future<void> call() {
    return repository.syncAll();
  }
}
