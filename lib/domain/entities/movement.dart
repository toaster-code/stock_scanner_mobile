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
      metadata: metadata ?? this.metadata,
    );
  }
}
