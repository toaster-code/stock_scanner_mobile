import 'package:fpdart/fpdart.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/item.dart';
import '../../domain/repositories/item_repository.dart';

/// Looks up an [Item] by [barcode] and validates that the scan is acceptable.
///
/// Returns:
///  - [Right<Item>] when the item is found and active.
///  - [Right<null>] when the barcode is unknown (operator sees a warning).
///  - [Left<ValidationFailure>] for an empty/malformed barcode.
///  - [Left<LocalDbFailure>] on DB errors.
class ValidateScanUseCase {
  final ItemRepository _itemRepository;

  ValidateScanUseCase(this._itemRepository);

  Future<Result<Item?>> call(String barcode) async {
    final trimmed = barcode.trim();
    if (trimmed.isEmpty) {
      return Left(const ValidationFailure('Código de barras inválido.'));
    }
    try {
      final item = await _itemRepository.findByBarcode(trimmed);
      if (item != null && item.status == ItemStatus.inactive) {
        return Left(const ValidationFailure('Item inativo.'));
      }
      return Right(item);
    } catch (e) {
      return Left(LocalDbFailure(e.toString()));
    }
  }
}
