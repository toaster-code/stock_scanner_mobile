import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/pending_actions_table.dart';

part 'pending_actions_dao.g.dart';

@DriftAccessor(tables: [PendingActionsTable])
class PendingActionsDao extends DatabaseAccessor<AppDatabase> with _$PendingActionsDaoMixin {
  final AppDatabase db;

  PendingActionsDao(this.db) : super(db);

  Future<void> enqueue(PendingActionsTableCompanion entry) async {
    await into(pendingActionsTable).insertOnConflictUpdate(entry);
  }

  Future<List<PendingActionsTableData>> listPendingActions({int? limit, int? offset}) {
    final query = select(pendingActionsTable);
    if (offset != null) query.limit(limit ?? 100, offset: offset);
    return query.get();
  }

  Future<void> markCompleted(String actionId) async {
    await (delete(pendingActionsTable)..where((tbl) => tbl.id.equals(actionId))).go();
  }

  Future<void> purgeCompletedActions() async {
    await delete(pendingActionsTable).go();
  }
}
