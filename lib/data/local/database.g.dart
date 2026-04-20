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
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
      type: DriftSqlType.string, requiredDuringInsert: true);
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
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
      'lat', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
      'lng', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
        lat,
        lng,
        deviceId,
        sessionId,
        imageUrl,
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
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    }
    if (data.containsKey('lng')) {
      context.handle(
          _lngMeta, lng.isAcceptableOrUnknown(data['lng']!, _lngMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
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
      lat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lat']),
      lng: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lng']),
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id']),
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id']),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
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

  /// IN | OUT | INVENTORY_COUNT
  final String type;
  final double quantity;
  final String unitOfMeasure;
  final DateTime timestamp;
  final String performedBy;
  final String? location;
  final double? lat;
  final double? lng;
  final String? deviceId;
  final String? sessionId;
  final String? imageUrl;

  /// Arbitrary JSON for extensibility.
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
      this.lat,
      this.lng,
      this.deviceId,
      this.sessionId,
      this.imageUrl,
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
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double>(lat);
    }
    if (!nullToAbsent || lng != null) {
      map['lng'] = Variable<double>(lng);
    }
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<String>(sessionId);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
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
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lng: lng == null && nullToAbsent ? const Value.absent() : Value(lng),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
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
      lat: serializer.fromJson<double?>(json['lat']),
      lng: serializer.fromJson<double?>(json['lng']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      sessionId: serializer.fromJson<String?>(json['sessionId']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
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
      'lat': serializer.toJson<double?>(lat),
      'lng': serializer.toJson<double?>(lng),
      'deviceId': serializer.toJson<String?>(deviceId),
      'sessionId': serializer.toJson<String?>(sessionId),
      'imageUrl': serializer.toJson<String?>(imageUrl),
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
          Value<double?> lat = const Value.absent(),
          Value<double?> lng = const Value.absent(),
          Value<String?> deviceId = const Value.absent(),
          Value<String?> sessionId = const Value.absent(),
          Value<String?> imageUrl = const Value.absent(),
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
        lat: lat.present ? lat.value : this.lat,
        lng: lng.present ? lng.value : this.lng,
        deviceId: deviceId.present ? deviceId.value : this.deviceId,
        sessionId: sessionId.present ? sessionId.value : this.sessionId,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
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
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
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
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('deviceId: $deviceId, ')
          ..write('sessionId: $sessionId, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      itemId,
      type,
      quantity,
      unitOfMeasure,
      timestamp,
      performedBy,
      location,
      lat,
      lng,
      deviceId,
      sessionId,
      imageUrl,
      metadata);
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
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.deviceId == this.deviceId &&
          other.sessionId == this.sessionId &&
          other.imageUrl == this.imageUrl &&
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
  final Value<double?> lat;
  final Value<double?> lng;
  final Value<String?> deviceId;
  final Value<String?> sessionId;
  final Value<String?> imageUrl;
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
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.imageUrl = const Value.absent(),
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
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.imageUrl = const Value.absent(),
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
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<String>? deviceId,
    Expression<String>? sessionId,
    Expression<String>? imageUrl,
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
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (deviceId != null) 'device_id': deviceId,
      if (sessionId != null) 'session_id': sessionId,
      if (imageUrl != null) 'image_url': imageUrl,
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
      Value<double?>? lat,
      Value<double?>? lng,
      Value<String?>? deviceId,
      Value<String?>? sessionId,
      Value<String?>? imageUrl,
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
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      deviceId: deviceId ?? this.deviceId,
      sessionId: sessionId ?? this.sessionId,
      imageUrl: imageUrl ?? this.imageUrl,
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
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
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
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('deviceId: $deviceId, ')
          ..write('sessionId: $sessionId, ')
          ..write('imageUrl: $imageUrl, ')
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _actionIdMeta =
      const VerificationMeta('actionId');
  @override
  late final GeneratedColumn<String> actionId = GeneratedColumn<String>(
      'action_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _attemptsMeta =
      const VerificationMeta('attempts');
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
      'attempts', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('queued'));
  static const VerificationMeta _failReasonMeta =
      const VerificationMeta('failReason');
  @override
  late final GeneratedColumn<String> failReason = GeneratedColumn<String>(
      'fail_reason', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _nextRetryAtMeta =
      const VerificationMeta('nextRetryAt');
  @override
  late final GeneratedColumn<DateTime> nextRetryAt = GeneratedColumn<DateTime>(
      'next_retry_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        actionId,
        type,
        payload,
        synced,
        attempts,
        status,
        failReason,
        createdAt,
        nextRetryAt
      ];
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
    }
    if (data.containsKey('action_id')) {
      context.handle(_actionIdMeta,
          actionId.isAcceptableOrUnknown(data['action_id']!, _actionIdMeta));
    } else if (isInserting) {
      context.missing(_actionIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('attempts')) {
      context.handle(_attemptsMeta,
          attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('fail_reason')) {
      context.handle(
          _failReasonMeta,
          failReason.isAcceptableOrUnknown(
              data['fail_reason']!, _failReasonMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('next_retry_at')) {
      context.handle(
          _nextRetryAtMeta,
          nextRetryAt.isAcceptableOrUnknown(
              data['next_retry_at']!, _nextRetryAtMeta));
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
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      actionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      attempts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attempts'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      failReason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fail_reason']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      nextRetryAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}next_retry_at']),
    );
  }

  @override
  $PendingActionsTableTable createAlias(String alias) {
    return $PendingActionsTableTable(attachedDatabase, alias);
  }
}

class PendingActionsTableData extends DataClass
    implements Insertable<PendingActionsTableData> {
  /// Auto-increment local surrogate key.
  final int id;

  /// Client-generated UUID — used as idempotency key on the server.
  final String actionId;

  /// Movement type: IN | OUT | INVENTORY_COUNT
  final String type;

  /// JSON blob with the full sync action payload.
  final String payload;

  /// True once the server has confirmed this action.
  final bool synced;

  /// Number of sync attempts made so far.
  final int attempts;

  /// queued | syncing | failed | done | dead
  final String status;

  /// Server-side rejection reason (e.g. INSUFFICIENT_STOCK).
  final String? failReason;

  /// When the action was first queued.
  final DateTime createdAt;

  /// Earliest time the next retry may be attempted (exponential backoff).
  final DateTime? nextRetryAt;
  const PendingActionsTableData(
      {required this.id,
      required this.actionId,
      required this.type,
      required this.payload,
      required this.synced,
      required this.attempts,
      required this.status,
      this.failReason,
      required this.createdAt,
      this.nextRetryAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['action_id'] = Variable<String>(actionId);
    map['type'] = Variable<String>(type);
    map['payload'] = Variable<String>(payload);
    map['synced'] = Variable<bool>(synced);
    map['attempts'] = Variable<int>(attempts);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || failReason != null) {
      map['fail_reason'] = Variable<String>(failReason);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || nextRetryAt != null) {
      map['next_retry_at'] = Variable<DateTime>(nextRetryAt);
    }
    return map;
  }

  PendingActionsTableCompanion toCompanion(bool nullToAbsent) {
    return PendingActionsTableCompanion(
      id: Value(id),
      actionId: Value(actionId),
      type: Value(type),
      payload: Value(payload),
      synced: Value(synced),
      attempts: Value(attempts),
      status: Value(status),
      failReason: failReason == null && nullToAbsent
          ? const Value.absent()
          : Value(failReason),
      createdAt: Value(createdAt),
      nextRetryAt: nextRetryAt == null && nullToAbsent
          ? const Value.absent()
          : Value(nextRetryAt),
    );
  }

  factory PendingActionsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingActionsTableData(
      id: serializer.fromJson<int>(json['id']),
      actionId: serializer.fromJson<String>(json['actionId']),
      type: serializer.fromJson<String>(json['type']),
      payload: serializer.fromJson<String>(json['payload']),
      synced: serializer.fromJson<bool>(json['synced']),
      attempts: serializer.fromJson<int>(json['attempts']),
      status: serializer.fromJson<String>(json['status']),
      failReason: serializer.fromJson<String?>(json['failReason']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      nextRetryAt: serializer.fromJson<DateTime?>(json['nextRetryAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'actionId': serializer.toJson<String>(actionId),
      'type': serializer.toJson<String>(type),
      'payload': serializer.toJson<String>(payload),
      'synced': serializer.toJson<bool>(synced),
      'attempts': serializer.toJson<int>(attempts),
      'status': serializer.toJson<String>(status),
      'failReason': serializer.toJson<String?>(failReason),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'nextRetryAt': serializer.toJson<DateTime?>(nextRetryAt),
    };
  }

  PendingActionsTableData copyWith(
          {int? id,
          String? actionId,
          String? type,
          String? payload,
          bool? synced,
          int? attempts,
          String? status,
          Value<String?> failReason = const Value.absent(),
          DateTime? createdAt,
          Value<DateTime?> nextRetryAt = const Value.absent()}) =>
      PendingActionsTableData(
        id: id ?? this.id,
        actionId: actionId ?? this.actionId,
        type: type ?? this.type,
        payload: payload ?? this.payload,
        synced: synced ?? this.synced,
        attempts: attempts ?? this.attempts,
        status: status ?? this.status,
        failReason: failReason.present ? failReason.value : this.failReason,
        createdAt: createdAt ?? this.createdAt,
        nextRetryAt: nextRetryAt.present ? nextRetryAt.value : this.nextRetryAt,
      );
  PendingActionsTableData copyWithCompanion(PendingActionsTableCompanion data) {
    return PendingActionsTableData(
      id: data.id.present ? data.id.value : this.id,
      actionId: data.actionId.present ? data.actionId.value : this.actionId,
      type: data.type.present ? data.type.value : this.type,
      payload: data.payload.present ? data.payload.value : this.payload,
      synced: data.synced.present ? data.synced.value : this.synced,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      status: data.status.present ? data.status.value : this.status,
      failReason:
          data.failReason.present ? data.failReason.value : this.failReason,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      nextRetryAt:
          data.nextRetryAt.present ? data.nextRetryAt.value : this.nextRetryAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingActionsTableData(')
          ..write('id: $id, ')
          ..write('actionId: $actionId, ')
          ..write('type: $type, ')
          ..write('payload: $payload, ')
          ..write('synced: $synced, ')
          ..write('attempts: $attempts, ')
          ..write('status: $status, ')
          ..write('failReason: $failReason, ')
          ..write('createdAt: $createdAt, ')
          ..write('nextRetryAt: $nextRetryAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, actionId, type, payload, synced, attempts,
      status, failReason, createdAt, nextRetryAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingActionsTableData &&
          other.id == this.id &&
          other.actionId == this.actionId &&
          other.type == this.type &&
          other.payload == this.payload &&
          other.synced == this.synced &&
          other.attempts == this.attempts &&
          other.status == this.status &&
          other.failReason == this.failReason &&
          other.createdAt == this.createdAt &&
          other.nextRetryAt == this.nextRetryAt);
}

class PendingActionsTableCompanion
    extends UpdateCompanion<PendingActionsTableData> {
  final Value<int> id;
  final Value<String> actionId;
  final Value<String> type;
  final Value<String> payload;
  final Value<bool> synced;
  final Value<int> attempts;
  final Value<String> status;
  final Value<String?> failReason;
  final Value<DateTime> createdAt;
  final Value<DateTime?> nextRetryAt;
  const PendingActionsTableCompanion({
    this.id = const Value.absent(),
    this.actionId = const Value.absent(),
    this.type = const Value.absent(),
    this.payload = const Value.absent(),
    this.synced = const Value.absent(),
    this.attempts = const Value.absent(),
    this.status = const Value.absent(),
    this.failReason = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.nextRetryAt = const Value.absent(),
  });
  PendingActionsTableCompanion.insert({
    this.id = const Value.absent(),
    required String actionId,
    required String type,
    required String payload,
    this.synced = const Value.absent(),
    this.attempts = const Value.absent(),
    this.status = const Value.absent(),
    this.failReason = const Value.absent(),
    required DateTime createdAt,
    this.nextRetryAt = const Value.absent(),
  })  : actionId = Value(actionId),
        type = Value(type),
        payload = Value(payload),
        createdAt = Value(createdAt);
  static Insertable<PendingActionsTableData> custom({
    Expression<int>? id,
    Expression<String>? actionId,
    Expression<String>? type,
    Expression<String>? payload,
    Expression<bool>? synced,
    Expression<int>? attempts,
    Expression<String>? status,
    Expression<String>? failReason,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? nextRetryAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (actionId != null) 'action_id': actionId,
      if (type != null) 'type': type,
      if (payload != null) 'payload': payload,
      if (synced != null) 'synced': synced,
      if (attempts != null) 'attempts': attempts,
      if (status != null) 'status': status,
      if (failReason != null) 'fail_reason': failReason,
      if (createdAt != null) 'created_at': createdAt,
      if (nextRetryAt != null) 'next_retry_at': nextRetryAt,
    });
  }

  PendingActionsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? actionId,
      Value<String>? type,
      Value<String>? payload,
      Value<bool>? synced,
      Value<int>? attempts,
      Value<String>? status,
      Value<String?>? failReason,
      Value<DateTime>? createdAt,
      Value<DateTime?>? nextRetryAt}) {
    return PendingActionsTableCompanion(
      id: id ?? this.id,
      actionId: actionId ?? this.actionId,
      type: type ?? this.type,
      payload: payload ?? this.payload,
      synced: synced ?? this.synced,
      attempts: attempts ?? this.attempts,
      status: status ?? this.status,
      failReason: failReason ?? this.failReason,
      createdAt: createdAt ?? this.createdAt,
      nextRetryAt: nextRetryAt ?? this.nextRetryAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (actionId.present) {
      map['action_id'] = Variable<String>(actionId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (failReason.present) {
      map['fail_reason'] = Variable<String>(failReason.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (nextRetryAt.present) {
      map['next_retry_at'] = Variable<DateTime>(nextRetryAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingActionsTableCompanion(')
          ..write('id: $id, ')
          ..write('actionId: $actionId, ')
          ..write('type: $type, ')
          ..write('payload: $payload, ')
          ..write('synced: $synced, ')
          ..write('attempts: $attempts, ')
          ..write('status: $status, ')
          ..write('failReason: $failReason, ')
          ..write('createdAt: $createdAt, ')
          ..write('nextRetryAt: $nextRetryAt')
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
  Value<double?> lat,
  Value<double?> lng,
  Value<String?> deviceId,
  Value<String?> sessionId,
  Value<String?> imageUrl,
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
  Value<double?> lat,
  Value<double?> lng,
  Value<String?> deviceId,
  Value<String?> sessionId,
  Value<String?> imageUrl,
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

  ColumnFilters<double> get lat => $composableBuilder(
      column: $table.lat, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lng => $composableBuilder(
      column: $table.lng, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<double> get lat => $composableBuilder(
      column: $table.lat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lng => $composableBuilder(
      column: $table.lng, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

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
            Value<double?> lat = const Value.absent(),
            Value<double?> lng = const Value.absent(),
            Value<String?> deviceId = const Value.absent(),
            Value<String?> sessionId = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
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
            lat: lat,
            lng: lng,
            deviceId: deviceId,
            sessionId: sessionId,
            imageUrl: imageUrl,
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
            Value<double?> lat = const Value.absent(),
            Value<double?> lng = const Value.absent(),
            Value<String?> deviceId = const Value.absent(),
            Value<String?> sessionId = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
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
            lat: lat,
            lng: lng,
            deviceId: deviceId,
            sessionId: sessionId,
            imageUrl: imageUrl,
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
  Value<int> id,
  required String actionId,
  required String type,
  required String payload,
  Value<bool> synced,
  Value<int> attempts,
  Value<String> status,
  Value<String?> failReason,
  required DateTime createdAt,
  Value<DateTime?> nextRetryAt,
});
typedef $$PendingActionsTableTableUpdateCompanionBuilder
    = PendingActionsTableCompanion Function({
  Value<int> id,
  Value<String> actionId,
  Value<String> type,
  Value<String> payload,
  Value<bool> synced,
  Value<int> attempts,
  Value<String> status,
  Value<String?> failReason,
  Value<DateTime> createdAt,
  Value<DateTime?> nextRetryAt,
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
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get actionId => $composableBuilder(
      column: $table.actionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get failReason => $composableBuilder(
      column: $table.failReason, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextRetryAt => $composableBuilder(
      column: $table.nextRetryAt, builder: (column) => ColumnFilters(column));
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
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get actionId => $composableBuilder(
      column: $table.actionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get failReason => $composableBuilder(
      column: $table.failReason, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextRetryAt => $composableBuilder(
      column: $table.nextRetryAt, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get actionId =>
      $composableBuilder(column: $table.actionId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get failReason => $composableBuilder(
      column: $table.failReason, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get nextRetryAt => $composableBuilder(
      column: $table.nextRetryAt, builder: (column) => column);
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
            Value<int> id = const Value.absent(),
            Value<String> actionId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> payload = const Value.absent(),
            Value<bool> synced = const Value.absent(),
            Value<int> attempts = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> failReason = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> nextRetryAt = const Value.absent(),
          }) =>
              PendingActionsTableCompanion(
            id: id,
            actionId: actionId,
            type: type,
            payload: payload,
            synced: synced,
            attempts: attempts,
            status: status,
            failReason: failReason,
            createdAt: createdAt,
            nextRetryAt: nextRetryAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String actionId,
            required String type,
            required String payload,
            Value<bool> synced = const Value.absent(),
            Value<int> attempts = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> failReason = const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> nextRetryAt = const Value.absent(),
          }) =>
              PendingActionsTableCompanion.insert(
            id: id,
            actionId: actionId,
            type: type,
            payload: payload,
            synced: synced,
            attempts: attempts,
            status: status,
            failReason: failReason,
            createdAt: createdAt,
            nextRetryAt: nextRetryAt,
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
