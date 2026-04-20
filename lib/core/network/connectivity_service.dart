import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityStatus { online, offline }

/// Wraps [connectivity_plus] and exposes a simple [ConnectivityStatus] stream.
class ConnectivityService {
  ConnectivityService._();
  static final ConnectivityService instance = ConnectivityService._();

  final Connectivity _connectivity = Connectivity();

  Stream<ConnectivityStatus> get statusStream {
    return _connectivity.onConnectivityChanged.map((results) {
      return _mapResults(results);
    });
  }

  Future<ConnectivityStatus> get currentStatus async {
    final results = await _connectivity.checkConnectivity();
    return _mapResults(results);
  }

  static ConnectivityStatus _mapResults(List<ConnectivityResult> results) {
    if (results.isEmpty) return ConnectivityStatus.offline;
    return results.any((r) => r != ConnectivityResult.none)
        ? ConnectivityStatus.online
        : ConnectivityStatus.offline;
  }
}
