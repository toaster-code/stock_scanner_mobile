import 'package:flutter/material.dart';

/// Centralised colour palette for the app.
class AppColors {
  AppColors._();

  /// INBOUND mode — blue
  static const Color inbound = Color(0xFF1976D2);

  /// OUTBOUND mode — red
  static const Color outbound = Color(0xFFD32F2F);

  /// INVENTORY mode — yellow/amber
  static const Color inventory = Color(0xFFF9A825);

  /// Valid scan feedback — green
  static const Color validScan = Color(0xFF2E7D32);

  /// Invalid scan feedback — red (same as outbound for consistency)
  static const Color invalidScan = Color(0xFFD32F2F);

  /// Duplicate scan feedback — amber
  static const Color duplicateScan = Color(0xFFFF6F00);

  /// Offline banner — amber
  static const Color offlineBanner = Color(0xFFFF6F00);

  /// Neutral scanner frame — grey
  static const Color scannerFrame = Color(0xFF616161);
}
