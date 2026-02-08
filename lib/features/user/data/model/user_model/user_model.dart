import 'package:dalil_hama/features/user/domain/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: true)
class UserModel {
  final String email;
  final String username;
  final String id;

  UserModel({required this.email, required this.username, required this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

extension MapToDomain on UserModel {
  User toDomain() => User(email: email, id: id, username: username);
}

extension MapFromDomain on User {
  UserModel fromDomain() => UserModel(username: username, id: id, email: email);
}
