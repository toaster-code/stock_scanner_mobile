import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/providers/app_providers.dart';
import '../../../domain/entities/item.dart';
import '../../providers/auth_provider.dart';
import '../../providers/scan_session_provider.dart';
import '../../widgets/connectivity_banner.dart';
import '../../widgets/feedback_overlay.dart';
import '../../widgets/scanner_view.dart';

class InventoryScreen extends ConsumerStatefulWidget {
  const InventoryScreen({super.key});

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen> {
  late final String _sessionId;
  late final ({OperationMode mode, String sessionId}) _sessionArgs;
  bool _showScanner = false;

  @override
  void initState() {
    super.initState();
    _sessionId = const Uuid().v4();
    _sessionArgs = (mode: OperationMode.inventory, sessionId: _sessionId);
  }

  Future<void> _onBarcode(String barcode) async {
    final notifier =
        ref.read(scanSessionProvider(_sessionArgs).notifier);

    // Free-scan: any barcode is accepted; look up item (optional).
    final useCase = ref.read(validateScanUseCaseProvider);
    final result = await useCase.call(barcode);

    final item = result.fold(
      (_) => null,
      (i) => i,
    ) ?? Item(
          id: barcode,
          name: 'Desconhecido ($barcode)',
          barcode: barcode,
          unitOfMeasure: 'pcs',
          primaryLocation: 'DEFAULT',
          status: ItemStatus.active,
        );

    notifier.addOrIncrement(ScannedItem(barcode: barcode, item: item));
    notifier.setFeedback(ScanFeedback.valid);
  }

  Future<void> _finalize() async {
    final session = ref.read(scanSessionProvider(_sessionArgs));
    if (session.scannedItems.isEmpty) return;

    final auth = ref.read(authProvider);
    final userId = auth.user?.id ?? 'unknown';
    final queueUseCase = ref.read(syncQueueUseCaseProvider);

    for (final scanned in session.scannedItems) {
      await queueUseCase.enqueue(
        type: 'INVENTORY_COUNT',
        itemId: scanned.item.id,
        quantity: scanned.quantity,
        location: 'DEFAULT',
        userId: userId,
        sessionId: _sessionId,
      );
    }

    await queueUseCase.flush();

    if (mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Contagem de ${session.scannedItems.length} item(ns) registrada.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(scanSessionProvider(_sessionArgs));

    return Scaffold(
      backgroundColor: AppColors.inventory.withOpacity(0.05),
      appBar: AppBar(
        backgroundColor: AppColors.inventory,
        foregroundColor: Colors.black87,
        title: const Text('Inventário'),
      ),
      body: ConnectivityBanner(
        child: Column(
          children: [
            if (_showScanner)
              SizedBox(
                height: 260,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ScannerView(onDetect: _onBarcode),
                    FeedbackOverlay(feedback: session.lastFeedback),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 8),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.inventory,
                    foregroundColor: Colors.black87,
                    minimumSize: const Size.fromHeight(44)),
                icon: Icon(_showScanner
                    ? Icons.stop
                    : Icons.qr_code_scanner),
                label: Text(_showScanner
                    ? 'Parar scanner'
                    : 'Iniciar contagem'),
                onPressed: () =>
                    setState(() => _showScanner = !_showScanner),
              ),
            ),
            Expanded(
              child: session.scannedItems.isEmpty
                  ? const Center(
                      child: Text('Nenhum item contado ainda.'))
                  : ListView.builder(
                      itemCount: session.scannedItems.length,
                      itemBuilder: (_, i) {
                        final s = session.scannedItems[i];
                        return ListTile(
                          leading: const Icon(Icons.inventory_2,
                              color: AppColors.inventory),
                          title: Text(s.item.name),
                          subtitle: Text(s.barcode),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () => ref
                                    .read(scanSessionProvider(
                                            _sessionArgs)
                                        .notifier)
                                    .adjustQuantity(s.barcode, -1),
                              ),
                              Text('${s.quantity}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () => ref
                                    .read(scanSessionProvider(
                                            _sessionArgs)
                                        .notifier)
                                    .adjustQuantity(s.barcode, 1),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.inventory,
              foregroundColor: Colors.black87,
              minimumSize: const Size.fromHeight(48),
            ),
            onPressed:
                session.scannedItems.isEmpty ? null : _finalize,
            child: Text(
                'Finalizar contagem (${session.scannedItems.length})'),
          ),
        ),
      ),
    );
  }
}
