/// Throttles barcode scans to at most one accepted scan per [_throttleDuration].
///
/// Drop duplicates silently; the [shouldProcess] caller decides what to do.
class BarcodeThrottle {
  static const _throttleDuration = Duration(milliseconds: 300);

  DateTime? _lastAccepted;

  /// Returns `true` when the scan should be processed.
  ///
  /// Returns `false` when called again within [_throttleDuration] of the
  /// previous accepted scan.
  bool shouldProcess(String barcode) {
    final now = DateTime.now();
    if (_lastAccepted != null &&
        now.difference(_lastAccepted!) < _throttleDuration) {
      return false;
    }
    _lastAccepted = now;
    return true;
  }

  void reset() => _lastAccepted = null;
}
