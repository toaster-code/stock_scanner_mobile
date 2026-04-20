import 'package:flutter/foundation.dart';
import '../../application/item/get_item_by_barcode_use_case.dart';
import '../../application/item/list_items_use_case.dart';
import '../../domain/entities/item.dart';

class ItemListProvider extends ChangeNotifier {
  final ListItemsUseCase listItemsUseCase;
  final GetItemByBarcodeUseCase getItemByBarcodeUseCase;

  List<Item> items = [];
  bool isLoading = false;
  String? errorMessage;

  ItemListProvider({
    required this.listItemsUseCase,
    required this.getItemByBarcodeUseCase,
  });

  Future<void> loadItems() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      items = await listItemsUseCase.call();
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<Item?> searchByBarcode(String barcode) async {
    try {
      return await getItemByBarcodeUseCase.call(barcode);
    } catch (error) {
      errorMessage = error.toString();
      notifyListeners();
      return null;
    }
  }
}
