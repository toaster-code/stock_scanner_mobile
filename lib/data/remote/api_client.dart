import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../core/network/api_endpoints.dart';
import 'dtos/item_dto.dart';
import 'dtos/movement_dto.dart';
import 'dtos/stock_entry_dto.dart';
import 'dtos/pending_action_dto.dart';

class ApiClient {
  final Uri baseUrl;
  final http.Client httpClient;

  ApiClient({required this.baseUrl, http.Client? httpClient})
      : httpClient = httpClient ?? http.Client();

  Future<List<ItemDto>> fetchItems() async {
    final url = baseUrl.resolve(ApiEndpoints.items);
    final response = await httpClient.get(url, headers: {'Accept': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar itens: ${response.statusCode}');
    }

    final jsonList = jsonDecode(response.body) as List<dynamic>;
    return jsonList.map((json) => ItemDto.fromJson(json as Map<String, dynamic>)).toList();
  }

  Future<List<StockEntryDto>> fetchStockEntries() async {
    final url = baseUrl.resolve(ApiEndpoints.stockEntries);
    final response = await httpClient.get(url, headers: {'Accept': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar estoque: ${response.statusCode}');
    }

    final jsonList = jsonDecode(response.body) as List<dynamic>;
    return jsonList.map((json) => StockEntryDto.fromJson(json as Map<String, dynamic>)).toList();
  }

  Future<void> postMovement(MovementDto movementDto) async {
    final url = baseUrl.resolve(ApiEndpoints.movements);
    final response = await httpClient.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(movementDto.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Falha ao enviar movimento: ${response.statusCode}');
    }
  }

  Future<void> syncPendingAction(PendingActionDto actionDto) async {
    final url = baseUrl.resolve(ApiEndpoints.sync);
    final response = await httpClient.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(actionDto.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Falha ao sincronizar ação: ${response.statusCode}');
    }
  }
}
