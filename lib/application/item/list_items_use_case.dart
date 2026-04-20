import '../../domain/entities/item.dart';
import '../../domain/repositories/item_repository.dart';

class ListItemsUseCase {
  final ItemRepository repository;

  ListItemsUseCase({required this.repository});

  Future<List<Item>> call({int? limit, int? offset}) {
    return repository.listAll(limit: limit, offset: offset);
  }
}
