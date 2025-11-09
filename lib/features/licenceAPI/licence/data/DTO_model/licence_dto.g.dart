// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'licence_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LicenceDto _$LicenceDtoFromJson(Map<String, dynamic> json) => LicenceDto(
  id: (json['id'] as num).toInt(),
  licenseName: json['licenseName'] as String,
  startDate: const DateConverter().fromJson(json['startDate'] as String),
  endDate: const DateConverter().fromJson(json['endDate'] as String),
  licensePrice: (json['licensePrice'] as num).toDouble(),
  productIds:
      (json['productList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  amountOfUser: (json['amountOfUser'] as num).toInt(),
  isAktive: json['aktive'] as bool,
);

Map<String, dynamic> _$LicenceDtoToJson(LicenceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'licenseName': instance.licenseName,
      'startDate': const DateConverter().toJson(instance.startDate),
      'endDate': const DateConverter().toJson(instance.endDate),
      'licensePrice': instance.licensePrice,
      'productList': instance.productIds,
      'amountOfUser': instance.amountOfUser,
      'aktive': instance.isAktive,
    };
