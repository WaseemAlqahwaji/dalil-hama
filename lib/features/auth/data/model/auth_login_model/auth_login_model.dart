import 'package:dalil_hama/features/auth/domain/params/auth_login_params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_login_model.g.dart';

@JsonSerializable(createFactory: false ,createToJson: true)
class AuthLoginModel {
  @JsonKey(name: "userName")
  final String username;
  final String password;

  AuthLoginModel({required this.username, required this.password});

  Map<String, dynamic> toJson() => _$AuthLoginModelToJson(this);
}

extension MapFromDomain on AuthLoginParams {
  AuthLoginModel fromDomain() =>
      AuthLoginModel(
          username: username!,
          password: password!

      );
}
