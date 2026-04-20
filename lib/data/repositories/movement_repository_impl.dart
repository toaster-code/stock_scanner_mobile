import 'dart:convert';

import 'package:drift/drift.dart';

import '../../domain/entities/movement.dart';
import '../../domain/repositories/movement_repository.dart';
import '../local/database.dart';
import '../local/daos/movements_dao.dart';

class MovementRepositoryImpl implements MovementRepository {
  final AppDatabase _database;

  MovementRepositoryImpl({required AppDatabase database}) : _database = database;

  MovementsDao get _dao => _database.movementsDao;

  @override
  Future<void> delete(String id) async {
    await _dao.deleteById(id);
  }

  @override
  Future<Movement?> findById(String id) async {
    final row = await _dao.findById(id);
    return row == null ? null : _mapRow(row);
  }

  @override
  Future<List<Movement>> listByItem(
    String itemId, {
    int? limit,
    int? offset,
  }) async {
    final rows = await _dao.listByItem(itemId, limit: limit, offset: offset);
    return rows.map(_mapRow).toList();
  }

  @override
  Future<List<Movement>> listRecent({
    int? limit,
    int? offset,
  }) async {
    final rows = await _dao.listRecent(limit: limit, offset: offset);
    return rows.map(_mapRow).toList();
  }

  @override
  Future<void> save(Movement movement) async {
    await _dao.save(MovementsTableCompanion(
      id: Value(movement.id),
      itemId: Value(movement.itemId),
      type: Value(movement.type.name),
      quantity: Value(movement.quantity),
      unitOfMeasure: Value(movement.unitOfMeasure),
      timestamp: Value(movement.timestamp),
      performedBy: Value(movement.performedBy),
      location: Value(movement.location),
      lat: Value(movement.lat),
      lng: Value(movement.lng),
      deviceId: Value(movement.deviceId),
      sessionId: Value(movement.sessionId),
      imageUrl: Value(movement.imageUrl),
      metadata: Value(jsonEncode(movement.metadata)),
    ));
  }

  Movement _mapRow(MovementsTableData row) {
    return Movement(
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
      lat: row.lat,
      lng: row.lng,
      deviceId: row.deviceId,
      sessionId: row.sessionId,
      imageUrl: row.imageUrl,
      metadata: row.metadata.isEmpty
          ? {}
          : jsonDecode(row.metadata) as Map<String, dynamic>,
    );
  }
}
