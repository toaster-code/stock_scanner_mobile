import '../../domain/entities/movement.dart';
import '../../domain/entities/pending_action.dart';
import '../../domain/repositories/movement_repository.dart';
import '../../domain/repositories/sync_repository.dart';

class CreateMovementUseCase {
  final MovementRepository repository;
  final SyncRepository syncRepository;

  CreateMovementUseCase({required this.repository, required this.syncRepository});

  Future<void> call(Movement movement) async {
    await repository.save(movement);
    final action = PendingAction(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      type: PendingActionType.createMovement,
      payloadId: movement.id,
      queuedAt: DateTime.now(),
      requiresNetwork: true,
    );
    await syncRepository.enqueuePendingAction(action);
  }
}
