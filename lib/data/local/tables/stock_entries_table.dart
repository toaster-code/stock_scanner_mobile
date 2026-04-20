import 'package:drift/drift.dart';

class StockEntriesTable extends Table {
  TextColumn get id => text()();
  TextColumn get itemId => text().withLength(min: 1, max: 128)();
  RealColumn get quantity => real()();
  TextColumn get unitOfMeasure => text().withLength(min: 1, max: 32)();
  TextColumn get location => text().withLength(min: 1, max: 128)();
  DateTimeColumn get lastUpdated => dateTime()();

  @override
  Set<Column>? get primaryKey => {id};
}
