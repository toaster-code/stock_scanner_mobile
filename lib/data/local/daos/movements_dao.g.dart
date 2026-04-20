// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movements_dao.dart';

// ignore_for_file: type=lint
mixin _$MovementsDaoMixin on DatabaseAccessor<AppDatabase> {
  $MovementsTableTable get movementsTable => attachedDatabase.movementsTable;
  MovementsDaoManager get managers => MovementsDaoManager(this);
}

class MovementsDaoManager {
  final _$MovementsDaoMixin _db;
  MovementsDaoManager(this._db);
  $$MovementsTableTableTableManager get movementsTable =>
      $$MovementsTableTableTableManager(
          _db.attachedDatabase, _db.movementsTable);
}
