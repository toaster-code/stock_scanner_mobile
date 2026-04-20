import 'package:flutter/foundation.dart';
import '../../application/stock/list_stock_entries_use_case.dart';
import '../../domain/entities/stock_entry.dart';

class StockProvider extends ChangeNotifier {
  final ListStockEntriesUseCase listStockEntriesUseCase;

  List<StockEntry> entries = [];
  bool isLoading = false;
  String? errorMessage;

  StockProvider({required this.listStockEntriesUseCase});

  Future<void> loadStock({String? location}) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      entries = await listStockEntriesUseCase.call(location: location);
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
