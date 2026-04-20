import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/movements_table.dart';

part 'movements_dao.g.dart';

@DriftAccessor(tables: [MovementsTable])
class MovementsDao extends DatabaseAccessor<AppDatabase> with _$MovementsDaoMixin {
  final AppDatabase db;

  MovementsDao(this.db) : super(db);

  Future<MovementsTableData?> findById(String id) {
    return (select(movementsTable)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<List<MovementsTableData>> listByItem(String itemId, {int? limit, int? offset}) {
    final query = (select(movementsTable)..where((tbl) => tbl.itemId.equals(itemId)));
    if (offset != null) query.limit(limit ?? 100, offset: offset);
    return query.get();
  }

  Future<List<MovementsTableData>> listRecent({int? limit, int? offset}) {
    final query = (select(movementsTable)..orderBy([(t) => OrderingTerm(expression: t.timestamp, mode: OrderingMode.desc)]));
    if (offset != null) query.limit(limit ?? 100, offset: offset);
    return query.get();
  }

  Future<void> save(MovementsTableCompanion entry) async {
    await into(movementsTable).insertOnConflictUpdate(entry);
  }

  Future<void> deleteById(String id) async {
    await (delete(movementsTable)..where((tbl) => tbl.id.equals(id))).go();
  }
}
