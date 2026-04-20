import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/providers/app_providers.dart';
import '../../providers/auth_provider.dart';
import '../../providers/scan_session_provider.dart';
import '../../widgets/connectivity_banner.dart';
import '../../widgets/feedback_overlay.dart';
import '../../widgets/scanner_view.dart';

class InboundScreen extends ConsumerStatefulWidget {
  const InboundScreen({super.key});

  @override
  ConsumerState<InboundScreen> createState() => _InboundScreenState();
}

class _InboundScreenState extends ConsumerState<InboundScreen> {
  late final String _sessionId;
  late final ({OperationMode mode, String sessionId}) _sessionArgs;
  bool _showScanner = false;

  @override
  void initState() {
    super.initState();
    _sessionId = const Uuid().v4();
    _sessionArgs = (mode: OperationMode.inbound, sessionId: _sessionId);
  }

  Future<void> _capturePhoto() async {
    // TODO: integrate camera plugin (e.g. camera or image_picker) in a later phase.
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Captura de foto: disponível na Fase 2.')),
      );
    }
  }

  Future<void> _onBarcode(String barcode) async {
    final session = ref.read(scanSessionProvider(_sessionArgs));
    final notifier = ref.read(scanSessionProvider(_sessionArgs).notifier);

    // Duplicate check within this session.
    if (session.scannedItems.any((s) => s.barcode == barcode)) {
      notifier.setFeedback(ScanFeedback.duplicate);
      return;
    }

    final useCase = ref.read(validateScanUseCaseProvider);
    final result = await useCase.call(barcode);
    result.fold(
      (failure) => notifier.setFeedback(ScanFeedback.invalid),
      (item) {
        if (item == null) {
          notifier.setFeedback(ScanFeedback.invalid);
        } else {
          notifier.addOrIncrement(
              ScannedItem(barcode: barcode, item: item));
          notifier.setFeedback(ScanFeedback.valid);
        }
      },
    );
  }

  Future<void> _complete() async {
    final session = ref.read(scanSessionProvider(_sessionArgs));
    if (session.scannedItems.isEmpty) return;

    final auth = ref.read(authProvider);
    final userId = auth.user?.id ?? 'unknown';
    final queueUseCase = ref.read(syncQueueUseCaseProvider);

    for (final scanned in session.scannedItems) {
      await queueUseCase.enqueue(
        type: 'IN',
        itemId: scanned.item.id,
        quantity: scanned.quantity,
        location: 'DEFAULT',
        userId: userId,
        sessionId: _sessionId,
      );
    }

    // Try to flush immediately if online.
    await queueUseCase.flush();

    if (mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                '${session.scannedItems.length} item(ns) registrado(s).')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(scanSessionProvider(_sessionArgs));

    return Scaffold(
      backgroundColor: AppColors.inbound.withOpacity(0.05),
      appBar: AppBar(
        backgroundColor: AppColors.inbound,
        foregroundColor: Colors.white,
        title: const Text('Entrada (INBOUND)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            tooltip: 'Capturar foto',
            onPressed: _capturePhoto,
          ),
          if (session.imagePath != null)
            const Icon(Icons.check_circle, color: Colors.white70),
        ],
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
                    // Scan frame hint
                    Center(
                      child: Container(
                        width: 220,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.inbound,
                          foregroundColor: Colors.white),
                      icon: Icon(_showScanner
                          ? Icons.stop
                          : Icons.qr_code_scanner),
                      label: Text(_showScanner
                          ? 'Parar scanner'
                          : 'Iniciar scanner'),
                      onPressed: () =>
                          setState(() => _showScanner = !_showScanner),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: session.scannedItems.isEmpty
                  ? const Center(
                      child: Text('Nenhum item escaneado ainda.'))
                  : ListView.builder(
                      itemCount: session.scannedItems.length,
                      itemBuilder: (_, i) {
                        final s = session.scannedItems[i];
                        return ListTile(
                          leading: const Icon(Icons.qr_code,
                              color: AppColors.inbound),
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
                                      fontSize: 16)),
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
              backgroundColor: AppColors.inbound,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(48),
            ),
            onPressed: session.scannedItems.isEmpty ? null : _complete,
            child: Text(
                'Concluir (${session.scannedItems.length} item(ns))'),
          ),
        ),
      ),
    );
  }
}
