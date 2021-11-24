// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Packages _$_$_PackagesFromJson(Map<String, dynamic> json) {
  return _$_Packages(
    title: json['title'] as String,
    packageDetails: (json['packageDetails'] as List)
        ?.map((e) => e == null
            ? null
            : PackageDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_PackagesToJson(_$_Packages instance) =>
    <String, dynamic>{
      'title': instance.title,
      'packageDetails': instance.packageDetails,
    };

_$_PackageDetails _$_$_PackageDetailsFromJson(Map<String, dynamic> json) {
  return _$_PackageDetails(
    title: json['title'] as String,
    price: json['price'] as int,
    newPrice: json['newPrice'] as int,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$_$_PackageDetailsToJson(_$_PackageDetails instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'newPrice': instance.newPrice,
      'content': instance.content,
    };
