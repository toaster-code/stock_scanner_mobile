import 'package:drift/drift.dart';

import '../../domain/entities/item.dart';
import '../../domain/repositories/item_repository.dart';
import '../local/database.dart';
import '../local/daos/items_dao.dart';
import '../remote/api_client.dart';

class ItemRepositoryImpl implements ItemRepository {
  final AppDatabase _database;
  final ApiClient _apiClient;

  ItemRepositoryImpl({required AppDatabase database, required ApiClient apiClient})
      : _database = database,
        _apiClient = apiClient;

  ItemsDao get _dao => _database.itemsDao;

  @override
  Future<void> delete(String id) async {
    await _dao.deleteById(id);
  }

  @override
  Future<Item?> findByBarcode(String barcode) async {
    final row = await _dao.findByBarcode(barcode);
    return row == null ? null : _mapRow(row);
  }

  @override
  Future<Item?> findById(String id) async {
    final row = await _dao.findById(id);
    return row == null ? null : _mapRow(row);
  }

  @override
  Future<List<Item>> listAll({int? limit, int? offset}) async {
    final rows = await _dao.listAll(limit: limit, offset: offset);
    return rows.map(_mapRow).toList();
  }

  @override
  Future<void> save(Item item) async {
    await _dao.save(ItemsTableCompanion(
      id: Value(item.id),
      barcode: Value(item.barcode),
      name: Value(item.name),
      unitOfMeasure: Value(item.unitOfMeasure),
      primaryLocation: Value(item.primaryLocation),
      status: Value(item.status.name),
    ));
  }

  Future<void> refreshFromRemote() async {
    final remoteItems = await _apiClient.fetchItems();
    for (final dto in remoteItems) {
      final item = dto.toEntity();
      await save(item);
    }
  }

  Item _mapRow(ItemsTableData row) {
    return Item(
      id: row.id,
      barcode: row.barcode,
      name: row.name,
      unitOfMeasure: row.unitOfMeasure,
      primaryLocation: row.primaryLocation,
      status: ItemStatus.values.firstWhere(
        (status) => status.name == row.status,
        orElse: () => ItemStatus.active,
      ),
    );
  }
}
