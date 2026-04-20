import 'package:flutter/material.dart';
import 'core/constants/app_strings.dart';
import 'data/local/database.dart';
import 'data/remote/api_client.dart';
import 'data/repositories/item_repository_impl.dart';
import 'data/repositories/movement_repository_impl.dart';
import 'data/repositories/stock_repository_impl.dart';
import 'data/repositories/sync_repository_impl.dart';
import 'application/item/get_item_by_barcode_use_case.dart';
import 'application/item/list_items_use_case.dart';
import 'application/scan/create_movement_use_case.dart';
import 'application/stock/list_stock_entries_use_case.dart';
import 'application/sync/sync_pending_actions_use_case.dart';
import 'presentation/providers/item_list_provider.dart';
import 'presentation/providers/scan_provider.dart';
import 'presentation/providers/stock_provider.dart';
import 'presentation/providers/sync_provider.dart';
import 'presentation/screens/home_screen.dart';

class StockScannerApp extends StatelessWidget {
  const StockScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final database = AppDatabase();
    final apiClient = ApiClient(baseUrl: Uri.parse('https://api.example.com'));

    final itemRepository = ItemRepositoryImpl(database: database, apiClient: apiClient);
    final movementRepository = MovementRepositoryImpl(database: database);
    final stockRepository = StockRepositoryImpl(database: database);
    final syncRepository = SyncRepositoryImpl(database: database, apiClient: apiClient);

    final listItemsUseCase = ListItemsUseCase(repository: itemRepository);
    final getItemByBarcodeUseCase = GetItemByBarcodeUseCase(repository: itemRepository);
    final createMovementUseCase = CreateMovementUseCase(repository: movementRepository, syncRepository: syncRepository);
    final listStockEntriesUseCase = ListStockEntriesUseCase(repository: stockRepository);
    final syncPendingActionsUseCase = SyncPendingActionsUseCase(repository: syncRepository);

    final itemListProvider = ItemListProvider(
      listItemsUseCase: listItemsUseCase,
      getItemByBarcodeUseCase: getItemByBarcodeUseCase,
    );

    final syncProvider = SyncProvider(syncUseCase: syncPendingActionsUseCase);
    final scanProvider = ScanProvider(createMovementUseCase: createMovementUseCase);
    final stockProvider = StockProvider(listStockEntriesUseCase: listStockEntriesUseCase);

    return MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(
        itemListProvider: itemListProvider,
        syncProvider: syncProvider,
        scanProvider: scanProvider,
        stockProvider: stockProvider,
      ),
    );
  }
}
