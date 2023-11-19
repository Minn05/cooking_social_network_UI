import 'package:json_annotation/json_annotation.dart';
// part 'api_service.g.dart';
part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  String email;
  String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
