// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ItemsTableTable extends ItemsTable
    with TableInfo<$ItemsTableTable, ItemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 256),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _unitOfMeasureMeta =
      const VerificationMeta('unitOfMeasure');
  @override
  late final GeneratedColumn<String> unitOfMeasure = GeneratedColumn<String>(
      'unit_of_measure', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _primaryLocationMeta =
      const VerificationMeta('primaryLocation');
  @override
  late final GeneratedColumn<String> primaryLocation = GeneratedColumn<String>(
      'primary_location', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, barcode, name, unitOfMeasure, primaryLocation, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'items_table';
  @override
  VerificationContext validateIntegrity(Insertable<ItemsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('unit_of_measure')) {
      context.handle(
          _unitOfMeasureMeta,
          unitOfMeasure.isAcceptableOrUnknown(
              data['unit_of_measure']!, _unitOfMeasureMeta));
    } else if (isInserting) {
      context.missing(_unitOfMeasureMeta);
    }
    if (data.containsKey('primary_location')) {
      context.handle(
          _primaryLocationMeta,
          primaryLocation.isAcceptableOrUnknown(
              data['primary_location']!, _primaryLocationMeta));
    } else if (isInserting) {
      context.missing(_primaryLocationMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      unitOfMeasure: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}unit_of_measure'])!,
      primaryLocation: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}primary_location'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $ItemsTableTable createAlias(String alias) {
    return $ItemsTableTable(attachedDatabase, alias);
  }
}

