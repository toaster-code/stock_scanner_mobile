import 'package:drift/drift.dart';

class PendingActionsTable extends Table {
  TextColumn get id => text()();
  TextColumn get type => text().withLength(min: 1, max: 64)();
  TextColumn get payloadId => text().withLength(min: 1, max: 128)();
  TextColumn get payload => text().withDefault(const Constant('{}'))();
  DateTimeColumn get queuedAt => dateTime()();
  BoolColumn get requiresNetwork => boolean().withDefault(const Constant(true))();

  @override
  Set<Column>? get primaryKey => {id};
}
