enum ItemStatus {
  active,
  inactive,
  discontinued,
}

class Item {
  final String id;
  final String barcode;
  final String name;
  final String unitOfMeasure;
  final String primaryLocation;
  final ItemStatus status;

  Item({
    required this.id,
    required this.barcode,
    required this.name,
    required this.unitOfMeasure,
    required this.primaryLocation,
    this.status = ItemStatus.active,
  });

  Item copyWith({
    String? id,
    String? barcode,
    String? name,
    String? unitOfMeasure,
    String? primaryLocation,
    ItemStatus? status,
  }) {
    return Item(
      id: id ?? this.id,
      barcode: barcode ?? this.barcode,
      name: name ?? this.name,
      unitOfMeasure: unitOfMeasure ?? this.unitOfMeasure,
      primaryLocation: primaryLocation ?? this.primaryLocation,
      status: status ?? this.status,
    );
  }
}
