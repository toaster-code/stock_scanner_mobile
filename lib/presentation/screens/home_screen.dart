import 'package:flutter/material.dart';
import '../../core/constants/app_strings.dart';
import '../../domain/entities/item.dart';
import '../providers/item_list_provider.dart';
import '../providers/scan_provider.dart';
import '../providers/stock_provider.dart';
import '../providers/sync_provider.dart';
import 'scan_screen.dart';
import 'stock_screen.dart';

class HomeScreen extends StatefulWidget {
  final ItemListProvider itemListProvider;
  final SyncProvider syncProvider;
  final ScanProvider scanProvider;
  final StockProvider stockProvider;

  const HomeScreen({
    super.key,
    required this.itemListProvider,
    required this.syncProvider,
    required this.scanProvider,
    required this.stockProvider,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.itemListProvider.addListener(_refresh);
    widget.syncProvider.addListener(_refresh);
    widget.itemListProvider.loadItems();
  }

  @override
  void dispose() {
    widget.itemListProvider.removeListener(_refresh);
    widget.syncProvider.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final provider = widget.itemListProvider;
    final sync = widget.syncProvider;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.homeTitle),
        actions: [
          IconButton(
            onPressed: sync.isSyncing ? null : sync.sync,
            icon: sync.isSyncing ? const CircularProgressIndicator(color: Colors.white) : const Icon(Icons.sync),
            tooltip: AppStrings.syncButtonLabel,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ScanScreen(scanProvider: widget.scanProvider),
                      ));
                    },
                    child: const Text(AppStrings.scanTitle),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => StockScreen(stockProvider: widget.stockProvider),
                      ));
                    },
                    child: const Text('Ver Estoque'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (sync.message != null)
              Text(sync.message!, style: const TextStyle(color: Colors.green)),
            if (provider.errorMessage != null)
              Text(provider.errorMessage!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 8),
            Expanded(child: _buildItemList(provider)),
          ],
        ),
      ),
    );
  }

  Widget _buildItemList(ItemListProvider provider) {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.items.isEmpty) {
      return const Center(child: Text(AppStrings.noItemsMessage));
    }

    return ListView.separated(
      itemCount: provider.items.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, index) => _ItemTile(item: provider.items[index]),
    );
  }
}

class _ItemTile extends StatelessWidget {
  final Item item;

  const _ItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text('Código: ${item.barcode} • Local: ${item.primaryLocation}'),
      trailing: Text(item.status.name.toUpperCase()),
    );
  }
}
