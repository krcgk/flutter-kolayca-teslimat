import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String firstName;
  String lastName;
  String phoneNumber;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
