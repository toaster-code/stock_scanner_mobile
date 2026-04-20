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
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            // v1 → v2: add audit columns to movements and replace
            // pending_actions table (schema completely changed).
            await m.addColumn(movementsTable, movementsTable.lat);
            await m.addColumn(movementsTable, movementsTable.lng);
            await m.addColumn(movementsTable, movementsTable.deviceId);
            await m.addColumn(movementsTable, movementsTable.sessionId);
            await m.addColumn(movementsTable, movementsTable.imageUrl);

            // Recreate pending_actions with the new schema.
            await m.drop(pendingActionsTable);
            await m.createTable(pendingActionsTable);
          }
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

