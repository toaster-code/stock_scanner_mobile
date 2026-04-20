import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/items_table.dart';
import 'tables/movements_table.dart';
import 'tables/stock_entries_table.dart';
import 'tables/pending_actions_table.dart';
import 'daos/items_dao.dart';
import 'daos/movements_dao.dart';
import 'daos/stock_entries_dao.dart';
import 'daos/pending_actions_dao.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [ItemsTable, MovementsTable, StockEntriesTable, PendingActionsTable],
  daos: [ItemsDao, MovementsDao, StockEntriesDao, PendingActionsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'stock_scanner.sqlite'));
    return NativeDatabase(file);
  });
}
