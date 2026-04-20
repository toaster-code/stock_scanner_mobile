import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/connectivity_service.dart';
import '../../core/providers/app_providers.dart';
import '../../domain/entities/pending_action.dart';

/// Emits [ConnectivityStatus] whenever the network state changes.
final connectivityProvider = StreamProvider<ConnectivityStatus>((ref) {
  return ref.watch(connectivityServiceProvider).statusStream;
});

/// Live count of unsynced pending actions — used for the offline badge.
final pendingCountProvider = StreamProvider<int>((ref) {
  final db = ref.watch(databaseProvider);
  return db.pendingActionsDao.watchUnsyncedCount();
});

/// All pending actions for the sync-status screen.
final allPendingActionsProvider =
    StreamProvider<List<PendingAction>>((ref) {
  return ref.watch(syncRepositoryProvider).watchAll();
});
