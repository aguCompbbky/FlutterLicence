
import 'package:licence/features/licenceAPI/product/bussiness/entity/product.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto extends Product{
  ProductDto({required super.id, required super.productName, required super.productAmount});
    

 
  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

 
  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);

  Product toEntity() { //lisanslar için kullandık normalde extends ile çözmüştük
    return Product(
      id: id,
      productAmount: productAmount, 
      productName: productName,
    );
  }
}


 