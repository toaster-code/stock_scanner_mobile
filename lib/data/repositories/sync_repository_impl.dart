import 'dart:convert';

import 'package:drift/drift.dart';

import '../../domain/entities/movement.dart';
import '../../domain/entities/pending_action.dart';
import '../../domain/repositories/sync_repository.dart';
import '../local/database.dart';
import '../local/daos/pending_actions_dao.dart';
import '../remote/api_client.dart';
import '../remote/dtos/movement_dto.dart';
import '../remote/dtos/pending_action_dto.dart';

class SyncRepositoryImpl implements SyncRepository {
  final AppDatabase _database;
  final ApiClient _apiClient;

  SyncRepositoryImpl({required AppDatabase database, required ApiClient apiClient})
      : _database = database,
        _apiClient = apiClient;

  PendingActionsDao get _dao => _database.pendingActionsDao;

  @override
  Future<void> enqueuePendingAction(PendingAction action) async {
    await _dao.enqueue(PendingActionsTableCompanion(
      id: Value(action.id),
      type: Value(action.type.name),
      payloadId: Value(action.payloadId),
      queuedAt: Value(action.queuedAt),
      requiresNetwork: Value(action.requiresNetwork),
    ));
  }

  @override
  Future<List<PendingAction>> listPendingActions({int? limit, int? offset}) async {
    final rows = await _dao.listPendingActions(limit: limit, offset: offset);
    return rows.map(_mapRow).toList();
  }

  @override
  Future<void> markActionCompleted(String actionId) async {
    await _dao.markCompleted(actionId);
  }

  @override
  Future<void> purgeCompletedActions() async {
    await _dao.purgeCompletedActions();
  }

  @override
  Future<void> syncAll() async {
    final rows = await _dao.listPendingActions();
    for (final row in rows) {
      final action = _mapRow(row);

      if (action.type == PendingActionType.createMovement) {
        final row = await _database.movementsDao.findById(action.payloadId);
        if (row != null) {
          final movement = Movement(
            id: row.id,
            itemId: row.itemId,
            type: MovementType.values.firstWhere(
              (type) => type.name == row.type,
              orElse: () => MovementType.inventory,
            ),
            quantity: row.quantity,
            unitOfMeasure: row.unitOfMeasure,
            timestamp: row.timestamp,
            performedBy: row.performedBy,
            location: row.location,
            metadata: row.metadata.isEmpty ? const {} : jsonDecode(row.metadata) as Map<String, dynamic>,
          );
          final movementDto = MovementDto.fromEntity(movement);
          await _apiClient.postMovement(movementDto);
        }
      } else {
        final dto = PendingActionDto.fromEntity(action);
        await _apiClient.syncPendingAction(dto);
      }

      await _dao.markCompleted(action.id);
    }
  }

  PendingAction _mapRow(PendingActionsTableData row) {
    return PendingAction(
      id: row.id,
      type: PendingActionType.values.firstWhere(
        (type) => type.name == row.type,
        orElse: () => PendingActionType.createMovement,
      ),
      payloadId: row.payloadId,
      queuedAt: row.queuedAt,
      requiresNetwork: row.requiresNetwork,
    );
  }
}
