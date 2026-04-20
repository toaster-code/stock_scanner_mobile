enum MovementType {
  inbound,
  outbound,
  inventory,
}

class Movement {
  final String id;
  final String itemId;
  final MovementType type;
  final double quantity;
  final String unitOfMeasure;
  final DateTime timestamp;
  final String performedBy;
  final String? location;

  // ── Audit / metadata fields ────────────────────────────────────────────────
  final double? lat;
  final double? lng;
  final String? deviceId;
  final String? sessionId;
  final String? imageUrl;

  final Map<String, dynamic> metadata;

  Movement({
    required this.id,
    required this.itemId,
    required this.type,
    required this.quantity,
    required this.unitOfMeasure,
    required this.timestamp,
    required this.performedBy,
    this.location,
    this.lat,
    this.lng,
    this.deviceId,
    this.sessionId,
    this.imageUrl,
    Map<String, dynamic>? metadata,
  }) : metadata = metadata ?? const {};

  Movement copyWith({
    String? id,
    String? itemId,
    MovementType? type,
    double? quantity,
    String? unitOfMeasure,
    DateTime? timestamp,
    String? performedBy,
    String? location,
    double? lat,
    double? lng,
    String? deviceId,
    String? sessionId,
    String? imageUrl,
    Map<String, dynamic>? metadata,
  }) {
    return Movement(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      type: type ?? this.type,
      quantity: quantity ?? this.quantity,
      unitOfMeasure: unitOfMeasure ?? this.unitOfMeasure,
      timestamp: timestamp ?? this.timestamp,
      performedBy: performedBy ?? this.performedBy,
      location: location ?? this.location,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      deviceId: deviceId ?? this.deviceId,
      sessionId: sessionId ?? this.sessionId,
      imageUrl: imageUrl ?? this.imageUrl,
      metadata: metadata ?? this.metadata,
    );
  }
}
