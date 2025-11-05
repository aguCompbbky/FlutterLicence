
import 'package:json_annotation/json_annotation.dart';
import 'package:licence/features/auth/bussiness/entity/login_response.dart';
part 'login_response_dto.g.dart';
@JsonSerializable()
class LoginResponseDto extends LoginResponse{
  LoginResponseDto({required super.loginToken});

      factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);

 
  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);

  
}