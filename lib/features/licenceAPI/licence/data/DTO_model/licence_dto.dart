import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:licence/features/licenceAPI/licence/bussiness/entity/licence.dart';
import 'package:licence/features/licenceAPI/product/data/DTO_model/product_dto.dart';
part 'licence_dto.g.dart';

//bu annotioni toJsonda formatlar çakışmasın diye yazdık
class DateConverter implements JsonConverter<DateTime, String> {
  const DateConverter();
  
  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) {
    return DateFormat('yyyy-MM-dd').format(object); 
  }
}


@JsonSerializable()
class LicenceDto {
  LicenceDto({required this.id, required this.licenseName, required this.startDate, required this.endDate, required this.products, required this.amountOfUser, required this.licensePrice, required this.isAktive});

  
  final int id;
  final String licenseName;

  @DateConverter()
  final DateTime startDate;

  @DateConverter()
  final DateTime endDate;

  final List<ProductDto> products;
  final int amountOfUser;
  final double licensePrice;
  final bool isAktive;

  factory LicenceDto.fromJson(Map<String, dynamic> json) => _$LicenceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LicenceDtoToJson(this);

  Licence toEntity() {
    return Licence(
      id: id,
      licenseName: licenseName,
      startDate: startDate,
      endDate: endDate,
      // ProductDto listesini Product Entity listesine çevirin
      products: products.map((e) => e.toEntity()).toList(), 
      amountOfUser: amountOfUser,
      licensePrice: licensePrice,
      isAktive: isAktive,
    );
  }
  
}