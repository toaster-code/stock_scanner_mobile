import 'package:flutter/material.dart';
import '../../core/constants/app_strings.dart';
import '../../domain/entities/movement.dart';
import '../providers/scan_provider.dart';

class ScanScreen extends StatefulWidget {
  final ScanProvider scanProvider;

  const ScanScreen({super.key, required this.scanProvider});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final TextEditingController _barcodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.scanProvider.addListener(_refresh);
  }

  @override
  void dispose() {
    widget.scanProvider.removeListener(_refresh);
    _barcodeController.dispose();
    super.dispose();
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  void _submit() {
    final barcode = _barcodeController.text.trim();
    if (barcode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Informe o código de barras.')),
      );
      return;
    }

    final movement = Movement(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      itemId: barcode,
      type: MovementType.inbound,
      quantity: 1.0,
      unitOfMeasure: 'UN',
      timestamp: DateTime.now(),
      performedBy: 'operador',
      location: 'desconhecido',
    );

    widget.scanProvider.submitMovement(movement);
  }

  @override
  Widget build(BuildContext context) {
    final provider = widget.scanProvider;

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.scanTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Simulação de scan de movimento.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            TextField(
              controller: _barcodeController,
              decoration: const InputDecoration(
                labelText: 'Código de barras',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: provider.isSubmitting ? null : _submit,
              child: provider.isSubmitting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : const Text('Registrar movimento'),
            ),
            if (provider.resultMessage != null) ...[
              const SizedBox(height: 16),
              Text(provider.resultMessage!, style: const TextStyle(fontSize: 14)),
            ],
          ],
        ),
      ),
    );
  }
}
