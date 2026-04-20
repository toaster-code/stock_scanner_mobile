import 'package:flutter/material.dart';
import '../providers/stock_provider.dart';

class StockScreen extends StatefulWidget {
  final StockProvider stockProvider;

  const StockScreen({super.key, required this.stockProvider});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  @override
  void initState() {
    super.initState();
    widget.stockProvider.addListener(_refresh);
    widget.stockProvider.loadStock();
  }

  @override
  void dispose() {
    widget.stockProvider.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final provider = widget.stockProvider;

    return Scaffold(
      appBar: AppBar(title: const Text('Estoque Atual')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (provider.errorMessage != null)
              Text(provider.errorMessage!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 8),
            Expanded(child: _buildStockList(provider)),
          ],
        ),
      ),
    );
  }

  Widget _buildStockList(StockProvider provider) {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.entries.isEmpty) {
      return const Center(child: Text('Nenhum registro de estoque disponível.'));
    }

    return ListView.separated(
      itemCount: provider.entries.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, index) {
        final entry = provider.entries[index];
        return ListTile(
          title: Text('Item: ${entry.itemId}'),
          subtitle: Text('Local: ${entry.location} • Quantidade: ${entry.quantity} ${entry.unitOfMeasure}'),
          trailing: Text(entry.lastUpdated.toLocal().toString()),
        );
      },
    );
  }
}
