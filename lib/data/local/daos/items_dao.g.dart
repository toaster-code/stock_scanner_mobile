// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_dao.dart';

// ignore_for_file: type=lint
mixin _$ItemsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ItemsTableTable get itemsTable => attachedDatabase.itemsTable;
  ItemsDaoManager get managers => ItemsDaoManager(this);
}

class ItemsDaoManager {
  final _$ItemsDaoMixin _db;
  ItemsDaoManager(this._db);
  $$ItemsTableTableTableManager get itemsTable =>
      $$ItemsTableTableTableManager(_db.attachedDatabase, _db.itemsTable);
}
