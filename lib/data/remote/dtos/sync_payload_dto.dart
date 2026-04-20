/// Single action in a batch sync request.
class SyncActionDto {
  final String actionId;
  final String type; // IN | OUT | INVENTORY_COUNT
  final String itemId;
  final int quantity;
  final String location;
  final String timestamp;
  final String sessionId;
  final double? lat;
  final double? lng;
  final String? imageKey;

  const SyncActionDto({
    required this.actionId,
    required this.type,
    required this.itemId,
    required this.quantity,
    required this.location,
    required this.timestamp,
    required this.sessionId,
    this.lat,
    this.lng,
    this.imageKey,
  });

  Map<String, dynamic> toJson() => {
        'actionId': actionId,
        'type': type,
        'itemId': itemId,
        'quantity': quantity,
        'location': location,
        'timestamp': timestamp,
        'sessionId': sessionId,
        'lat': lat,
        'lng': lng,
        'imageKey': imageKey,
      };
}

/// Full batch sync request body (POST /sync).
class SyncPayloadDto {
  final String deviceId;
  final List<SyncActionDto> actions;

  const SyncPayloadDto({required this.deviceId, required this.actions});

  Map<String, dynamic> toJson() => {
        'deviceId': deviceId,
        'actions': actions.map((a) => a.toJson()).toList(),
      };
}

/// Server response to POST /sync.
class SyncResultDto {
  final List<String> synced;
  final List<SyncFailedDto> failed;

  const SyncResultDto({required this.synced, required this.failed});

  factory SyncResultDto.fromJson(Map<String, dynamic> json) => SyncResultDto(
        synced: (json['synced'] as List).cast<String>(),
        failed: (json['failed'] as List)
            .map((f) => SyncFailedDto.fromJson(f as Map<String, dynamic>))
            .toList(),
      );
}

/// A single failure entry in the sync response.
class SyncFailedDto {
  final String actionId;
  final String reason;

  const SyncFailedDto({required this.actionId, required this.reason});

  factory SyncFailedDto.fromJson(Map<String, dynamic> json) => SyncFailedDto(
        actionId: json['actionId'] as String,
        reason: json['reason'] as String,
      );
}
