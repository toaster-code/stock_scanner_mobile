import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/errors/failures.dart';
import '../../data/remote/api_client.dart';
import '../../data/remote/dtos/auth_dto.dart';

/// Authenticates the user against the server and stores tokens securely.
class LoginUseCase {
  static const _accessKey = 'access_token';
  static const _refreshKey = 'refresh_token';
  static const _userIdKey = 'user_id';
  static const _usernameKey = 'username';
  static const _roleKey = 'role';

  final ApiClient _apiClient;
  final FlutterSecureStorage _storage;

  LoginUseCase(this._apiClient,
      [this._storage = const FlutterSecureStorage()]);

  Future<Result<LoginResponseDto>> call(
      String username, String password) async {
    if (username.trim().isEmpty || password.trim().isEmpty) {
      return Left(
          const ValidationFailure('Usuário e senha são obrigatórios.'));
    }
    try {
      final result = await _apiClient.login(username.trim(), password);
      await _storage.write(key: _accessKey, value: result.accessToken);
      await _storage.write(key: _refreshKey, value: result.refreshToken);
      await _storage.write(key: _userIdKey, value: result.user.id);
      await _storage.write(key: _usernameKey, value: result.user.username);
      await _storage.write(key: _roleKey, value: result.user.role);
      return Right(result);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) return Left(const AuthFailure());
      return Left(NetworkFailure());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
