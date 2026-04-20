import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/pending_action.dart';
import '../../domain/repositories/sync_repository.dart';

/// Enqueues a movement as a [PendingAction] and optionally triggers a flush.
class SyncQueueUseCase {
  final SyncRepository _syncRepository;

  SyncQueueUseCase(this._syncRepository);

  /// Adds one movement action to the queue.
  Future<Result<void>> enqueue({
    required String type, // IN | OUT | INVENTORY_COUNT
    required String itemId,
    required int quantity,
    required String location,
    required String userId,
    required String sessionId,
    double? lat,
    double? lng,
    String? imageKey,
  }) async {
    try {
      final actionId = const Uuid().v4();
      final payload = jsonEncode({
        'itemId': itemId,
        'quantity': quantity,
        'location': location,
        'timestamp': DateTime.now().toUtc().toIso8601String(),
        'sessionId': sessionId,
        'lat': lat,
        'lng': lng,
        'imageKey': imageKey,
      });
      await _syncRepository.enqueue(PendingAction(
        actionId: actionId,
        type: type,
        payload: payload,
        createdAt: DateTime.now(),
      ));
      return const Right(null);
    } catch (e) {
      return Left(LocalDbFailure(e.toString()));
    }
  }

  /// Flushes all pending actions to the server.
  ///
  /// Network errors are caught here; per-action failures are persisted by
  /// [SyncRepositoryImpl.syncBatch] (with retry scheduling).
  Future<Result<void>> flush() async {
    try {
      final pending = await _syncRepository.getUnsyncedActions();
      if (pending.isEmpty) return const Right(null);
      await _syncRepository.syncBatch(pending);
      return const Right(null);
    } catch (e) {
      return Left(NetworkFailure());
    }
  }
}
