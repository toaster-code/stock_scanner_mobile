import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/items_table.dart';

part 'items_dao.g.dart';

@DriftAccessor(tables: [ItemsTable])
class ItemsDao extends DatabaseAccessor<AppDatabase> with _$ItemsDaoMixin {
  final AppDatabase db;

  ItemsDao(this.db) : super(db);

  Future<ItemsTableData?> findById(String id) {
    return (select(itemsTable)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<ItemsTableData?> findByBarcode(String barcode) {
    return (select(itemsTable)..where((tbl) => tbl.barcode.equals(barcode))).getSingleOrNull();
  }

  Future<List<ItemsTableData>> listAll({int? limit, int? offset}) {
    final query = select(itemsTable);
    if (offset != null) query.limit(limit ?? 100, offset: offset);
    return query.get();
  }

  Future<void> save(ItemsTableCompanion entry) async {
    await into(itemsTable).insertOnConflictUpdate(entry);
  }

  Future<void> deleteById(String id) async {
    await (delete(itemsTable)..where((tbl) => tbl.id.equals(id))).go();
  }
}
