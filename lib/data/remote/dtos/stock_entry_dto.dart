import '../../../domain/entities/stock_entry.dart';

class StockEntryDto {
  final String id;
  final String itemId;
  final double quantity;
  final String unitOfMeasure;
  final String location;
  final String lastUpdated;

  StockEntryDto({
    required this.id,
    required this.itemId,
    required this.quantity,
    required this.unitOfMeasure,
    required this.location,
    required this.lastUpdated,
  });

  factory StockEntryDto.fromJson(Map<String, dynamic> json) {
    return StockEntryDto(
      id: json['id'] as String,
      itemId: json['itemId'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      unitOfMeasure: json['unitOfMeasure'] as String,
      location: json['location'] as String,
      lastUpdated: json['lastUpdated'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'itemId': itemId,
      'quantity': quantity,
      'unitOfMeasure': unitOfMeasure,
      'location': location,
      'lastUpdated': lastUpdated,
    };
  }

  StockEntry toEntity() {
    return StockEntry(
      id: id,
      itemId: itemId,
      quantity: quantity,
      unitOfMeasure: unitOfMeasure,
      location: location,
      lastUpdated: DateTime.parse(lastUpdated),
    );
  }

  factory StockEntryDto.fromEntity(StockEntry stockEntry) {
    return StockEntryDto(
      id: stockEntry.id,
      itemId: stockEntry.itemId,
      quantity: stockEntry.quantity,
      unitOfMeasure: stockEntry.unitOfMeasure,
      location: stockEntry.location,
      lastUpdated: stockEntry.lastUpdated.toIso8601String(),
    );
  }
}
