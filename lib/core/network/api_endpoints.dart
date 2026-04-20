import 'dart:io';

class ApiEndpoints {
  ApiEndpoints._();

  /// Override at runtime with --dart-define=API_URL=http://192.168.1.10:3000
  static const _envUrl = String.fromEnvironment('API_URL', defaultValue: '');

  /// 10.0.2.2 = Android emulator gateway to host.
  /// On Linux/Windows/macOS desktop use localhost directly.
  static String get baseUrl {
    if (_envUrl.isNotEmpty) return _envUrl;
    if (Platform.isAndroid) return 'http://10.0.2.2:3000';
    return 'http://127.0.0.1:3000';
  }

  static const login = '/auth/login';
  static const refresh = '/auth/refresh';
  static const items = '/items';
  static const movements = '/movements';
  static const stockEntries = '/stock';
  static const sync = '/sync';
  static const upload = '/upload';
}

