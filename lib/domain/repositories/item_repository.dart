import '../entities/item.dart';

abstract class ItemRepository {
  Future<Item?> findById(String id);
  Future<Item?> findByBarcode(String barcode);
  Future<List<Item>> listAll({int? limit, int? offset});
  Future<void> save(Item item);
  Future<void> delete(String id);
}
