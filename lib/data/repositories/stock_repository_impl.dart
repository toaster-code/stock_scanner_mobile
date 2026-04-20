import 'package:drift/drift.dart';

import '../../domain/entities/stock_entry.dart';
import '../../domain/repositories/stock_repository.dart';
import '../local/database.dart';
import '../local/daos/stock_entries_dao.dart';

class StockRepositoryImpl implements StockRepository {
  final AppDatabase _database;

  StockRepositoryImpl({required AppDatabase database}) : _database = database;

  StockEntriesDao get _dao => _database.stockEntriesDao;

  @override
  Future<void> delete(String id) async {
    await _dao.deleteById(id);
  }

  @override
  Future<StockEntry?> findByItemAndLocation(String itemId, String location) async {
    final row = await _dao.findByItemAndLocation(itemId, location);
    return row == null ? null : _mapRow(row);
  }

  @override
  Future<List<StockEntry>> listCurrentStock({
    String? location,
    int? limit,
    int? offset,
  }) async {
    final rows = await _dao.listCurrentStock(location: location, limit: limit, offset: offset);
    return rows.map(_mapRow).toList();
  }

  @override
  Future<void> save(StockEntry stockEntry) async {
    await _dao.save(StockEntriesTableCompanion(
      id: Value(stockEntry.id),
      itemId: Value(stockEntry.itemId),
      quantity: Value(stockEntry.quantity),
      unitOfMeasure: Value(stockEntry.unitOfMeasure),
      location: Value(stockEntry.location),
      lastUpdated: Value(stockEntry.lastUpdated),
    ));
  }

  StockEntry _mapRow(StockEntriesTableData row) {
    return StockEntry(
      id: row.id,
      itemId: row.itemId,
      quantity: row.quantity,
      unitOfMeasure: row.unitOfMeasure,
      location: row.location,
      lastUpdated: row.lastUpdated,
    );
  }
}
