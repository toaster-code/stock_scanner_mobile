import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/utils/barcode_throttle.dart';

/// Reusable full-screen barcode scanner widget.
///
/// Uses [MobileScanner] for continuous video-frame detection with a 300ms
/// throttle ([BarcodeThrottle]) between accepted scans.
class ScannerView extends ConsumerStatefulWidget {
  const ScannerView({
    super.key,
    required this.onDetect,
    this.overlay,
  });

  /// Called with the raw barcode string for every accepted scan.
  final void Function(String barcode) onDetect;

  /// Optional widget drawn on top of the camera feed (e.g. scan frame, label).
  final Widget? overlay;

  @override
  ConsumerState<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends ConsumerState<ScannerView> {
  late final MobileScannerController _controller;
  final BarcodeThrottle _throttle = BarcodeThrottle();
  bool _torchOn = false;

  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController(
      formats: const [BarcodeFormat.all],
      detectionSpeed: DetectionSpeed.normal,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    final barcode = capture.barcodes.firstOrNull?.rawValue;
    if (barcode == null) return;
    if (_throttle.shouldProcess(barcode)) {
      widget.onDetect(barcode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MobileScanner(
          controller: _controller,
          onDetect: _onDetect,
        ),
        if (widget.overlay != null) widget.overlay!,
        // Torch toggle
        Positioned(
          bottom: 24,
          right: 24,
          child: FloatingActionButton.small(
            heroTag: 'torch',
            backgroundColor: Colors.black54,
            onPressed: () async {
              await _controller.toggleTorch();
              setState(() => _torchOn = !_torchOn);
            },
            child: Icon(
              _torchOn ? Icons.flash_on : Icons.flash_off,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
