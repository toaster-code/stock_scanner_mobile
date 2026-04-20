import '../../domain/entities/stock_entry.dart';
import '../../domain/repositories/stock_repository.dart';

class UpdateStockEntryUseCase {
  final StockRepository repository;

  UpdateStockEntryUseCase({required this.repository});

  Future<void> call(StockEntry stockEntry) {
    return repository.save(stockEntry);
  }
}
