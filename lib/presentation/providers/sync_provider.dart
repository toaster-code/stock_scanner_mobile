import 'package:flutter/foundation.dart';
import '../../application/sync/sync_pending_actions_use_case.dart';

class SyncProvider extends ChangeNotifier {
  final SyncPendingActionsUseCase syncUseCase;

  bool isSyncing = false;
  String? message;

  SyncProvider({required this.syncUseCase});

  Future<void> sync() async {
    isSyncing = true;
    message = null;
    notifyListeners();

    try {
      await syncUseCase.call();
      message = 'Sincronização concluída.';
    } catch (error) {
      message = 'Falha ao sincronizar: $error';
    } finally {
      isSyncing = false;
      notifyListeners();
    }
  }
}
