import 'package:json_annotation/json_annotation.dart';
import 'package:licence/features/auth/bussiness/entity/login_request.dart';
part 'login_request_dto.g.dart';

@JsonSerializable()
class LoginRequestDto extends LoginRequest {
  LoginRequestDto({required super.email, required super.password});
  
        factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);

 
  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);

}