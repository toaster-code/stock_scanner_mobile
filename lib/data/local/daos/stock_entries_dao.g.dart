// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_entries_dao.dart';

// ignore_for_file: type=lint
mixin _$StockEntriesDaoMixin on DatabaseAccessor<AppDatabase> {
  $StockEntriesTableTable get stockEntriesTable =>
      attachedDatabase.stockEntriesTable;
  StockEntriesDaoManager get managers => StockEntriesDaoManager(this);
}

class StockEntriesDaoManager {
  final _$StockEntriesDaoMixin _db;
  StockEntriesDaoManager(this._db);
  $$StockEntriesTableTableTableManager get stockEntriesTable =>
      $$StockEntriesTableTableTableManager(
          _db.attachedDatabase, _db.stockEntriesTable);
}
