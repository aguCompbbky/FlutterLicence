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
  LicenceDto({required this.id, required this.licenseName, required this.startDate, required this.endDate, required this.licensePrice, required this.productIds, required this.amountOfUser,  required this.isAktive});

  @JsonKey(includeIfNull: false)
  final int id;
  final String licenseName;

  @DateConverter()
  final DateTime startDate;

  @DateConverter()
  final DateTime endDate;

  final double licensePrice;
  
  @JsonKey(defaultValue: [],name: "productIds")
  final List<int> productIds;
  final int amountOfUser;
  @JsonKey(name: "aktive")
  final bool isAktive;

  factory LicenceDto.fromJson(Map<String, dynamic> json) => _$LicenceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LicenceDtoToJson(this);

  Licence toEntity() {
    return Licence(
      id: id ?? 0,
      licenseName: licenseName,
      startDate: startDate,
      endDate: endDate,
      products: productIds,
      amountOfUser: amountOfUser,
      licensePrice: licensePrice,
      isAktive: true,
    );
  }
  
}