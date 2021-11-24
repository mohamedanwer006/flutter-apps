// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'package.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Packages _$PackagesFromJson(Map<String, dynamic> json) {
  return _Packages.fromJson(json);
}

class _$PackagesTearOff {
  const _$PackagesTearOff();

// ignore: unused_element
  _Packages call({String title, List<PackageDetails> packageDetails}) {
    return _Packages(
      title: title,
      packageDetails: packageDetails,
    );
  }
}

// ignore: unused_element
const $Packages = _$PackagesTearOff();

mixin _$Packages {
  String get title;
  List<PackageDetails> get packageDetails;

  Map<String, dynamic> toJson();
  $PackagesCopyWith<Packages> get copyWith;
}

abstract class $PackagesCopyWith<$Res> {
  factory $PackagesCopyWith(Packages value, $Res Function(Packages) then) =
      _$PackagesCopyWithImpl<$Res>;
  $Res call({String title, List<PackageDetails> packageDetails});
}

class _$PackagesCopyWithImpl<$Res> implements $PackagesCopyWith<$Res> {
  _$PackagesCopyWithImpl(this._value, this._then);

  final Packages _value;
  // ignore: unused_field
  final $Res Function(Packages) _then;

  @override
  $Res call({
    Object title = freezed,
    Object packageDetails = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      packageDetails: packageDetails == freezed
          ? _value.packageDetails
          : packageDetails as List<PackageDetails>,
    ));
  }
}

abstract class _$PackagesCopyWith<$Res> implements $PackagesCopyWith<$Res> {
  factory _$PackagesCopyWith(_Packages value, $Res Function(_Packages) then) =
      __$PackagesCopyWithImpl<$Res>;
  @override
  $Res call({String title, List<PackageDetails> packageDetails});
}

class __$PackagesCopyWithImpl<$Res> extends _$PackagesCopyWithImpl<$Res>
    implements _$PackagesCopyWith<$Res> {
  __$PackagesCopyWithImpl(_Packages _value, $Res Function(_Packages) _then)
      : super(_value, (v) => _then(v as _Packages));

  @override
  _Packages get _value => super._value as _Packages;

  @override
  $Res call({
    Object title = freezed,
    Object packageDetails = freezed,
  }) {
    return _then(_Packages(
      title: title == freezed ? _value.title : title as String,
      packageDetails: packageDetails == freezed
          ? _value.packageDetails
          : packageDetails as List<PackageDetails>,
    ));
  }
}

@JsonSerializable()
class _$_Packages implements _Packages {
  _$_Packages({this.title, this.packageDetails});

  factory _$_Packages.fromJson(Map<String, dynamic> json) =>
      _$_$_PackagesFromJson(json);

  @override
  final String title;
  @override
  final List<PackageDetails> packageDetails;

  @override
  String toString() {
    return 'Packages(title: $title, packageDetails: $packageDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Packages &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.packageDetails, packageDetails) ||
                const DeepCollectionEquality()
                    .equals(other.packageDetails, packageDetails)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(packageDetails);

  @override
  _$PackagesCopyWith<_Packages> get copyWith =>
      __$PackagesCopyWithImpl<_Packages>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PackagesToJson(this);
  }
}

abstract class _Packages implements Packages {
  factory _Packages({String title, List<PackageDetails> packageDetails}) =
      _$_Packages;

  factory _Packages.fromJson(Map<String, dynamic> json) = _$_Packages.fromJson;

  @override
  String get title;
  @override
  List<PackageDetails> get packageDetails;
  @override
  _$PackagesCopyWith<_Packages> get copyWith;
}

PackageDetails _$PackageDetailsFromJson(Map<String, dynamic> json) {
  return _PackageDetails.fromJson(json);
}

class _$PackageDetailsTearOff {
  const _$PackageDetailsTearOff();

// ignore: unused_element
  _PackageDetails call(
      {String title, int price, int newPrice, String content}) {
    return _PackageDetails(
      title: title,
      price: price,
      newPrice: newPrice,
      content: content,
    );
  }
}

