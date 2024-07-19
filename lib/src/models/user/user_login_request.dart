import 'package:json_annotation/json_annotation.dart';

part 'user_login_request.g.dart';

@JsonSerializable()
class UserLoginRequest {
  String email;
  String password;
  bool rememberMe;

  UserLoginRequest({
    required this.email,
    required this.password,
    this.rememberMe = true,
  });

  factory UserLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$UserLoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginRequestToJson(this);
}
