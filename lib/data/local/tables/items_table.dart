import 'package:drift/drift.dart';

class ItemsTable extends Table {
  TextColumn get id => text()();
  TextColumn get barcode => text().withLength(min: 1, max: 128)();
  TextColumn get name => text().withLength(min: 1, max: 256)();
  TextColumn get unitOfMeasure => text().withLength(min: 1, max: 32)();
  TextColumn get primaryLocation => text().withLength(min: 1, max: 128)();
  TextColumn get status => text().withLength(min: 1, max: 64)();

  @override
  Set<Column>? get primaryKey => {id};
}
