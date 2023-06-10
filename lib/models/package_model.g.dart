// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PackageModelCWProxy {
  PackageModel id(int id);

  PackageModel responsibleUserId(int? responsibleUserId);

  PackageModel typeName(String typeName);

  PackageModel status(String status);

  PackageModel price(num price);

  PackageModel description(String description);

  PackageModel position(PackagePositionModel position);

  PackageModel sender(PackagePersonModel sender);

  PackageModel receiver(PackagePersonModel receiver);

  PackageModel photo(String? photo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PackageModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PackageModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PackageModel call({
    int? id,
    int? responsibleUserId,
    String? typeName,
    String? status,
    num? price,
    String? description,
    PackagePositionModel? position,
    PackagePersonModel? sender,
    PackagePersonModel? receiver,
    String? photo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPackageModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPackageModel.copyWith.fieldName(...)`
class _$PackageModelCWProxyImpl implements _$PackageModelCWProxy {
  const _$PackageModelCWProxyImpl(this._value);

  final PackageModel _value;

  @override
  PackageModel id(int id) => this(id: id);

  @override
  PackageModel responsibleUserId(int? responsibleUserId) =>
      this(responsibleUserId: responsibleUserId);

  @override
  PackageModel typeName(String typeName) => this(typeName: typeName);

  @override
  PackageModel status(String status) => this(status: status);

  @override
  PackageModel price(num price) => this(price: price);

  @override
  PackageModel description(String description) =>
      this(description: description);

  @override
  PackageModel position(PackagePositionModel position) =>
      this(position: position);

  @override
  PackageModel sender(PackagePersonModel sender) => this(sender: sender);

  @override
  PackageModel receiver(PackagePersonModel receiver) =>
      this(receiver: receiver);

  @override
  PackageModel photo(String? photo) => this(photo: photo);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PackageModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PackageModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PackageModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? responsibleUserId = const $CopyWithPlaceholder(),
    Object? typeName = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? position = const $CopyWithPlaceholder(),
    Object? sender = const $CopyWithPlaceholder(),
    Object? receiver = const $CopyWithPlaceholder(),
    Object? photo = const $CopyWithPlaceholder(),
  }) {
    return PackageModel(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      responsibleUserId: responsibleUserId == const $CopyWithPlaceholder()
          ? _value.responsibleUserId
          // ignore: cast_nullable_to_non_nullable
          : responsibleUserId as int?,
      typeName: typeName == const $CopyWithPlaceholder() || typeName == null
          ? _value.typeName
          // ignore: cast_nullable_to_non_nullable
          : typeName as String,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String,
      price: price == const $CopyWithPlaceholder() || price == null
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as num,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      position: position == const $CopyWithPlaceholder() || position == null
          ? _value.position
          // ignore: cast_nullable_to_non_nullable
          : position as PackagePositionModel,
      sender: sender == const $CopyWithPlaceholder() || sender == null
          ? _value.sender
          // ignore: cast_nullable_to_non_nullable
          : sender as PackagePersonModel,
      receiver: receiver == const $CopyWithPlaceholder() || receiver == null
          ? _value.receiver
          // ignore: cast_nullable_to_non_nullable
          : receiver as PackagePersonModel,
      photo: photo == const $CopyWithPlaceholder()
          ? _value.photo
          // ignore: cast_nullable_to_non_nullable
          : photo as String?,
    );
  }
}

extension $PackageModelCopyWith on PackageModel {
  /// Returns a callable class that can be used as follows: `instanceOfPackageModel.copyWith(...)` or like so:`instanceOfPackageModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PackageModelCWProxy get copyWith => _$PackageModelCWProxyImpl(this);
}

abstract class _$PackagePositionModelCWProxy {
  PackagePositionModel latitude(double latitude);

  PackagePositionModel longitude(double longitude);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PackagePositionModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PackagePositionModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PackagePositionModel call({
    double? latitude,
    double? longitude,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPackagePositionModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPackagePositionModel.copyWith.fieldName(...)`
class _$PackagePositionModelCWProxyImpl
    implements _$PackagePositionModelCWProxy {
  const _$PackagePositionModelCWProxyImpl(this._value);

  final PackagePositionModel _value;

  @override
  PackagePositionModel latitude(double latitude) => this(latitude: latitude);

  @override
  PackagePositionModel longitude(double longitude) =>
      this(longitude: longitude);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PackagePositionModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PackagePositionModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PackagePositionModel call({
    Object? latitude = const $CopyWithPlaceholder(),
    Object? longitude = const $CopyWithPlaceholder(),
  }) {
    return PackagePositionModel(
      latitude: latitude == const $CopyWithPlaceholder() || latitude == null
          ? _value.latitude
          // ignore: cast_nullable_to_non_nullable
          : latitude as double,
      longitude: longitude == const $CopyWithPlaceholder() || longitude == null
          ? _value.longitude
          // ignore: cast_nullable_to_non_nullable
          : longitude as double,
    );
  }
}

extension $PackagePositionModelCopyWith on PackagePositionModel {
  /// Returns a callable class that can be used as follows: `instanceOfPackagePositionModel.copyWith(...)` or like so:`instanceOfPackagePositionModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PackagePositionModelCWProxy get copyWith =>
      _$PackagePositionModelCWProxyImpl(this);
}

abstract class _$PackagePersonModelCWProxy {
  PackagePersonModel firstName(String firstName);

  PackagePersonModel lastName(String lastName);

  PackagePersonModel phoneNumber(String phoneNumber);

  PackagePersonModel city(String city);

  PackagePersonModel district(String district);

  PackagePersonModel address(String address);

  PackagePersonModel postalCode(String postalCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PackagePersonModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PackagePersonModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PackagePersonModel call({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? city,
    String? district,
    String? address,
    String? postalCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPackagePersonModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPackagePersonModel.copyWith.fieldName(...)`
class _$PackagePersonModelCWProxyImpl implements _$PackagePersonModelCWProxy {
  const _$PackagePersonModelCWProxyImpl(this._value);

  final PackagePersonModel _value;

  @override
  PackagePersonModel firstName(String firstName) => this(firstName: firstName);

  @override
  PackagePersonModel lastName(String lastName) => this(lastName: lastName);

  @override
  PackagePersonModel phoneNumber(String phoneNumber) =>
      this(phoneNumber: phoneNumber);

  @override
  PackagePersonModel city(String city) => this(city: city);

  @override
  PackagePersonModel district(String district) => this(district: district);

  @override
  PackagePersonModel address(String address) => this(address: address);

  @override
  PackagePersonModel postalCode(String postalCode) =>
      this(postalCode: postalCode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PackagePersonModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PackagePersonModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PackagePersonModel call({
    Object? firstName = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? city = const $CopyWithPlaceholder(),
    Object? district = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? postalCode = const $CopyWithPlaceholder(),
  }) {
    return PackagePersonModel(
      firstName: firstName == const $CopyWithPlaceholder() || firstName == null
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String,
      lastName: lastName == const $CopyWithPlaceholder() || lastName == null
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String,
      phoneNumber:
          phoneNumber == const $CopyWithPlaceholder() || phoneNumber == null
              ? _value.phoneNumber
              // ignore: cast_nullable_to_non_nullable
              : phoneNumber as String,
      city: city == const $CopyWithPlaceholder() || city == null
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as String,
      district: district == const $CopyWithPlaceholder() || district == null
          ? _value.district
          // ignore: cast_nullable_to_non_nullable
          : district as String,
      address: address == const $CopyWithPlaceholder() || address == null
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String,
      postalCode:
          postalCode == const $CopyWithPlaceholder() || postalCode == null
              ? _value.postalCode
              // ignore: cast_nullable_to_non_nullable
              : postalCode as String,
    );
  }
}

extension $PackagePersonModelCopyWith on PackagePersonModel {
  /// Returns a callable class that can be used as follows: `instanceOfPackagePersonModel.copyWith(...)` or like so:`instanceOfPackagePersonModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PackagePersonModelCWProxy get copyWith =>
      _$PackagePersonModelCWProxyImpl(this);
}

abstract class _$PackageRouteModelCWProxy {
  PackageRouteModel distanceMeters(num distanceMeters);

  PackageRouteModel duration(String duration);

  PackageRouteModel polyline(PackageRoutePolyLineModel polyline);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PackageRouteModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PackageRouteModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PackageRouteModel call({
    num? distanceMeters,
    String? duration,
    PackageRoutePolyLineModel? polyline,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPackageRouteModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPackageRouteModel.copyWith.fieldName(...)`
class _$PackageRouteModelCWProxyImpl implements _$PackageRouteModelCWProxy {
  const _$PackageRouteModelCWProxyImpl(this._value);

  final PackageRouteModel _value;

  @override
  PackageRouteModel distanceMeters(num distanceMeters) =>
      this(distanceMeters: distanceMeters);

  @override
  PackageRouteModel duration(String duration) => this(duration: duration);

  @override
  PackageRouteModel polyline(PackageRoutePolyLineModel polyline) =>
      this(polyline: polyline);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PackageRouteModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PackageRouteModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PackageRouteModel call({
    Object? distanceMeters = const $CopyWithPlaceholder(),
    Object? duration = const $CopyWithPlaceholder(),
    Object? polyline = const $CopyWithPlaceholder(),
  }) {
    return PackageRouteModel(
      distanceMeters: distanceMeters == const $CopyWithPlaceholder() ||
              distanceMeters == null
          ? _value.distanceMeters
          // ignore: cast_nullable_to_non_nullable
          : distanceMeters as num,
      duration: duration == const $CopyWithPlaceholder() || duration == null
          ? _value.duration
          // ignore: cast_nullable_to_non_nullable
          : duration as String,
      polyline: polyline == const $CopyWithPlaceholder() || polyline == null
          ? _value.polyline
          // ignore: cast_nullable_to_non_nullable
          : polyline as PackageRoutePolyLineModel,
    );
  }
}

extension $PackageRouteModelCopyWith on PackageRouteModel {
  /// Returns a callable class that can be used as follows: `instanceOfPackageRouteModel.copyWith(...)` or like so:`instanceOfPackageRouteModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PackageRouteModelCWProxy get copyWith =>
      _$PackageRouteModelCWProxyImpl(this);
}

abstract class _$PackageRoutePolyLineModelCWProxy {
  PackageRoutePolyLineModel encodedPolyline(String encodedPolyline);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PackageRoutePolyLineModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PackageRoutePolyLineModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PackageRoutePolyLineModel call({
    String? encodedPolyline,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPackageRoutePolyLineModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPackageRoutePolyLineModel.copyWith.fieldName(...)`
class _$PackageRoutePolyLineModelCWProxyImpl
    implements _$PackageRoutePolyLineModelCWProxy {
  const _$PackageRoutePolyLineModelCWProxyImpl(this._value);

  final PackageRoutePolyLineModel _value;

  @override
  PackageRoutePolyLineModel encodedPolyline(String encodedPolyline) =>
      this(encodedPolyline: encodedPolyline);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PackageRoutePolyLineModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PackageRoutePolyLineModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PackageRoutePolyLineModel call({
    Object? encodedPolyline = const $CopyWithPlaceholder(),
  }) {
    return PackageRoutePolyLineModel(
      encodedPolyline: encodedPolyline == const $CopyWithPlaceholder() ||
              encodedPolyline == null
          ? _value.encodedPolyline
          // ignore: cast_nullable_to_non_nullable
          : encodedPolyline as String,
    );
  }
}

extension $PackageRoutePolyLineModelCopyWith on PackageRoutePolyLineModel {
  /// Returns a callable class that can be used as follows: `instanceOfPackageRoutePolyLineModel.copyWith(...)` or like so:`instanceOfPackageRoutePolyLineModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PackageRoutePolyLineModelCWProxy get copyWith =>
      _$PackageRoutePolyLineModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageModel _$PackageModelFromJson(Map<String, dynamic> json) => PackageModel(
      id: json['id'] as int,
      responsibleUserId: json['responsibleUserId'] as int?,
      typeName: json['typeName'] as String,
      status: json['status'] as String,
      price: json['price'] as num,
      description: json['description'] as String,
      position: PackagePositionModel.fromJson(
          json['position'] as Map<String, dynamic>),
      sender:
          PackagePersonModel.fromJson(json['sender'] as Map<String, dynamic>),
      receiver:
          PackagePersonModel.fromJson(json['receiver'] as Map<String, dynamic>),
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$PackageModelToJson(PackageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'responsibleUserId': instance.responsibleUserId,
      'typeName': instance.typeName,
      'status': instance.status,
      'price': instance.price,
      'description': instance.description,
      'position': instance.position,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'photo': instance.photo,
    };

PackagePositionModel _$PackagePositionModelFromJson(
        Map<String, dynamic> json) =>
    PackagePositionModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$PackagePositionModelToJson(
        PackagePositionModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

PackagePersonModel _$PackagePersonModelFromJson(Map<String, dynamic> json) =>
    PackagePersonModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
      address: json['address'] as String,
      postalCode: json['postalCode'] as String,
    );

Map<String, dynamic> _$PackagePersonModelToJson(PackagePersonModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'city': instance.city,
      'district': instance.district,
      'address': instance.address,
      'postalCode': instance.postalCode,
    };

PackageRouteModel _$PackageRouteModelFromJson(Map<String, dynamic> json) =>
    PackageRouteModel(
      distanceMeters: json['distanceMeters'] as num,
      duration: json['duration'] as String,
      polyline: PackageRoutePolyLineModel.fromJson(
          json['polyline'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PackageRouteModelToJson(PackageRouteModel instance) =>
    <String, dynamic>{
      'distanceMeters': instance.distanceMeters,
      'duration': instance.duration,
      'polyline': instance.polyline,
    };

PackageRoutePolyLineModel _$PackageRoutePolyLineModelFromJson(
        Map<String, dynamic> json) =>
    PackageRoutePolyLineModel(
      encodedPolyline: json['encodedPolyline'] as String,
    );

Map<String, dynamic> _$PackageRoutePolyLineModelToJson(
        PackageRoutePolyLineModel instance) =>
    <String, dynamic>{
      'encodedPolyline': instance.encodedPolyline,
    };
