import '../../domain/entities/item.dart';
import '../../domain/repositories/item_repository.dart';

class GetItemByBarcodeUseCase {
  final ItemRepository repository;

  GetItemByBarcodeUseCase({required this.repository});

  Future<Item?> call(String barcode) {
    return repository.findByBarcode(barcode);
  }
}