// ignore: unused_element
const $PackageDetails = _$PackageDetailsTearOff();

mixin _$PackageDetails {
  String get title;
  int get price;
  int get newPrice;
  String get content;

  Map<String, dynamic> toJson();
  $PackageDetailsCopyWith<PackageDetails> get copyWith;
}

abstract class $PackageDetailsCopyWith<$Res> {
  factory $PackageDetailsCopyWith(
          PackageDetails value, $Res Function(PackageDetails) then) =
      _$PackageDetailsCopyWithImpl<$Res>;
  $Res call({String title, int price, int newPrice, String content});
}

class _$PackageDetailsCopyWithImpl<$Res>
    implements $PackageDetailsCopyWith<$Res> {
  _$PackageDetailsCopyWithImpl(this._value, this._then);

  final PackageDetails _value;
  // ignore: unused_field
  final $Res Function(PackageDetails) _then;

  @override
  $Res call({
    Object title = freezed,
    Object price = freezed,
    Object newPrice = freezed,
    Object content = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      price: price == freezed ? _value.price : price as int,
      newPrice: newPrice == freezed ? _value.newPrice : newPrice as int,
      content: content == freezed ? _value.content : content as String,
    ));
  }
}

abstract class _$PackageDetailsCopyWith<$Res>
    implements $PackageDetailsCopyWith<$Res> {
  factory _$PackageDetailsCopyWith(
          _PackageDetails value, $Res Function(_PackageDetails) then) =
      __$PackageDetailsCopyWithImpl<$Res>;
  @override
  $Res call({String title, int price, int newPrice, String content});
}

class __$PackageDetailsCopyWithImpl<$Res>
    extends _$PackageDetailsCopyWithImpl<$Res>
    implements _$PackageDetailsCopyWith<$Res> {
  __$PackageDetailsCopyWithImpl(
      _PackageDetails _value, $Res Function(_PackageDetails) _then)
      : super(_value, (v) => _then(v as _PackageDetails));

  @override
  _PackageDetails get _value => super._value as _PackageDetails;

  @override
  $Res call({
    Object title = freezed,
    Object price = freezed,
    Object newPrice = freezed,
    Object content = freezed,
  }) {
    return _then(_PackageDetails(
      title: title == freezed ? _value.title : title as String,
      price: price == freezed ? _value.price : price as int,
      newPrice: newPrice == freezed ? _value.newPrice : newPrice as int,
      content: content == freezed ? _value.content : content as String,
    ));
  }
}

@JsonSerializable()
class _$_PackageDetails implements _PackageDetails {
  _$_PackageDetails({this.title, this.price, this.newPrice, this.content});

  factory _$_PackageDetails.fromJson(Map<String, dynamic> json) =>
      _$_$_PackageDetailsFromJson(json);

  @override
  final String title;
  @override
  final int price;
  @override
  final int newPrice;
  @override
  final String content;

  @override
  String toString() {
    return 'PackageDetails(title: $title, price: $price, newPrice: $newPrice, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PackageDetails &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.newPrice, newPrice) ||
                const DeepCollectionEquality()
                    .equals(other.newPrice, newPrice)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(newPrice) ^
      const DeepCollectionEquality().hash(content);

  @override
  _$PackageDetailsCopyWith<_PackageDetails> get copyWith =>
      __$PackageDetailsCopyWithImpl<_PackageDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PackageDetailsToJson(this);
  }
}

abstract class _PackageDetails implements PackageDetails {
  factory _PackageDetails(
      {String title,
      int price,
      int newPrice,
      String content}) = _$_PackageDetails;

  factory _PackageDetails.fromJson(Map<String, dynamic> json) =
      _$_PackageDetails.fromJson;

  @override
  String get title;
  @override
  int get price;
  @override
  int get newPrice;
  @override
  String get content;
  @override
  _$PackageDetailsCopyWith<_PackageDetails> get copyWith;
}
