class StockEntry {
  final String id;
  final String itemId;
  final double quantity;
  final String unitOfMeasure;
  final String location;
  final DateTime lastUpdated;

  StockEntry({
    required this.id,
    required this.itemId,
    required this.quantity,
    required this.unitOfMeasure,
    required this.location,
    required this.lastUpdated,
  });

  StockEntry copyWith({
    String? id,
    String? itemId,
    double? quantity,
    String? unitOfMeasure,
    String? location,
    DateTime? lastUpdated,
  }) {
    return StockEntry(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      quantity: quantity ?? this.quantity,
      unitOfMeasure: unitOfMeasure ?? this.unitOfMeasure,
      location: location ?? this.location,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
