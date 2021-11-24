import 'package:freezed_annotation/freezed_annotation.dart';

part 'package.freezed.dart';
part 'package.g.dart';

@freezed
abstract class Packages with _$Packages {
  factory Packages({
    String title,
    List<PackageDetails> packageDetails,
  }) = _Packages;

  factory Packages.fromJson(Map<String, dynamic> json) =>
      _$PackagesFromJson(json);
}

@freezed
abstract class PackageDetails with _$PackageDetails {
  factory PackageDetails({
    String title,
    int price,
    int newPrice,
    String content,
  }) = _PackageDetails;

  factory PackageDetails.fromJson(Map<String, dynamic> json) =>
      _$PackageDetailsFromJson(json);
}
