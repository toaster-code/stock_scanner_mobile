import '../../domain/entities/stock_entry.dart';
import '../../domain/repositories/stock_repository.dart';

class ListStockEntriesUseCase {
  final StockRepository repository;

  ListStockEntriesUseCase({required this.repository});

  Future<List<StockEntry>> call({String? location, int? limit, int? offset}) {
    return repository.listCurrentStock(location: location, limit: limit, offset: offset);
  }
}
