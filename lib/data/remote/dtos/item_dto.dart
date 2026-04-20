import '../../../domain/entities/item.dart';

class ItemDto {
  final String id;
  final String barcode;
  final String name;
  final String unitOfMeasure;
  final String primaryLocation;
  final String status;

  ItemDto({
    required this.id,
    required this.barcode,
    required this.name,
    required this.unitOfMeasure,
    required this.primaryLocation,
    required this.status,
  });

  factory ItemDto.fromJson(Map<String, dynamic> json) {
    return ItemDto(
      id: json['id'] as String,
      barcode: json['barcode'] as String,
      name: json['name'] as String,
      unitOfMeasure: json['unitOfMeasure'] as String,
      primaryLocation: json['primaryLocation'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'barcode': barcode,
      'name': name,
      'unitOfMeasure': unitOfMeasure,
      'primaryLocation': primaryLocation,
      'status': status,
    };
  }

  Item toEntity() {
    return Item(
      id: id,
      barcode: barcode,
      name: name,
      unitOfMeasure: unitOfMeasure,
      primaryLocation: primaryLocation,
      status: ItemStatus.values.firstWhere(
        (value) => value.name == status,
        orElse: () => ItemStatus.active,
      ),
    );
  }

  factory ItemDto.fromEntity(Item item) {
    return ItemDto(
      id: item.id,
      barcode: item.barcode,
      name: item.name,
      unitOfMeasure: item.unitOfMeasure,
      primaryLocation: item.primaryLocation,
      status: item.status.name,
    );
  }
}
