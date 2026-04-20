import 'package:drift/drift.dart';

/// Local audit log for all stock movements.
class MovementsTable extends Table {
  TextColumn get id => text()();
  TextColumn get itemId => text()();

  /// IN | OUT | INVENTORY_COUNT
  TextColumn get type => text()();
  RealColumn get quantity => real()();
  TextColumn get unitOfMeasure => text()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get performedBy => text()();
  TextColumn get location => text().nullable()();

  // ── Audit / metadata fields (added in schema v2) ──────────────────
  RealColumn get lat => real().nullable()();
  RealColumn get lng => real().nullable()();
  TextColumn get deviceId => text().nullable()();
  TextColumn get sessionId => text().nullable()();
  TextColumn get imageUrl => text().nullable()();

  /// Arbitrary JSON for extensibility.
  TextColumn get metadata =>
      text().withDefault(const Constant('{}'))();

  @override
  Set<Column>? get primaryKey => {id};
}
