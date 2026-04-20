import 'package:drift/drift.dart';

class MovementsTable extends Table {
  TextColumn get id => text()();
  TextColumn get itemId => text().withLength(min: 1, max: 128)();
  TextColumn get type => text().withLength(min: 1, max: 64)();
  RealColumn get quantity => real()();
  TextColumn get unitOfMeasure => text().withLength(min: 1, max: 32)();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get performedBy => text().withLength(min: 1, max: 128)();
  TextColumn get location => text().nullable().withLength(min: 1, max: 128)();
  TextColumn get metadata => text().withDefault(const Constant('{}'))();

  @override
  Set<Column>? get primaryKey => {id};
}
