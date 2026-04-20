/// POST /auth/login request body.
class LoginRequestDto {
  final String username;
  final String password;

  const LoginRequestDto({required this.username, required this.password});

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}

/// POST /auth/login + /auth/refresh response.
class LoginResponseDto {
  final String accessToken;
  final String refreshToken;
  final UserDto user;

  const LoginResponseDto({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      LoginResponseDto(
        accessToken: json['accessToken'] as String,
        refreshToken: json['refreshToken'] as String,
        user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      );
}

class UserDto {
  final String id;
  final String username;
  final String role;

  const UserDto({
    required this.id,
    required this.username,
    required this.role,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        id: json['id'] as String,
        username: json['username'] as String,
        role: json['role'] as String,
      );
}
