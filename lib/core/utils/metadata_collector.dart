import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';

/// GPS + device-id + session-id bundle attached to every movement.
class OperationMetadata {
  final DateTime timestamp;
  final double? lat;
  final double? lng;
  final String userId;
  final String deviceId;
  final String sessionId;

  const OperationMetadata({
    required this.timestamp,
    required this.userId,
    required this.deviceId,
    required this.sessionId,
    this.lat,
    this.lng,
  });
}

/// Singleton service that collects [OperationMetadata].
///
/// - **GPS**: requests permission on first call; caches last known position
///   for 30 seconds (to avoid blocking the scan loop).
/// - **DeviceId**: generated once as UUID v4 and persisted in
///   [FlutterSecureStorage].
/// - **SessionId**: a fresh UUID v4 per operation session.
class MetadataCollector {
  MetadataCollector._();
  static final MetadataCollector instance = MetadataCollector._();

  static const _deviceIdKey = 'device_id';
  static const _positionCacheTtl = Duration(seconds: 30);

  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final Uuid _uuid = const Uuid();

  Position? _cachedPosition;
  DateTime? _cachedAt;

  // ── Device ID ──────────────────────────────────────────────────────────────

  Future<String> getDeviceId() async {
    final stored = await _storage.read(key: _deviceIdKey);
    if (stored != null) return stored;
    final id = _uuid.v4();
    await _storage.write(key: _deviceIdKey, value: id);
    return id;
  }

  // ── Session ID ─────────────────────────────────────────────────────────────

  String generateSessionId() => _uuid.v4();

  // ── GPS ────────────────────────────────────────────────────────────────────

  Future<Position?> _getPosition() async {
    if (_cachedPosition != null && _cachedAt != null) {
      if (DateTime.now().difference(_cachedAt!) < _positionCacheTtl) {
        return _cachedPosition;
      }
    }
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return null;
      }
      _cachedPosition = await Geolocator.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.medium),
      );
      _cachedAt = DateTime.now();
      return _cachedPosition;
    } catch (_) {
      return null;
    }
  }

  // ── Collect ────────────────────────────────────────────────────────────────

  Future<OperationMetadata> collect({
    required String userId,
    required String sessionId,
  }) async {
    final deviceId = await getDeviceId();
    final position = await _getPosition();
    return OperationMetadata(
      timestamp: DateTime.now().toUtc(),
      lat: position?.latitude,
      lng: position?.longitude,
      userId: userId,
      deviceId: deviceId,
      sessionId: sessionId,
    );
  }
}
