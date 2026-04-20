import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/providers/app_providers.dart';
import '../../providers/auth_provider.dart';
import '../../providers/scan_session_provider.dart';
import '../../widgets/connectivity_banner.dart';
import '../../widgets/feedback_overlay.dart';
import '../../widgets/scanner_view.dart';

/// Simulated picking list item (in production, load from server/local DB).
class PickingItem {
  final String itemId;
  final String name;
  final String barcode;
  final int quantityExpected;
  int quantityPicked;

  PickingItem({
    required this.itemId,
    required this.name,
    required this.barcode,
    required this.quantityExpected,
    this.quantityPicked = 0,
  });

  bool get isComplete => quantityPicked >= quantityExpected;
  bool get isOverpick => quantityPicked > quantityExpected;
}

class OutboundScreen extends ConsumerStatefulWidget {
  const OutboundScreen({super.key});

  @override
  ConsumerState<OutboundScreen> createState() => _OutboundScreenState();
}

class _OutboundScreenState extends ConsumerState<OutboundScreen> {
  late final String _sessionId;
  late final ({OperationMode mode, String sessionId}) _sessionArgs;
  bool _showScanner = false;

  /// In production this would be loaded from the server / local DB.
  final List<PickingItem> _pickingList = [];

  @override
  void initState() {
    super.initState();
    _sessionId = const Uuid().v4();
    _sessionArgs = (mode: OperationMode.outbound, sessionId: _sessionId);
  }

  Future<void> _onBarcode(String barcode) async {
    final notifier =
        ref.read(scanSessionProvider(_sessionArgs).notifier);
    final idx =
        _pickingList.indexWhere((p) => p.barcode == barcode);

    if (idx < 0) {
      // Not in picking list.
      notifier.setFeedback(ScanFeedback.invalid);
      HapticFeedback.vibrate();
      return;
    }

    final item = _pickingList[idx];
    if (item.isComplete) {
      // Overpick warning.
      notifier.setFeedback(ScanFeedback.duplicate);
      if (mounted) {
        showDialog<void>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Quantidade excedida'),
            content:
                Text('${item.name}: esperado ${item.quantityExpected}, '
                    'já separado ${item.quantityPicked}.'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'))
            ],
          ),
        );
      }
      return;
    }

    setState(() => item.quantityPicked++);
    notifier.setFeedback(ScanFeedback.valid);
  }

  bool get _allPicked =>
      _pickingList.isNotEmpty &&
      _pickingList.every((p) => p.isComplete);

  Future<void> _complete() async {
    final auth = ref.read(authProvider);
    final userId = auth.user?.id ?? 'unknown';
    final queueUseCase = ref.read(syncQueueUseCaseProvider);

    for (final p in _pickingList) {
      if (p.quantityPicked > 0) {
        await queueUseCase.enqueue(
          type: 'OUT',
          itemId: p.itemId,
          quantity: p.quantityPicked,
          location: 'DEFAULT',
          userId: userId,
          sessionId: _sessionId,
        );
      }
    }

    await queueUseCase.flush();

    if (mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Saída registrada.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(scanSessionProvider(_sessionArgs));

    return Scaffold(
      backgroundColor: AppColors.outbound.withOpacity(0.05),
      appBar: AppBar(
        backgroundColor: AppColors.outbound,
        foregroundColor: Colors.white,
        title: const Text('Saída (OUTBOUND)'),
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
                    backgroundColor: AppColors.outbound,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(44)),
                icon: Icon(_showScanner
                    ? Icons.stop
                    : Icons.qr_code_scanner),
                label: Text(_showScanner ? 'Parar' : 'Escanear'),
                onPressed: () =>
                    setState(() => _showScanner = !_showScanner),
              ),
            ),
            if (_pickingList.isEmpty)
              const Expanded(
                child: Center(
                  child: Text(
                      'Lista de separação vazia.\n'
                      'Carregue uma lista para começar.',
                      textAlign: TextAlign.center),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _pickingList.length,
                  itemBuilder: (_, i) {
                    final p = _pickingList[i];
                    return ListTile(
                      leading: Icon(
                        p.isComplete
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: p.isOverpick
                            ? Colors.orange
                            : p.isComplete
                                ? Colors.green
                                : AppColors.outbound,
                      ),
                      title: Text(
                        p.name,
                        style: TextStyle(
                          decoration: p.isComplete
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      subtitle: Text(p.barcode),
                      trailing: Text(
                        '${p.quantityPicked} / ${p.quantityExpected}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: p.isOverpick ? Colors.orange : null,
                        ),
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
              backgroundColor: AppColors.outbound,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(48),
            ),
            onPressed: _allPicked ? _complete : null,
            child: const Text('Confirmar separação'),
          ),
        ),
      ),
    );
  }
}
