import 'package:json_annotation/json_annotation.dart';

class LoginResponse {
  LoginResponse({required this.loginToken});
  @JsonKey(name: 'token')
  final String loginToken;
  
}