import 'package:dio/dio.dart';

import '../../core/network/api_endpoints.dart';
import 'dtos/auth_dto.dart';
import 'dtos/item_dto.dart';
import 'dtos/movement_dto.dart';
import 'dtos/stock_entry_dto.dart';
import 'dtos/sync_payload_dto.dart';

/// Typed HTTP client backed by [Dio].
///
/// JWT attachment and refresh are handled transparently by [TokenInterceptor]
/// configured on the [Dio] instance passed at construction.
class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  // ── Auth ───────────────────────────────────────────────────────────────────

  Future<LoginResponseDto> login(String username, String password) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.login,
      data: LoginRequestDto(username: username, password: password).toJson(),
    );
    return LoginResponseDto.fromJson(response.data!);
  }

  // ── Items ──────────────────────────────────────────────────────────────────

  Future<List<ItemDto>> fetchItems({int page = 1, int limit = 100}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.items,
      queryParameters: {'page': page, 'limit': limit, 'active': true},
    );
    final data = response.data!['data'] as List<dynamic>;
    return data
        .map((e) => ItemDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<ItemDto?> fetchItemById(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '${ApiEndpoints.items}/$id',
    );
    return ItemDto.fromJson(response.data!);
  }

  // ── Stock ──────────────────────────────────────────────────────────────────

  Future<List<StockEntryDto>> fetchStockEntries() async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.stockEntries,
    );
    final data = response.data!['data'] as List<dynamic>;
    return data
        .map((e) => StockEntryDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // ── Movements ──────────────────────────────────────────────────────────────

  Future<void> postMovement(MovementDto dto) async {
    await _dio.post<void>(ApiEndpoints.movements, data: dto.toJson());
  }

  // ── Sync ───────────────────────────────────────────────────────────────────

  Future<SyncResultDto> sync(SyncPayloadDto payload) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.sync,
      data: payload.toJson(),
    );
    return SyncResultDto.fromJson(response.data!);
  }
}

