import '../entities/stock_entry.dart';

abstract class StockRepository {
  Future<StockEntry?> findByItemAndLocation(
    String itemId,
    String location,
  );

  Future<List<StockEntry>> listCurrentStock({
    String? location,
    int? limit,
    int? offset,
  });

  Future<void> save(StockEntry stockEntry);

  Future<void> delete(String id);
}
