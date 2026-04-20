import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../application/auth/login_use_case.dart';
import '../../core/providers/app_providers.dart';
import '../../data/remote/dtos/auth_dto.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState {
  final AuthStatus status;
  final UserDto? user;
  final bool isLoading;
  final String? error;

  const AuthState({
    this.status = AuthStatus.unknown,
    this.user,
    this.isLoading = false,
    this.error,
  });

  AuthState copyWith({
    AuthStatus? status,
    UserDto? user,
    bool? isLoading,
    String? error,
  }) =>
      AuthState(
        status: status ?? this.status,
        user: user ?? this.user,
        isLoading: isLoading ?? this.isLoading,
        error: error,
      );
}

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase _loginUseCase;
  final FlutterSecureStorage _storage;

  static const _accessKey = 'access_token';
  static const _usernameKey = 'username';
  static const _roleKey = 'role';
  static const _userIdKey = 'user_id';

  AuthNotifier(this._loginUseCase,
      [this._storage = const FlutterSecureStorage()])
      : super(const AuthState()) {
    _restoreSession();
  }

  Future<void> _restoreSession() async {
    final token = await _storage.read(key: _accessKey);
    if (token != null) {
      final userId = await _storage.read(key: _userIdKey) ?? '';
      final username = await _storage.read(key: _usernameKey) ?? '';
      final role = await _storage.read(key: _roleKey) ?? 'operator';
      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: UserDto(id: userId, username: username, role: role),
      );
    } else {
      state = state.copyWith(status: AuthStatus.unauthenticated);
    }
  }

  Future<void> login(String username, String password) async {
    state = state.copyWith(isLoading: true);
    final result = await _loginUseCase(username, password);
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        status: AuthStatus.unauthenticated,
        error: failure.message,
      ),
      (response) => state = state.copyWith(
        isLoading: false,
        status: AuthStatus.authenticated,
        user: response.user,
        error: null,
      ),
    );
  }

  Future<void> logout() async {
    await _storage.deleteAll();
    state = const AuthState(status: AuthStatus.unauthenticated);
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(loginUseCaseProvider));
});
