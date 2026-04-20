import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_endpoints.dart';
import '../../core/network/connectivity_service.dart';
import '../../core/network/dio_client.dart';
import '../../data/local/database.dart';
import '../../data/remote/api_client.dart';
import '../../data/repositories/item_repository_impl.dart';
import '../../data/repositories/movement_repository_impl.dart';
import '../../data/repositories/stock_repository_impl.dart';
import '../../data/repositories/sync_repository_impl.dart';
import '../../domain/repositories/item_repository.dart';
import '../../domain/repositories/movement_repository.dart';
import '../../domain/repositories/stock_repository.dart';
import '../../domain/repositories/sync_repository.dart';
import '../../application/auth/login_use_case.dart';
import '../../application/item/get_item_by_barcode_use_case.dart';
import '../../application/item/list_items_use_case.dart';
import '../../application/scan/validate_scan_use_case.dart';
import '../../application/sync/sync_queue_use_case.dart';

// ── Infrastructure ─────────────────────────────────────────────────────────

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final dioProvider = Provider<Dio>((ref) {
  return DioClient.create(baseUrl: ApiEndpoints.baseUrl);
});

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref.watch(dioProvider));
});

final connectivityServiceProvider = Provider<ConnectivityService>((ref) {
  return ConnectivityService.instance;
});

// ── Repositories ────────────────────────────────────────────────────────────

final itemRepositoryProvider = Provider<ItemRepository>((ref) {
  return ItemRepositoryImpl(
    database: ref.watch(databaseProvider),
    apiClient: ref.watch(apiClientProvider),
  );
});

final movementRepositoryProvider = Provider<MovementRepository>((ref) {
  return MovementRepositoryImpl(database: ref.watch(databaseProvider));
});

final stockRepositoryProvider = Provider<StockRepository>((ref) {
  return StockRepositoryImpl(database: ref.watch(databaseProvider));
});

final syncRepositoryProvider = Provider<SyncRepository>((ref) {
  return SyncRepositoryImpl(
    database: ref.watch(databaseProvider),
    apiClient: ref.watch(apiClientProvider),
  );
});

// ── Use cases ───────────────────────────────────────────────────────────────

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.watch(apiClientProvider));
});

final listItemsUseCaseProvider = Provider<ListItemsUseCase>((ref) {
  return ListItemsUseCase(repository: ref.watch(itemRepositoryProvider));
});

final getItemByBarcodeUseCaseProvider =
    Provider<GetItemByBarcodeUseCase>((ref) {
  return GetItemByBarcodeUseCase(
      repository: ref.watch(itemRepositoryProvider));
});

final validateScanUseCaseProvider = Provider<ValidateScanUseCase>((ref) {
  return ValidateScanUseCase(ref.watch(itemRepositoryProvider));
});

final syncQueueUseCaseProvider = Provider<SyncQueueUseCase>((ref) {
  return SyncQueueUseCase(ref.watch(syncRepositoryProvider));
});
