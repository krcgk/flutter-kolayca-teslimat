import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String firstName;
  String lastName;
  String phoneNumber;
  String firstName1;
  String lastName2;
  String phoneNumber3;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.firstName1,
    required this.lastName2,
    required this.phoneNumber3,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
