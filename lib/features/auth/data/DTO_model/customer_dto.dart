import 'package:json_annotation/json_annotation.dart';
import 'package:licence/features/auth/bussiness/entity/customer.dart';
part 'customer_dto.g.dart';
@JsonSerializable()
class CustomerDto extends Customer{
  CustomerDto({required super.id, required super.name, required super.surname, required super.email, required super.password});

    factory CustomerDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerDtoFromJson(json);

 
  Map<String, dynamic> toJson() => _$CustomerDtoToJson(this);

  

}
