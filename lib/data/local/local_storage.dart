import '../../domain/entities/item.dart';
import '../../domain/entities/movement.dart';
import '../../domain/entities/stock_entry.dart';
import '../../domain/entities/pending_action.dart';

class LocalStorage {
  final List<Item> items = [];
  final List<Movement> movements = [];
  final List<StockEntry> stockEntries = [];
  final List<PendingAction> pendingActions = [];
}
