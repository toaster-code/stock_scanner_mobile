import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/stock_entries_table.dart';

part 'stock_entries_dao.g.dart';

@DriftAccessor(tables: [StockEntriesTable])
class StockEntriesDao extends DatabaseAccessor<AppDatabase> with _$StockEntriesDaoMixin {
  final AppDatabase db;

  StockEntriesDao(this.db) : super(db);

  Future<StockEntriesTableData?> findByItemAndLocation(String itemId, String location) {
    return (select(stockEntriesTable)
          ..where((tbl) => tbl.itemId.equals(itemId) & tbl.location.equals(location)))
        .getSingleOrNull();
  }

  Future<List<StockEntriesTableData>> listCurrentStock({String? location, int? limit, int? offset}) {
    final query = select(stockEntriesTable);
    if (location != null) {
      query.where((tbl) => tbl.location.equals(location));
    }
    if (offset != null) query.limit(limit ?? 100, offset: offset);
    return query.get();
  }

  Future<void> save(StockEntriesTableCompanion entry) async {
    await into(stockEntriesTable).insertOnConflictUpdate(entry);
  }

  Future<void> deleteById(String id) async {
    await (delete(stockEntriesTable)..where((tbl) => tbl.id.equals(id))).go();
  }
}
