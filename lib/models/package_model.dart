import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package_model.g.dart';

@CopyWith()
@JsonSerializable()
class PackageModel {
  int id;
  int? responsibleUserId;
  String typeName;
  String status;
  num price;
  String description;
  PackagePositionModel position;
  PackagePersonModel sender;
  PackagePersonModel receiver;
  String? photo;

  PackageModel({
    required this.id,
    this.responsibleUserId,
    required this.typeName,
    required this.status,
    required this.price,
    required this.description,
    required this.position,
    required this.sender,
    required this.receiver,
    this.photo,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) => _$PackageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PackageModelToJson(this);
}

@CopyWith()
@JsonSerializable()
class PackagePositionModel {
  double latitude;
  double longitude;

  PackagePositionModel({
    required this.latitude,
    required this.longitude,
  });

  factory PackagePositionModel.fromJson(Map<String, dynamic> json) => _$PackagePositionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PackagePositionModelToJson(this);
}

@CopyWith()
@JsonSerializable()
class PackagePersonModel {
  String firstName;
  String lastName;
  String phoneNumber;
  String city;
  String district;
  String address;
  String postalCode;

  PackagePersonModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.city,
    required this.district,
    required this.address,
    required this.postalCode,
  });

  factory PackagePersonModel.fromJson(Map<String, dynamic> json) => _$PackagePersonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PackagePersonModelToJson(this);
}

@CopyWith()
@JsonSerializable()
class PackageRouteModel {
  num distanceMeters;
  String duration;
  PackageRoutePolyLineModel polyline;

  PackageRouteModel({
    required this.distanceMeters,
    required this.duration,
    required this.polyline,
  });

  factory PackageRouteModel.fromJson(Map<String, dynamic> json) => _$PackageRouteModelFromJson(json);

  Map<String, dynamic> toJson() => _$PackageRouteModelToJson(this);
}

@CopyWith()
@JsonSerializable()
class PackageRoutePolyLineModel {
  String encodedPolyline;

  PackageRoutePolyLineModel({
    required this.encodedPolyline,
  });

  factory PackageRoutePolyLineModel.fromJson(Map<String, dynamic> json) => _$PackageRoutePolyLineModelFromJson(json);

  Map<String, dynamic> toJson() => _$PackageRoutePolyLineModelToJson(this);
}