class ItemsTableData extends DataClass implements Insertable<ItemsTableData> {
  final String id;
  final String barcode;
  final String name;
  final String unitOfMeasure;
  final String primaryLocation;
  final String status;
  const ItemsTableData(
      {required this.id,
      required this.barcode,
      required this.name,
      required this.unitOfMeasure,
      required this.primaryLocation,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['barcode'] = Variable<String>(barcode);
    map['name'] = Variable<String>(name);
    map['unit_of_measure'] = Variable<String>(unitOfMeasure);
    map['primary_location'] = Variable<String>(primaryLocation);
    map['status'] = Variable<String>(status);
    return map;
  }

  ItemsTableCompanion toCompanion(bool nullToAbsent) {
    return ItemsTableCompanion(
      id: Value(id),
      barcode: Value(barcode),
      name: Value(name),
      unitOfMeasure: Value(unitOfMeasure),
      primaryLocation: Value(primaryLocation),
      status: Value(status),
    );
  }

  factory ItemsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemsTableData(
      id: serializer.fromJson<String>(json['id']),
      barcode: serializer.fromJson<String>(json['barcode']),
      name: serializer.fromJson<String>(json['name']),
      unitOfMeasure: serializer.fromJson<String>(json['unitOfMeasure']),
      primaryLocation: serializer.fromJson<String>(json['primaryLocation']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'barcode': serializer.toJson<String>(barcode),
      'name': serializer.toJson<String>(name),
      'unitOfMeasure': serializer.toJson<String>(unitOfMeasure),
      'primaryLocation': serializer.toJson<String>(primaryLocation),
      'status': serializer.toJson<String>(status),
    };
  }

  ItemsTableData copyWith(
          {String? id,
          String? barcode,
          String? name,
          String? unitOfMeasure,
          String? primaryLocation,
          String? status}) =>
      ItemsTableData(
        id: id ?? this.id,
        barcode: barcode ?? this.barcode,
        name: name ?? this.name,
        unitOfMeasure: unitOfMeasure ?? this.unitOfMeasure,
        primaryLocation: primaryLocation ?? this.primaryLocation,
        status: status ?? this.status,
      );
  ItemsTableData copyWithCompanion(ItemsTableCompanion data) {
    return ItemsTableData(
      id: data.id.present ? data.id.value : this.id,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      name: data.name.present ? data.name.value : this.name,
      unitOfMeasure: data.unitOfMeasure.present
          ? data.unitOfMeasure.value
          : this.unitOfMeasure,
      primaryLocation: data.primaryLocation.present
          ? data.primaryLocation.value
          : this.primaryLocation,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemsTableData(')
          ..write('id: $id, ')
          ..write('barcode: $barcode, ')
          ..write('name: $name, ')
          ..write('unitOfMeasure: $unitOfMeasure, ')
          ..write('primaryLocation: $primaryLocation, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, barcode, name, unitOfMeasure, primaryLocation, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemsTableData &&
          other.id == this.id &&
          other.barcode == this.barcode &&
          other.name == this.name &&
          other.unitOfMeasure == this.unitOfMeasure &&
          other.primaryLocation == this.primaryLocation &&
          other.status == this.status);
}

class ItemsTableCompanion extends UpdateCompanion<ItemsTableData> {
  final Value<String> id;
  final Value<String> barcode;
  final Value<String> name;
  final Value<String> unitOfMeasure;
  final Value<String> primaryLocation;
  final Value<String> status;
  final Value<int> rowid;
  const ItemsTableCompanion({
    this.id = const Value.absent(),
    this.barcode = const Value.absent(),
    this.name = const Value.absent(),
    this.unitOfMeasure = const Value.absent(),
    this.primaryLocation = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItemsTableCompanion.insert({
    required String id,
    required String barcode,
    required String name,
    required String unitOfMeasure,
    required String primaryLocation,
    required String status,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        barcode = Value(barcode),
        name = Value(name),
        unitOfMeasure = Value(unitOfMeasure),
        primaryLocation = Value(primaryLocation),
        status = Value(status);
  static Insertable<ItemsTableData> custom({
    Expression<String>? id,
    Expression<String>? barcode,
    Expression<String>? name,
    Expression<String>? unitOfMeasure,
    Expression<String>? primaryLocation,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (barcode != null) 'barcode': barcode,
      if (name != null) 'name': name,
      if (unitOfMeasure != null) 'unit_of_measure': unitOfMeasure,
      if (primaryLocation != null) 'primary_location': primaryLocation,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItemsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? barcode,
      Value<String>? name,
      Value<String>? unitOfMeasure,
      Value<String>? primaryLocation,
      Value<String>? status,
      Value<int>? rowid}) {
    return ItemsTableCompanion(
      id: id ?? this.id,
      barcode: barcode ?? this.barcode,
      name: name ?? this.name,
      unitOfMeasure: unitOfMeasure ?? this.unitOfMeasure,
      primaryLocation: primaryLocation ?? this.primaryLocation,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (unitOfMeasure.present) {
      map['unit_of_measure'] = Variable<String>(unitOfMeasure.value);
    }
    if (primaryLocation.present) {
      map['primary_location'] = Variable<String>(primaryLocation.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('barcode: $barcode, ')
          ..write('name: $name, ')
          ..write('unitOfMeasure: $unitOfMeasure, ')
          ..write('primaryLocation: $primaryLocation, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MovementsTableTable extends MovementsTable
    with TableInfo<$MovementsTableTable, MovementsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovementsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitOfMeasureMeta =
      const VerificationMeta('unitOfMeasure');
  @override
  late final GeneratedColumn<String> unitOfMeasure = GeneratedColumn<String>(
      'unit_of_measure', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _performedByMeta =
      const VerificationMeta('performedBy');
  @override
  late final GeneratedColumn<String> performedBy = GeneratedColumn<String>(
      'performed_by', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _metadataMeta =
      const VerificationMeta('metadata');
  @override
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
      'metadata', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        itemId,
        type,
        quantity,
        unitOfMeasure,
        timestamp,
        performedBy,
        location,
        metadata
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'movements_table';
  @override
  VerificationContext validateIntegrity(Insertable<MovementsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_of_measure')) {
      context.handle(
          _unitOfMeasureMeta,
          unitOfMeasure.isAcceptableOrUnknown(
              data['unit_of_measure']!, _unitOfMeasureMeta));
    } else if (isInserting) {
      context.missing(_unitOfMeasureMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('performed_by')) {
      context.handle(
          _performedByMeta,
          performedBy.isAcceptableOrUnknown(
              data['performed_by']!, _performedByMeta));
    } else if (isInserting) {
      context.missing(_performedByMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('metadata')) {
      context.handle(_metadataMeta,
          metadata.isAcceptableOrUnknown(data['metadata']!, _metadataMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MovementsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MovementsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      unitOfMeasure: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}unit_of_measure'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      performedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}performed_by'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      metadata: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}metadata'])!,
    );
  }

  @override
  $MovementsTableTable createAlias(String alias) {
    return $MovementsTableTable(attachedDatabase, alias);
  }
}

class MovementsTableData extends DataClass
    implements Insertable<MovementsTableData> {
  final String id;
  final String itemId;
  final String type;
  final double quantity;
  final String unitOfMeasure;
  final DateTime timestamp;
  final String performedBy;
  final String? location;
  final String metadata;
  const MovementsTableData(
      {required this.id,
      required this.itemId,
      required this.type,
      required this.quantity,
      required this.unitOfMeasure,
      required this.timestamp,
      required this.performedBy,
      this.location,
      required this.metadata});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['item_id'] = Variable<String>(itemId);
    map['type'] = Variable<String>(type);
    map['quantity'] = Variable<double>(quantity);
    map['unit_of_measure'] = Variable<String>(unitOfMeasure);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['performed_by'] = Variable<String>(performedBy);
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    map['metadata'] = Variable<String>(metadata);
    return map;
  }

  MovementsTableCompanion toCompanion(bool nullToAbsent) {
    return MovementsTableCompanion(
      id: Value(id),
      itemId: Value(itemId),
      type: Value(type),
      quantity: Value(quantity),
      unitOfMeasure: Value(unitOfMeasure),
      timestamp: Value(timestamp),
      performedBy: Value(performedBy),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      metadata: Value(metadata),
    );
  }

  factory MovementsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovementsTableData(
      id: serializer.fromJson<String>(json['id']),
      itemId: serializer.fromJson<String>(json['itemId']),
      type: serializer.fromJson<String>(json['type']),
      quantity: serializer.fromJson<double>(json['quantity']),
      unitOfMeasure: serializer.fromJson<String>(json['unitOfMeasure']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      performedBy: serializer.fromJson<String>(json['performedBy']),
      location: serializer.fromJson<String?>(json['location']),
      metadata: serializer.fromJson<String>(json['metadata']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'itemId': serializer.toJson<String>(itemId),
      'type': serializer.toJson<String>(type),
      'quantity': serializer.toJson<double>(quantity),
      'unitOfMeasure': serializer.toJson<String>(unitOfMeasure),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'performedBy': serializer.toJson<String>(performedBy),
      'location': serializer.toJson<String?>(location),
      'metadata': serializer.toJson<String>(metadata),
    };
  }

  MovementsTableData copyWith(
          {String? id,
          String? itemId,
          String? type,
          double? quantity,
          String? unitOfMeasure,
          DateTime? timestamp,
          String? performedBy,
          Value<String?> location = const Value.absent(),
          String? metadata}) =>
      MovementsTableData(
        id: id ?? this.id,
        itemId: itemId ?? this.itemId,
        type: type ?? this.type,
        quantity: quantity ?? this.quantity,
        unitOfMeasure: unitOfMeasure ?? this.unitOfMeasure,
        timestamp: timestamp ?? this.timestamp,
        performedBy: performedBy ?? this.performedBy,
        location: location.present ? location.value : this.location,
        metadata: metadata ?? this.metadata,
      );
  MovementsTableData copyWithCompanion(MovementsTableCompanion data) {
    return MovementsTableData(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      type: data.type.present ? data.type.value : this.type,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitOfMeasure: data.unitOfMeasure.present
          ? data.unitOfMeasure.value
          : this.unitOfMeasure,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      performedBy:
          data.performedBy.present ? data.performedBy.value : this.performedBy,
      location: data.location.present ? data.location.value : this.location,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MovementsTableData(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('type: $type, ')
          ..write('quantity: $quantity, ')
          ..write('unitOfMeasure: $unitOfMeasure, ')
          ..write('timestamp: $timestamp, ')
          ..write('performedBy: $performedBy, ')
          ..write('location: $location, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemId, type, quantity, unitOfMeasure,
      timestamp, performedBy, location, metadata);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovementsTableData &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.type == this.type &&
          other.quantity == this.quantity &&
          other.unitOfMeasure == this.unitOfMeasure &&
          other.timestamp == this.timestamp &&
          other.performedBy == this.performedBy &&
          other.location == this.location &&
          other.metadata == this.metadata);
}

class MovementsTableCompanion extends UpdateCompanion<MovementsTableData> {
  final Value<String> id;
  final Value<String> itemId;
  final Value<String> type;
  final Value<double> quantity;
  final Value<String> unitOfMeasure;
  final Value<DateTime> timestamp;
  final Value<String> performedBy;
  final Value<String?> location;
  final Value<String> metadata;
  final Value<int> rowid;
  const MovementsTableCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.type = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitOfMeasure = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.performedBy = const Value.absent(),
    this.location = const Value.absent(),
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MovementsTableCompanion.insert({
    required String id,
    required String itemId,
    required String type,
    required double quantity,
    required String unitOfMeasure,
    required DateTime timestamp,
    required String performedBy,
    this.location = const Value.absent(),
    this.metadata = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        itemId = Value(itemId),
        type = Value(type),
        quantity = Value(quantity),
        unitOfMeasure = Value(unitOfMeasure),
        timestamp = Value(timestamp),
        performedBy = Value(performedBy);
  static Insertable<MovementsTableData> custom({
    Expression<String>? id,
    Expression<String>? itemId,
    Expression<String>? type,
    Expression<double>? quantity,
    Expression<String>? unitOfMeasure,
    Expression<DateTime>? timestamp,
    Expression<String>? performedBy,
    Expression<String>? location,
    Expression<String>? metadata,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (type != null) 'type': type,
      if (quantity != null) 'quantity': quantity,
      if (unitOfMeasure != null) 'unit_of_measure': unitOfMeasure,
      if (timestamp != null) 'timestamp': timestamp,
      if (performedBy != null) 'performed_by': performedBy,
      if (location != null) 'location': location,
      if (metadata != null) 'metadata': metadata,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MovementsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? itemId,
      Value<String>? type,
      Value<double>? quantity,
      Value<String>? unitOfMeasure,
      Value<DateTime>? timestamp,
      Value<String>? performedBy,
      Value<String?>? location,
      Value<String>? metadata,
      Value<int>? rowid}) {
    return MovementsTableCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      type: type ?? this.type,
      quantity: quantity ?? this.quantity,
      unitOfMeasure: unitOfMeasure ?? this.unitOfMeasure,
      timestamp: timestamp ?? this.timestamp,
      performedBy: performedBy ?? this.performedBy,
      location: location ?? this.location,
      metadata: metadata ?? this.metadata,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unitOfMeasure.present) {
      map['unit_of_measure'] = Variable<String>(unitOfMeasure.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (performedBy.present) {
      map['performed_by'] = Variable<String>(performedBy.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(metadata.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovementsTableCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('type: $type, ')
          ..write('quantity: $quantity, ')
          ..write('unitOfMeasure: $unitOfMeasure, ')
          ..write('timestamp: $timestamp, ')
          ..write('performedBy: $performedBy, ')
          ..write('location: $location, ')
          ..write('metadata: $metadata, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StockEntriesTableTable extends StockEntriesTable
    with TableInfo<$StockEntriesTableTable, StockEntriesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockEntriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
      'item_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitOfMeasureMeta =
      const VerificationMeta('unitOfMeasure');
  @override
  late final GeneratedColumn<String> unitOfMeasure = GeneratedColumn<String>(
      'unit_of_measure', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, itemId, quantity, unitOfMeasure, location, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stock_entries_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<StockEntriesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_of_measure')) {
      context.handle(
          _unitOfMeasureMeta,
          unitOfMeasure.isAcceptableOrUnknown(
              data['unit_of_measure']!, _unitOfMeasureMeta));
    } else if (isInserting) {
      context.missing(_unitOfMeasureMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_lastUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockEntriesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockEntriesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      unitOfMeasure: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}unit_of_measure'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $StockEntriesTableTable createAlias(String alias) {
    return $StockEntriesTableTable(attachedDatabase, alias);
  }
}

class StockEntriesTableData extends DataClass
    implements Insertable<StockEntriesTableData> {
  final String id;
  final String itemId;
  final double quantity;
  final String unitOfMeasure;
  final String location;
  final DateTime lastUpdated;
  const StockEntriesTableData(
      {required this.id,
      required this.itemId,
      required this.quantity,
      required this.unitOfMeasure,
      required this.location,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['item_id'] = Variable<String>(itemId);
    map['quantity'] = Variable<double>(quantity);
    map['unit_of_measure'] = Variable<String>(unitOfMeasure);
    map['location'] = Variable<String>(location);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  StockEntriesTableCompanion toCompanion(bool nullToAbsent) {
    return StockEntriesTableCompanion(
      id: Value(id),
      itemId: Value(itemId),
      quantity: Value(quantity),
      unitOfMeasure: Value(unitOfMeasure),
      location: Value(location),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory StockEntriesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockEntriesTableData(
      id: serializer.fromJson<String>(json['id']),
      itemId: serializer.fromJson<String>(json['itemId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      unitOfMeasure: serializer.fromJson<String>(json['unitOfMeasure']),
      location: serializer.fromJson<String>(json['location']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'itemId': serializer.toJson<String>(itemId),
      'quantity': serializer.toJson<double>(quantity),
      'unitOfMeasure': serializer.toJson<String>(unitOfMeasure),
      'location': serializer.toJson<String>(location),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  StockEntriesTableData copyWith(
          {String? id,
          String? itemId,
          double? quantity,
          String? unitOfMeasure,
          String? location,
          DateTime? lastUpdated}) =>
      StockEntriesTableData(
        id: id ?? this.id,
        itemId: itemId ?? this.itemId,
        quantity: quantity ?? this.quantity,
        unitOfMeasure: unitOfMeasure ?? this.unitOfMeasure,
        location: location ?? this.location,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  StockEntriesTableData copyWithCompanion(StockEntriesTableCompanion data) {
    return StockEntriesTableData(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitOfMeasure: data.unitOfMeasure.present
          ? data.unitOfMeasure.value
          : this.unitOfMeasure,
      location: data.location.present ? data.location.value : this.location,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StockEntriesTableData(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('quantity: $quantity, ')
          ..write('unitOfMeasure: $unitOfMeasure, ')
          ..write('location: $location, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, itemId, quantity, unitOfMeasure, location, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockEntriesTableData &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.quantity == this.quantity &&
          other.unitOfMeasure == this.unitOfMeasure &&
          other.location == this.location &&
          other.lastUpdated == this.lastUpdated);
}

class StockEntriesTableCompanion
    extends UpdateCompanion<StockEntriesTableData> {
  final Value<String> id;
  final Value<String> itemId;
  final Value<double> quantity;
  final Value<String> unitOfMeasure;
  final Value<String> location;
  final Value<DateTime> lastUpdated;
  final Value<int> rowid;
  const StockEntriesTableCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitOfMeasure = const Value.absent(),
    this.location = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StockEntriesTableCompanion.insert({
    required String id,
    required String itemId,
    required double quantity,
    required String unitOfMeasure,
    required String location,
    required DateTime lastUpdated,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        itemId = Value(itemId),
        quantity = Value(quantity),
        unitOfMeasure = Value(unitOfMeasure),
        location = Value(location),
        lastUpdated = Value(lastUpdated);
  static Insertable<StockEntriesTableData> custom({
    Expression<String>? id,
    Expression<String>? itemId,
    Expression<double>? quantity,
    Expression<String>? unitOfMeasure,
    Expression<String>? location,
    Expression<DateTime>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (quantity != null) 'quantity': quantity,
      if (unitOfMeasure != null) 'unit_of_measure': unitOfMeasure,
      if (location != null) 'location': location,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StockEntriesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? itemId,
      Value<double>? quantity,
      Value<String>? unitOfMeasure,
      Value<String>? location,
      Value<DateTime>? lastUpdated,
      Value<int>? rowid}) {
    return StockEntriesTableCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      quantity: quantity ?? this.quantity,
      unitOfMeasure: unitOfMeasure ?? this.unitOfMeasure,
      location: location ?? this.location,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unitOfMeasure.present) {
      map['unit_of_measure'] = Variable<String>(unitOfMeasure.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockEntriesTableCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('quantity: $quantity, ')
          ..write('unitOfMeasure: $unitOfMeasure, ')
          ..write('location: $location, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PendingActionsTableTable extends PendingActionsTable
    with TableInfo<$PendingActionsTableTable, PendingActionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingActionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _payloadIdMeta =
      const VerificationMeta('payloadId');
  @override
  late final GeneratedColumn<String> payloadId = GeneratedColumn<String>(
      'payload_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _queuedAtMeta =
      const VerificationMeta('queuedAt');
  @override
  late final GeneratedColumn<DateTime> queuedAt = GeneratedColumn<DateTime>(
      'queued_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _requiresNetworkMeta =
      const VerificationMeta('requiresNetwork');
  @override
  late final GeneratedColumn<bool> requiresNetwork = GeneratedColumn<bool>(
      'requires_network', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("requires_network" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, type, payloadId, queuedAt, requiresNetwork];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_actions_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<PendingActionsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('payload_id')) {
      context.handle(_payloadIdMeta,
          payloadId.isAcceptableOrUnknown(data['payload_id']!, _payloadIdMeta));
    } else if (isInserting) {
      context.missing(_payloadIdMeta);
    }
    if (data.containsKey('queued_at')) {
      context.handle(_queuedAtMeta,
          queuedAt.isAcceptableOrUnknown(data['queued_at']!, _queuedAtMeta));
    } else if (isInserting) {
      context.missing(_queuedAtMeta);
    }
    if (data.containsKey('requires_network')) {
      context.handle(
          _requiresNetworkMeta,
          requiresNetwork.isAcceptableOrUnknown(
              data['requires_network']!, _requiresNetworkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingActionsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingActionsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      payloadId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload_id'])!,
      queuedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}queued_at'])!,
      requiresNetwork: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}requires_network'])!,
    );
  }

  @override
  $PendingActionsTableTable createAlias(String alias) {
    return $PendingActionsTableTable(attachedDatabase, alias);
  }
}

class PendingActionsTableData extends DataClass
    implements Insertable<PendingActionsTableData> {
  final String id;
  final String type;
  final String payloadId;
  final DateTime queuedAt;
  final bool requiresNetwork;
  const PendingActionsTableData(
      {required this.id,
      required this.type,
      required this.payloadId,
      required this.queuedAt,
      required this.requiresNetwork});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['payload_id'] = Variable<String>(payloadId);
    map['queued_at'] = Variable<DateTime>(queuedAt);
    map['requires_network'] = Variable<bool>(requiresNetwork);
    return map;
  }

  PendingActionsTableCompanion toCompanion(bool nullToAbsent) {
    return PendingActionsTableCompanion(
      id: Value(id),
      type: Value(type),
      payloadId: Value(payloadId),
      queuedAt: Value(queuedAt),
      requiresNetwork: Value(requiresNetwork),
    );
  }

  factory PendingActionsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingActionsTableData(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      payloadId: serializer.fromJson<String>(json['payloadId']),
      queuedAt: serializer.fromJson<DateTime>(json['queuedAt']),
      requiresNetwork: serializer.fromJson<bool>(json['requiresNetwork']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'payloadId': serializer.toJson<String>(payloadId),
      'queuedAt': serializer.toJson<DateTime>(queuedAt),
      'requiresNetwork': serializer.toJson<bool>(requiresNetwork),
    };
  }

  PendingActionsTableData copyWith(
          {String? id,
          String? type,
          String? payloadId,
          DateTime? queuedAt,
          bool? requiresNetwork}) =>
      PendingActionsTableData(
        id: id ?? this.id,
        type: type ?? this.type,
        payloadId: payloadId ?? this.payloadId,
        queuedAt: queuedAt ?? this.queuedAt,
        requiresNetwork: requiresNetwork ?? this.requiresNetwork,
      );
  PendingActionsTableData copyWithCompanion(PendingActionsTableCompanion data) {
    return PendingActionsTableData(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      payloadId: data.payloadId.present ? data.payloadId.value : this.payloadId,
      queuedAt: data.queuedAt.present ? data.queuedAt.value : this.queuedAt,
      requiresNetwork: data.requiresNetwork.present
          ? data.requiresNetwork.value
          : this.requiresNetwork,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingActionsTableData(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('payloadId: $payloadId, ')
          ..write('queuedAt: $queuedAt, ')
          ..write('requiresNetwork: $requiresNetwork')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, type, payloadId, queuedAt, requiresNetwork);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingActionsTableData &&
          other.id == this.id &&
          other.type == this.type &&
          other.payloadId == this.payloadId &&
          other.queuedAt == this.queuedAt &&
          other.requiresNetwork == this.requiresNetwork);
}

class PendingActionsTableCompanion
    extends UpdateCompanion<PendingActionsTableData> {
  final Value<String> id;
  final Value<String> type;
  final Value<String> payloadId;
  final Value<DateTime> queuedAt;
  final Value<bool> requiresNetwork;
  final Value<int> rowid;
  const PendingActionsTableCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.payloadId = const Value.absent(),
    this.queuedAt = const Value.absent(),
    this.requiresNetwork = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PendingActionsTableCompanion.insert({
    required String id,
    required String type,
    required String payloadId,
    required DateTime queuedAt,
    this.requiresNetwork = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        payloadId = Value(payloadId),
        queuedAt = Value(queuedAt);
  static Insertable<PendingActionsTableData> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? payloadId,
    Expression<DateTime>? queuedAt,
    Expression<bool>? requiresNetwork,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (payloadId != null) 'payload_id': payloadId,
      if (queuedAt != null) 'queued_at': queuedAt,
      if (requiresNetwork != null) 'requires_network': requiresNetwork,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PendingActionsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? type,
      Value<String>? payloadId,
      Value<DateTime>? queuedAt,
      Value<bool>? requiresNetwork,
      Value<int>? rowid}) {
    return PendingActionsTableCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      payloadId: payloadId ?? this.payloadId,
      queuedAt: queuedAt ?? this.queuedAt,
      requiresNetwork: requiresNetwork ?? this.requiresNetwork,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (payloadId.present) {
      map['payload_id'] = Variable<String>(payloadId.value);
    }
    if (queuedAt.present) {
      map['queued_at'] = Variable<DateTime>(queuedAt.value);
    }
    if (requiresNetwork.present) {
      map['requires_network'] = Variable<bool>(requiresNetwork.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingActionsTableCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('payloadId: $payloadId, ')
          ..write('queuedAt: $queuedAt, ')
          ..write('requiresNetwork: $requiresNetwork, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ItemsTableTable itemsTable = $ItemsTableTable(this);
  late final $MovementsTableTable movementsTable = $MovementsTableTable(this);
  late final $StockEntriesTableTable stockEntriesTable =
      $StockEntriesTableTable(this);
  late final $PendingActionsTableTable pendingActionsTable =
      $PendingActionsTableTable(this);
  late final ItemsDao itemsDao = ItemsDao(this as AppDatabase);
  late final MovementsDao movementsDao = MovementsDao(this as AppDatabase);
  late final StockEntriesDao stockEntriesDao =
      StockEntriesDao(this as AppDatabase);
  late final PendingActionsDao pendingActionsDao =
      PendingActionsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [itemsTable, movementsTable, stockEntriesTable, pendingActionsTable];
}

typedef $$ItemsTableTableCreateCompanionBuilder = ItemsTableCompanion Function({
  required String id,
  required String barcode,
  required String name,
  required String unitOfMeasure,
  required String primaryLocation,
  required String status,
  Value<int> rowid,
});
typedef $$ItemsTableTableUpdateCompanionBuilder = ItemsTableCompanion Function({
  Value<String> id,
  Value<String> barcode,
  Value<String> name,
  Value<String> unitOfMeasure,
  Value<String> primaryLocation,
  Value<String> status,
  Value<int> rowid,
});

class $$ItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ItemsTableTable> {
  $$ItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unitOfMeasure => $composableBuilder(
      column: $table.unitOfMeasure, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get primaryLocation => $composableBuilder(
      column: $table.primaryLocation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$ItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemsTableTable> {
  $$ItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unitOfMeasure => $composableBuilder(
      column: $table.unitOfMeasure,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get primaryLocation => $composableBuilder(
      column: $table.primaryLocation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$ItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemsTableTable> {
  $$ItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get unitOfMeasure => $composableBuilder(
      column: $table.unitOfMeasure, builder: (column) => column);

  GeneratedColumn<String> get primaryLocation => $composableBuilder(
      column: $table.primaryLocation, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$ItemsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ItemsTableTable,
    ItemsTableData,
    $$ItemsTableTableFilterComposer,
    $$ItemsTableTableOrderingComposer,
    $$ItemsTableTableAnnotationComposer,
    $$ItemsTableTableCreateCompanionBuilder,
    $$ItemsTableTableUpdateCompanionBuilder,
    (
      ItemsTableData,
      BaseReferences<_$AppDatabase, $ItemsTableTable, ItemsTableData>
    ),
    ItemsTableData,
    PrefetchHooks Function()> {
  $$ItemsTableTableTableManager(_$AppDatabase db, $ItemsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> barcode = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> unitOfMeasure = const Value.absent(),
            Value<String> primaryLocation = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ItemsTableCompanion(
            id: id,
            barcode: barcode,
            name: name,
            unitOfMeasure: unitOfMeasure,
            primaryLocation: primaryLocation,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String barcode,
            required String name,
            required String unitOfMeasure,
            required String primaryLocation,
            required String status,
            Value<int> rowid = const Value.absent(),
          }) =>
              ItemsTableCompanion.insert(
            id: id,
            barcode: barcode,
            name: name,
            unitOfMeasure: unitOfMeasure,
            primaryLocation: primaryLocation,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ItemsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ItemsTableTable,
    ItemsTableData,
    $$ItemsTableTableFilterComposer,
    $$ItemsTableTableOrderingComposer,
    $$ItemsTableTableAnnotationComposer,
    $$ItemsTableTableCreateCompanionBuilder,
    $$ItemsTableTableUpdateCompanionBuilder,
    (
      ItemsTableData,
      BaseReferences<_$AppDatabase, $ItemsTableTable, ItemsTableData>
    ),
    ItemsTableData,
    PrefetchHooks Function()>;
typedef $$MovementsTableTableCreateCompanionBuilder = MovementsTableCompanion
    Function({
  required String id,
  required String itemId,
  required String type,
  required double quantity,
  required String unitOfMeasure,
  required DateTime timestamp,
  required String performedBy,
  Value<String?> location,
  Value<String> metadata,
  Value<int> rowid,
});
typedef $$MovementsTableTableUpdateCompanionBuilder = MovementsTableCompanion
    Function({
  Value<String> id,
  Value<String> itemId,
  Value<String> type,
  Value<double> quantity,
  Value<String> unitOfMeasure,
  Value<DateTime> timestamp,
  Value<String> performedBy,
  Value<String?> location,
  Value<String> metadata,
  Value<int> rowid,
});

class $$MovementsTableTableFilterComposer
    extends Composer<_$AppDatabase, $MovementsTableTable> {
  $$MovementsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unitOfMeasure => $composableBuilder(
      column: $table.unitOfMeasure, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get performedBy => $composableBuilder(
      column: $table.performedBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get metadata => $composableBuilder(
      column: $table.metadata, builder: (column) => ColumnFilters(column));
}

class $$MovementsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MovementsTableTable> {
  $$MovementsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unitOfMeasure => $composableBuilder(
      column: $table.unitOfMeasure,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get performedBy => $composableBuilder(
      column: $table.performedBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get metadata => $composableBuilder(
      column: $table.metadata, builder: (column) => ColumnOrderings(column));
}

class $$MovementsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MovementsTableTable> {
  $$MovementsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get unitOfMeasure => $composableBuilder(
      column: $table.unitOfMeasure, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get performedBy => $composableBuilder(
      column: $table.performedBy, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);
}

class $$MovementsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MovementsTableTable,
    MovementsTableData,
    $$MovementsTableTableFilterComposer,
    $$MovementsTableTableOrderingComposer,
    $$MovementsTableTableAnnotationComposer,
    $$MovementsTableTableCreateCompanionBuilder,
    $$MovementsTableTableUpdateCompanionBuilder,
    (
      MovementsTableData,
      BaseReferences<_$AppDatabase, $MovementsTableTable, MovementsTableData>
    ),
    MovementsTableData,
    PrefetchHooks Function()> {
  $$MovementsTableTableTableManager(
      _$AppDatabase db, $MovementsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MovementsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MovementsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MovementsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> itemId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<String> unitOfMeasure = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<String> performedBy = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String> metadata = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MovementsTableCompanion(
            id: id,
            itemId: itemId,
            type: type,
            quantity: quantity,
            unitOfMeasure: unitOfMeasure,
            timestamp: timestamp,
            performedBy: performedBy,
            location: location,
            metadata: metadata,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String itemId,
            required String type,
            required double quantity,
            required String unitOfMeasure,
            required DateTime timestamp,
            required String performedBy,
            Value<String?> location = const Value.absent(),
            Value<String> metadata = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MovementsTableCompanion.insert(
            id: id,
            itemId: itemId,
            type: type,
            quantity: quantity,
            unitOfMeasure: unitOfMeasure,
            timestamp: timestamp,
            performedBy: performedBy,
            location: location,
            metadata: metadata,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MovementsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MovementsTableTable,
    MovementsTableData,
    $$MovementsTableTableFilterComposer,
    $$MovementsTableTableOrderingComposer,
    $$MovementsTableTableAnnotationComposer,
    $$MovementsTableTableCreateCompanionBuilder,
    $$MovementsTableTableUpdateCompanionBuilder,
    (
      MovementsTableData,
      BaseReferences<_$AppDatabase, $MovementsTableTable, MovementsTableData>
    ),
    MovementsTableData,
    PrefetchHooks Function()>;
typedef $$StockEntriesTableTableCreateCompanionBuilder
    = StockEntriesTableCompanion Function({
  required String id,
  required String itemId,
  required double quantity,
  required String unitOfMeasure,
  required String location,
  required DateTime lastUpdated,
  Value<int> rowid,
});
typedef $$StockEntriesTableTableUpdateCompanionBuilder
    = StockEntriesTableCompanion Function({
  Value<String> id,
  Value<String> itemId,
  Value<double> quantity,
  Value<String> unitOfMeasure,
  Value<String> location,
  Value<DateTime> lastUpdated,
  Value<int> rowid,
});

class $$StockEntriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $StockEntriesTableTable> {
  $$StockEntriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unitOfMeasure => $composableBuilder(
      column: $table.unitOfMeasure, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));
}

class $$StockEntriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $StockEntriesTableTable> {
  $$StockEntriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unitOfMeasure => $composableBuilder(
      column: $table.unitOfMeasure,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$StockEntriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $StockEntriesTableTable> {
  $$StockEntriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get unitOfMeasure => $composableBuilder(
      column: $table.unitOfMeasure, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);
}

class $$StockEntriesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StockEntriesTableTable,
    StockEntriesTableData,
    $$StockEntriesTableTableFilterComposer,
    $$StockEntriesTableTableOrderingComposer,
    $$StockEntriesTableTableAnnotationComposer,
    $$StockEntriesTableTableCreateCompanionBuilder,
    $$StockEntriesTableTableUpdateCompanionBuilder,
    (
      StockEntriesTableData,
      BaseReferences<_$AppDatabase, $StockEntriesTableTable,
          StockEntriesTableData>
    ),
    StockEntriesTableData,
    PrefetchHooks Function()> {
  $$StockEntriesTableTableTableManager(
      _$AppDatabase db, $StockEntriesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StockEntriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StockEntriesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StockEntriesTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> itemId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<String> unitOfMeasure = const Value.absent(),
            Value<String> location = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StockEntriesTableCompanion(
            id: id,
            itemId: itemId,
            quantity: quantity,
            unitOfMeasure: unitOfMeasure,
            location: location,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String itemId,
            required double quantity,
            required String unitOfMeasure,
            required String location,
            required DateTime lastUpdated,
            Value<int> rowid = const Value.absent(),
          }) =>
              StockEntriesTableCompanion.insert(
            id: id,
            itemId: itemId,
            quantity: quantity,
            unitOfMeasure: unitOfMeasure,
            location: location,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StockEntriesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StockEntriesTableTable,
    StockEntriesTableData,
    $$StockEntriesTableTableFilterComposer,
    $$StockEntriesTableTableOrderingComposer,
    $$StockEntriesTableTableAnnotationComposer,
    $$StockEntriesTableTableCreateCompanionBuilder,
    $$StockEntriesTableTableUpdateCompanionBuilder,
    (
      StockEntriesTableData,
      BaseReferences<_$AppDatabase, $StockEntriesTableTable,
          StockEntriesTableData>
    ),
    StockEntriesTableData,
    PrefetchHooks Function()>;
typedef $$PendingActionsTableTableCreateCompanionBuilder
    = PendingActionsTableCompanion Function({
  required String id,
  required String type,
  required String payloadId,
  required DateTime queuedAt,
  Value<bool> requiresNetwork,
  Value<int> rowid,
});
typedef $$PendingActionsTableTableUpdateCompanionBuilder
    = PendingActionsTableCompanion Function({
  Value<String> id,
  Value<String> type,
  Value<String> payloadId,
  Value<DateTime> queuedAt,
  Value<bool> requiresNetwork,
  Value<int> rowid,
});

class $$PendingActionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PendingActionsTableTable> {
  $$PendingActionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payloadId => $composableBuilder(
      column: $table.payloadId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get queuedAt => $composableBuilder(
      column: $table.queuedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get requiresNetwork => $composableBuilder(
      column: $table.requiresNetwork,
      builder: (column) => ColumnFilters(column));
}

class $$PendingActionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingActionsTableTable> {
  $$PendingActionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payloadId => $composableBuilder(
      column: $table.payloadId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get queuedAt => $composableBuilder(
      column: $table.queuedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get requiresNetwork => $composableBuilder(
      column: $table.requiresNetwork,
      builder: (column) => ColumnOrderings(column));
}

class $$PendingActionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingActionsTableTable> {
  $$PendingActionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get payloadId =>
      $composableBuilder(column: $table.payloadId, builder: (column) => column);

  GeneratedColumn<DateTime> get queuedAt =>
      $composableBuilder(column: $table.queuedAt, builder: (column) => column);

  GeneratedColumn<bool> get requiresNetwork => $composableBuilder(
      column: $table.requiresNetwork, builder: (column) => column);
}

class $$PendingActionsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PendingActionsTableTable,
    PendingActionsTableData,
    $$PendingActionsTableTableFilterComposer,
    $$PendingActionsTableTableOrderingComposer,
    $$PendingActionsTableTableAnnotationComposer,
    $$PendingActionsTableTableCreateCompanionBuilder,
    $$PendingActionsTableTableUpdateCompanionBuilder,
    (
      PendingActionsTableData,
      BaseReferences<_$AppDatabase, $PendingActionsTableTable,
          PendingActionsTableData>
    ),
    PendingActionsTableData,
    PrefetchHooks Function()> {
  $$PendingActionsTableTableTableManager(
      _$AppDatabase db, $PendingActionsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingActionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingActionsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PendingActionsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> payloadId = const Value.absent(),
            Value<DateTime> queuedAt = const Value.absent(),
            Value<bool> requiresNetwork = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PendingActionsTableCompanion(
            id: id,
            type: type,
            payloadId: payloadId,
            queuedAt: queuedAt,
            requiresNetwork: requiresNetwork,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String type,
            required String payloadId,
            required DateTime queuedAt,
            Value<bool> requiresNetwork = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PendingActionsTableCompanion.insert(
            id: id,
            type: type,
            payloadId: payloadId,
            queuedAt: queuedAt,
            requiresNetwork: requiresNetwork,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PendingActionsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PendingActionsTableTable,
    PendingActionsTableData,
    $$PendingActionsTableTableFilterComposer,
    $$PendingActionsTableTableOrderingComposer,
    $$PendingActionsTableTableAnnotationComposer,
    $$PendingActionsTableTableCreateCompanionBuilder,
    $$PendingActionsTableTableUpdateCompanionBuilder,
    (
      PendingActionsTableData,
      BaseReferences<_$AppDatabase, $PendingActionsTableTable,
          PendingActionsTableData>
    ),
    PendingActionsTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ItemsTableTableTableManager get itemsTable =>
      $$ItemsTableTableTableManager(_db, _db.itemsTable);
  $$MovementsTableTableTableManager get movementsTable =>
      $$MovementsTableTableTableManager(_db, _db.movementsTable);
  $$StockEntriesTableTableTableManager get stockEntriesTable =>
      $$StockEntriesTableTableTableManager(_db, _db.stockEntriesTable);
  $$PendingActionsTableTableTableManager get pendingActionsTable =>
      $$PendingActionsTableTableTableManager(_db, _db.pendingActionsTable);
}
