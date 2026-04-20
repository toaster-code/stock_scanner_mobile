import '../entities/movement.dart';

abstract class MovementRepository {
  Future<Movement?> findById(String id);

  Future<List<Movement>> listByItem(
    String itemId, {
    int? limit,
    int? offset,
  });

  Future<List<Movement>> listRecent({
    int? limit,
    int? offset,
  });

  Future<void> save(Movement movement);

  Future<void> delete(String id);
}
