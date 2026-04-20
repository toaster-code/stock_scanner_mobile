import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'api_endpoints.dart';
import 'token_interceptor.dart';

/// Factory that produces a configured [Dio] instance.
///
/// The instance has:
///  - Base URL taken from [ApiEndpoints.baseUrl] (or overridden).
///  - Sensible timeouts.
///  - [TokenInterceptor] for JWT attach + auto-refresh.
class DioClient {
  DioClient._();

  static Dio create({String? baseUrl}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        headers: const {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    const storage = FlutterSecureStorage();
    dio.interceptors.add(TokenInterceptor(storage, dio));

    assert(() {
      // Log requests only in debug mode.
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (o) => debugPrint(o.toString()),
      ));
      return true;
    }());

    return dio;
  }
}

// ignore: avoid_print
void debugPrint(String msg) => print(msg);
