import 'dart:convert';

import 'package:uuid/uuid.dart';

import '../../domain/entities/movement.dart';
import '../../domain/entities/pending_action.dart';
import '../../domain/repositories/movement_repository.dart';
import '../../domain/repositories/sync_repository.dart';

class CreateMovementUseCase {
  final MovementRepository repository;
  final SyncRepository syncRepository;

  CreateMovementUseCase(
      {required this.repository, required this.syncRepository});

  Future<void> call(Movement movement) async {
    await repository.save(movement);

    final payload = jsonEncode({
      'itemId': movement.itemId,
      'quantity': movement.quantity.toInt(),
      'location': movement.location ?? 'DEFAULT',
      'timestamp': movement.timestamp.toUtc().toIso8601String(),
      'sessionId': movement.sessionId ?? const Uuid().v4(),
      'lat': movement.lat,
      'lng': movement.lng,
      'imageKey': movement.imageUrl,
    });

    final action = PendingAction(
      actionId: const Uuid().v4(),
      type: movement.type == MovementType.inbound
          ? 'IN'
          : movement.type == MovementType.outbound
              ? 'OUT'
              : 'INVENTORY_COUNT',
      payload: payload,
      createdAt: DateTime.now(),
    );
    await syncRepository.enqueue(action);
  }
}
