class ApiEndpoints {
  ApiEndpoints._();

  /// Override at runtime with --dart-define=API_URL=http://192.168.1.10:3000
  static const baseUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'http://10.0.2.2:3000',
  );

  static const login = '/auth/login';
  static const refresh = '/auth/refresh';
  static const items = '/items';
  static const movements = '/movements';
  static const stockEntries = '/stock';
  static const sync = '/sync';
  static const upload = '/upload';
}

