import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../providers/scan_session_provider.dart';

/// Full-screen color flash that signals the result of a scan.
///
/// | Feedback   | Color  | Duration |
/// |------------|--------|----------|
/// | valid      | green  | 300 ms   |
/// | invalid    | red    | 500 ms   |
/// | duplicate  | amber  | 400 ms   |
/// | idle       | —      | —        |
class FeedbackOverlay extends StatefulWidget {
  const FeedbackOverlay({super.key, required this.feedback});

  final ScanFeedback feedback;

  @override
  State<FeedbackOverlay> createState() => _FeedbackOverlayState();
}

class _FeedbackOverlayState extends State<FeedbackOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
  }

  @override
  void didUpdateWidget(covariant FeedbackOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.feedback != ScanFeedback.idle &&
        widget.feedback != oldWidget.feedback) {
      final ms = _durationFor(widget.feedback);
      _ctrl.duration = Duration(milliseconds: ms);
      _ctrl.forward(from: 0).then((_) => _ctrl.reverse());
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  static int _durationFor(ScanFeedback f) => switch (f) {
        ScanFeedback.valid => 300,
        ScanFeedback.invalid => 500,
        ScanFeedback.duplicate => 400,
        ScanFeedback.idle => 0,
      };

  static Color _colorFor(ScanFeedback f) => switch (f) {
        ScanFeedback.valid => AppColors.validScan,
        ScanFeedback.invalid => AppColors.invalidScan,
        ScanFeedback.duplicate => AppColors.duplicateScan,
        ScanFeedback.idle => Colors.transparent,
      };

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) => IgnorePointer(
        child: Container(
          color: _colorFor(widget.feedback).withOpacity(_anim.value * 0.45),
        ),
      ),
    );
  }
}
