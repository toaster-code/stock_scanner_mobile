import '../../../domain/entities/movement.dart';

class MovementDto {
  final String id;
  final String itemId;
  final String type;
  final double quantity;
  final String unitOfMeasure;
  final String timestamp;
  final String performedBy;
  final String? location;
  final Map<String, dynamic> metadata;

  MovementDto({
    required this.id,
    required this.itemId,
    required this.type,
    required this.quantity,
    required this.unitOfMeasure,
    required this.timestamp,
    required this.performedBy,
    this.location,
    required this.metadata,
  });

  factory MovementDto.fromJson(Map<String, dynamic> json) {
    return MovementDto(
      id: json['id'] as String,
      itemId: json['itemId'] as String,
      type: json['type'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      unitOfMeasure: json['unitOfMeasure'] as String,
      timestamp: json['timestamp'] as String,
      performedBy: json['performedBy'] as String,
      location: json['location'] as String?,
      metadata: Map<String, dynamic>.from(json['metadata'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'itemId': itemId,
      'type': type,
      'quantity': quantity,
      'unitOfMeasure': unitOfMeasure,
      'timestamp': timestamp,
      'performedBy': performedBy,
      'location': location,
      'metadata': metadata,
    };
  }

  Movement toEntity() {
    return Movement(
      id: id,
      itemId: itemId,
      type: MovementType.values.firstWhere(
        (value) => value.name == type,
        orElse: () => MovementType.inventory,
      ),
      quantity: quantity,
      unitOfMeasure: unitOfMeasure,
      timestamp: DateTime.parse(timestamp),
      performedBy: performedBy,
      location: location,
      metadata: metadata,
    );
  }

  factory MovementDto.fromEntity(Movement movement) {
    return MovementDto(
      id: movement.id,
      itemId: movement.itemId,
      type: movement.type.name,
      quantity: movement.quantity,
      unitOfMeasure: movement.unitOfMeasure,
      timestamp: movement.timestamp.toIso8601String(),
      performedBy: movement.performedBy,
      location: movement.location,
      metadata: movement.metadata,
    );
  }
}
