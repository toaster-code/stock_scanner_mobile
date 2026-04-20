import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Dio interceptor that:
///  1. Attaches the stored JWT to every outbound request.
///  2. On 401, attempts a token refresh using the refresh token.
///  3. Retries the original request with the new access token.
///  4. If refresh fails, clears stored tokens (forces re-login).
class TokenInterceptor extends Interceptor {
  static const _accessKey = 'access_token';
  static const _refreshKey = 'refresh_token';

  final FlutterSecureStorage _storage;

  /// Pass the same [Dio] instance so we can retry requests.
  final Dio _dio;

  TokenInterceptor(this._storage, this._dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.read(key: _accessKey);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = await _storage.read(key: _refreshKey);
      if (refreshToken != null) {
        try {
          final response = await _dio.post<Map<String, dynamic>>(
            '/auth/refresh',
            data: {'refreshToken': refreshToken},
            options: Options(
              // Skip this interceptor to avoid infinite loop.
              extra: {'skipTokenInterceptor': true},
            ),
          );
          final newToken = response.data!['accessToken'] as String;
          await _storage.write(key: _accessKey, value: newToken);

          // Retry the original failed request with the new token.
          final opts = err.requestOptions
            ..headers['Authorization'] = 'Bearer $newToken';
          final retryResponse = await _dio.fetch<dynamic>(opts);
          return handler.resolve(retryResponse);
        } catch (_) {
          // Refresh failed — wipe tokens so the user is sent to login.
          await _storage.deleteAll();
        }
      }
    }
    handler.next(err);
  }
}
