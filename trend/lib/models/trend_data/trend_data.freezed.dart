// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'trend_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TrendData _$TrendDataFromJson(Map<String, dynamic> json) {
  return _TrendData.fromJson(json);
}

class _$TrendDataTearOff {
  const _$TrendDataTearOff();

// ignore: unused_element
  _TrendData call(
      {List<TrendProject> projects,
      List<CarouselData> carouselImages,
      String title}) {
    return _TrendData(
      projects: projects,
      carouselImages: carouselImages,
      title: title,
    );
  }
}

// ignore: unused_element
const $TrendData = _$TrendDataTearOff();

mixin _$TrendData {
  List<TrendProject> get projects;
  List<CarouselData> get carouselImages;
  String get title;

  Map<String, dynamic> toJson();
  $TrendDataCopyWith<TrendData> get copyWith;
}

abstract class $TrendDataCopyWith<$Res> {
  factory $TrendDataCopyWith(TrendData value, $Res Function(TrendData) then) =
      _$TrendDataCopyWithImpl<$Res>;
  $Res call(
      {List<TrendProject> projects,
      List<CarouselData> carouselImages,
      String title});
}

class _$TrendDataCopyWithImpl<$Res> implements $TrendDataCopyWith<$Res> {
  _$TrendDataCopyWithImpl(this._value, this._then);

  final TrendData _value;
  // ignore: unused_field
  final $Res Function(TrendData) _then;

  @override
  $Res call({
    Object projects = freezed,
    Object carouselImages = freezed,
    Object title = freezed,
  }) {
    return _then(_value.copyWith(
      projects: projects == freezed
          ? _value.projects
          : projects as List<TrendProject>,
      carouselImages: carouselImages == freezed
          ? _value.carouselImages
          : carouselImages as List<CarouselData>,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

abstract class _$TrendDataCopyWith<$Res> implements $TrendDataCopyWith<$Res> {
  factory _$TrendDataCopyWith(
          _TrendData value, $Res Function(_TrendData) then) =
      __$TrendDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<TrendProject> projects,
      List<CarouselData> carouselImages,
      String title});
}

class __$TrendDataCopyWithImpl<$Res> extends _$TrendDataCopyWithImpl<$Res>
    implements _$TrendDataCopyWith<$Res> {
  __$TrendDataCopyWithImpl(_TrendData _value, $Res Function(_TrendData) _then)
      : super(_value, (v) => _then(v as _TrendData));

  @override
  _TrendData get _value => super._value as _TrendData;

  @override
  $Res call({
    Object projects = freezed,
    Object carouselImages = freezed,
    Object title = freezed,
  }) {
    return _then(_TrendData(
      projects: projects == freezed
          ? _value.projects
          : projects as List<TrendProject>,
      carouselImages: carouselImages == freezed
          ? _value.carouselImages
          : carouselImages as List<CarouselData>,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

@JsonSerializable()
class _$_TrendData implements _TrendData {
  _$_TrendData({this.projects, this.carouselImages, this.title});

  factory _$_TrendData.fromJson(Map<String, dynamic> json) =>
      _$_$_TrendDataFromJson(json);

  @override
  final List<TrendProject> projects;
  @override
  final List<CarouselData> carouselImages;
  @override
  final String title;

  @override
  String toString() {
    return 'TrendData(projects: $projects, carouselImages: $carouselImages, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TrendData &&
            (identical(other.projects, projects) ||
                const DeepCollectionEquality()
                    .equals(other.projects, projects)) &&
            (identical(other.carouselImages, carouselImages) ||
                const DeepCollectionEquality()
                    .equals(other.carouselImages, carouselImages)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(projects) ^
      const DeepCollectionEquality().hash(carouselImages) ^
      const DeepCollectionEquality().hash(title);

  @override
  _$TrendDataCopyWith<_TrendData> get copyWith =>
      __$TrendDataCopyWithImpl<_TrendData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TrendDataToJson(this);
  }
}

abstract class _TrendData implements TrendData {
  factory _TrendData(
      {List<TrendProject> projects,
      List<CarouselData> carouselImages,
      String title}) = _$_TrendData;

  factory _TrendData.fromJson(Map<String, dynamic> json) =
      _$_TrendData.fromJson;

  @override
  List<TrendProject> get projects;
  @override
  List<CarouselData> get carouselImages;
  @override
  String get title;
  @override
  _$TrendDataCopyWith<_TrendData> get copyWith;
}

TrendProject _$TrendProjectFromJson(Map<String, dynamic> json) {
  return _TrendProject.fromJson(json);
}

class _$TrendProjectTearOff {
  const _$TrendProjectTearOff();

// ignore: unused_element
  _TrendProject call({List<Project> projects, String title}) {
    return _TrendProject(
      projects: projects,
      title: title,
    );
  }
}

// ignore: unused_element
const $TrendProject = _$TrendProjectTearOff();

mixin _$TrendProject {
  List<Project> get projects;
  String get title;

  Map<String, dynamic> toJson();
  $TrendProjectCopyWith<TrendProject> get copyWith;
}

abstract class $TrendProjectCopyWith<$Res> {
  factory $TrendProjectCopyWith(
          TrendProject value, $Res Function(TrendProject) then) =
      _$TrendProjectCopyWithImpl<$Res>;
  $Res call({List<Project> projects, String title});
}

class _$TrendProjectCopyWithImpl<$Res> implements $TrendProjectCopyWith<$Res> {
  _$TrendProjectCopyWithImpl(this._value, this._then);

  final TrendProject _value;
  // ignore: unused_field
  final $Res Function(TrendProject) _then;

  @override
  $Res call({
    Object projects = freezed,
    Object title = freezed,
  }) {
    return _then(_value.copyWith(
      projects:
          projects == freezed ? _value.projects : projects as List<Project>,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

abstract class _$TrendProjectCopyWith<$Res>
    implements $TrendProjectCopyWith<$Res> {
  factory _$TrendProjectCopyWith(
          _TrendProject value, $Res Function(_TrendProject) then) =
      __$TrendProjectCopyWithImpl<$Res>;
  @override
  $Res call({List<Project> projects, String title});
}

class __$TrendProjectCopyWithImpl<$Res> extends _$TrendProjectCopyWithImpl<$Res>
    implements _$TrendProjectCopyWith<$Res> {
  __$TrendProjectCopyWithImpl(
      _TrendProject _value, $Res Function(_TrendProject) _then)
      : super(_value, (v) => _then(v as _TrendProject));

  @override
  _TrendProject get _value => super._value as _TrendProject;

  @override
  $Res call({
    Object projects = freezed,
    Object title = freezed,
  }) {
    return _then(_TrendProject(
      projects:
          projects == freezed ? _value.projects : projects as List<Project>,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

@JsonSerializable()
class _$_TrendProject implements _TrendProject {
  _$_TrendProject({this.projects, this.title});

  factory _$_TrendProject.fromJson(Map<String, dynamic> json) =>
      _$_$_TrendProjectFromJson(json);

  @override
  final List<Project> projects;
  @override
  final String title;

  @override
  String toString() {
    return 'TrendProject(projects: $projects, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TrendProject &&
            (identical(other.projects, projects) ||
                const DeepCollectionEquality()
                    .equals(other.projects, projects)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(projects) ^
      const DeepCollectionEquality().hash(title);

  @override
  _$TrendProjectCopyWith<_TrendProject> get copyWith =>
      __$TrendProjectCopyWithImpl<_TrendProject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TrendProjectToJson(this);
  }
}

abstract class _TrendProject implements TrendProject {
  factory _TrendProject({List<Project> projects, String title}) =
      _$_TrendProject;

  factory _TrendProject.fromJson(Map<String, dynamic> json) =
      _$_TrendProject.fromJson;

  @override
  List<Project> get projects;
  @override
  String get title;
  @override
  _$TrendProjectCopyWith<_TrendProject> get copyWith;
}

CarouselData _$CarouselDataFromJson(Map<String, dynamic> json) {
  return _CarouselData.fromJson(json);
}

class _$CarouselDataTearOff {
  const _$CarouselDataTearOff();

// ignore: unused_element
  _CarouselData call(
      {String title,
      String subtitle,
      String imgUrl,
      String content,
      DateTime dateTime}) {
    return _CarouselData(
      title: title,
      subtitle: subtitle,
      imgUrl: imgUrl,
      content: content,
      dateTime: dateTime,
    );
  }
}

// ignore: unused_element
const $CarouselData = _$CarouselDataTearOff();

mixin _$CarouselData {
  String get title;
  String get subtitle;
  String get imgUrl;
  String get content;
  DateTime get dateTime;

  Map<String, dynamic> toJson();
  $CarouselDataCopyWith<CarouselData> get copyWith;
}

abstract class $CarouselDataCopyWith<$Res> {
  factory $CarouselDataCopyWith(
          CarouselData value, $Res Function(CarouselData) then) =
      _$CarouselDataCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String subtitle,
      String imgUrl,
      String content,
      DateTime dateTime});
}

class _$CarouselDataCopyWithImpl<$Res> implements $CarouselDataCopyWith<$Res> {
  _$CarouselDataCopyWithImpl(this._value, this._then);

  final CarouselData _value;
  // ignore: unused_field
  final $Res Function(CarouselData) _then;

  @override
  $Res call({
    Object title = freezed,
    Object subtitle = freezed,
    Object imgUrl = freezed,
    Object content = freezed,
    Object dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      subtitle: subtitle == freezed ? _value.subtitle : subtitle as String,
      imgUrl: imgUrl == freezed ? _value.imgUrl : imgUrl as String,
      content: content == freezed ? _value.content : content as String,
      dateTime: dateTime == freezed ? _value.dateTime : dateTime as DateTime,
    ));
  }
}

abstract class _$CarouselDataCopyWith<$Res>
    implements $CarouselDataCopyWith<$Res> {
  factory _$CarouselDataCopyWith(
          _CarouselData value, $Res Function(_CarouselData) then) =
      __$CarouselDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String subtitle,
      String imgUrl,
      String content,
      DateTime dateTime});
}

class __$CarouselDataCopyWithImpl<$Res> extends _$CarouselDataCopyWithImpl<$Res>
    implements _$CarouselDataCopyWith<$Res> {
  __$CarouselDataCopyWithImpl(
      _CarouselData _value, $Res Function(_CarouselData) _then)
      : super(_value, (v) => _then(v as _CarouselData));

  @override
  _CarouselData get _value => super._value as _CarouselData;

  @override
  $Res call({
    Object title = freezed,
    Object subtitle = freezed,
    Object imgUrl = freezed,
    Object content = freezed,
    Object dateTime = freezed,
  }) {
    return _then(_CarouselData(
      title: title == freezed ? _value.title : title as String,
      subtitle: subtitle == freezed ? _value.subtitle : subtitle as String,
      imgUrl: imgUrl == freezed ? _value.imgUrl : imgUrl as String,
      content: content == freezed ? _value.content : content as String,
      dateTime: dateTime == freezed ? _value.dateTime : dateTime as DateTime,
    ));
  }
}

@JsonSerializable()
class _$_CarouselData implements _CarouselData {
  _$_CarouselData(
      {this.title, this.subtitle, this.imgUrl, this.content, this.dateTime});

  factory _$_CarouselData.fromJson(Map<String, dynamic> json) =>
      _$_$_CarouselDataFromJson(json);

  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String imgUrl;
  @override
  final String content;
  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'CarouselData(title: $title, subtitle: $subtitle, imgUrl: $imgUrl, content: $content, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CarouselData &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.subtitle, subtitle) ||
                const DeepCollectionEquality()
                    .equals(other.subtitle, subtitle)) &&
            (identical(other.imgUrl, imgUrl) ||
                const DeepCollectionEquality().equals(other.imgUrl, imgUrl)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(subtitle) ^
      const DeepCollectionEquality().hash(imgUrl) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(dateTime);

  @override
  _$CarouselDataCopyWith<_CarouselData> get copyWith =>
      __$CarouselDataCopyWithImpl<_CarouselData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CarouselDataToJson(this);
  }
}

abstract class _CarouselData implements CarouselData {
  factory _CarouselData(
      {String title,
      String subtitle,
      String imgUrl,
      String content,
      DateTime dateTime}) = _$_CarouselData;

  factory _CarouselData.fromJson(Map<String, dynamic> json) =
      _$_CarouselData.fromJson;

  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get imgUrl;
  @override
  String get content;
  @override
  DateTime get dateTime;
  @override
  _$CarouselDataCopyWith<_CarouselData> get copyWith;
}

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

class _$ProjectTearOff {
  const _$ProjectTearOff();

// ignore: unused_element
  _Project call(
      {String type,
      String title,
      String subtitle,
      String imgUrl,
      String content,
      DateTime dateTime}) {
    return _Project(
      type: type,
      title: title,
      subtitle: subtitle,
      imgUrl: imgUrl,
      content: content,
      dateTime: dateTime,
    );
  }
}

// ignore: unused_element
const $Project = _$ProjectTearOff();

mixin _$Project {
  String get type;
  String get title;
  String get subtitle;
  String get imgUrl;
  String get content;
  DateTime get dateTime;

  Map<String, dynamic> toJson();
  $ProjectCopyWith<Project> get copyWith;
}

abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res>;
  $Res call(
      {String type,
      String title,
      String subtitle,
      String imgUrl,
      String content,
      DateTime dateTime});
}

class _$ProjectCopyWithImpl<$Res> implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  final Project _value;
  // ignore: unused_field
  final $Res Function(Project) _then;

  @override
  $Res call({
    Object type = freezed,
    Object title = freezed,
    Object subtitle = freezed,
    Object imgUrl = freezed,
    Object content = freezed,
    Object dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed ? _value.type : type as String,
      title: title == freezed ? _value.title : title as String,
      subtitle: subtitle == freezed ? _value.subtitle : subtitle as String,
      imgUrl: imgUrl == freezed ? _value.imgUrl : imgUrl as String,
      content: content == freezed ? _value.content : content as String,
      dateTime: dateTime == freezed ? _value.dateTime : dateTime as DateTime,
    ));
  }
}

abstract class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) then) =
      __$ProjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String type,
      String title,
      String subtitle,
      String imgUrl,
      String content,
      DateTime dateTime});
}

class __$ProjectCopyWithImpl<$Res> extends _$ProjectCopyWithImpl<$Res>
    implements _$ProjectCopyWith<$Res> {
  __$ProjectCopyWithImpl(_Project _value, $Res Function(_Project) _then)
      : super(_value, (v) => _then(v as _Project));

  @override
  _Project get _value => super._value as _Project;

  @override
  $Res call({
    Object type = freezed,
    Object title = freezed,
    Object subtitle = freezed,
    Object imgUrl = freezed,
    Object content = freezed,
    Object dateTime = freezed,
  }) {
    return _then(_Project(
      type: type == freezed ? _value.type : type as String,
      title: title == freezed ? _value.title : title as String,
      subtitle: subtitle == freezed ? _value.subtitle : subtitle as String,
      imgUrl: imgUrl == freezed ? _value.imgUrl : imgUrl as String,
      content: content == freezed ? _value.content : content as String,
      dateTime: dateTime == freezed ? _value.dateTime : dateTime as DateTime,
    ));
  }
}

@JsonSerializable()
class _$_Project implements _Project {
  _$_Project(
      {this.type,
      this.title,
      this.subtitle,
      this.imgUrl,
      this.content,
      this.dateTime});

  factory _$_Project.fromJson(Map<String, dynamic> json) =>
      _$_$_ProjectFromJson(json);

  @override
  final String type;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String imgUrl;
  @override
  final String content;
  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'Project(type: $type, title: $title, subtitle: $subtitle, imgUrl: $imgUrl, content: $content, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Project &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.subtitle, subtitle) ||
                const DeepCollectionEquality()
                    .equals(other.subtitle, subtitle)) &&
            (identical(other.imgUrl, imgUrl) ||
                const DeepCollectionEquality().equals(other.imgUrl, imgUrl)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(subtitle) ^
      const DeepCollectionEquality().hash(imgUrl) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(dateTime);

  @override
  _$ProjectCopyWith<_Project> get copyWith =>
      __$ProjectCopyWithImpl<_Project>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProjectToJson(this);
  }
}

abstract class _Project implements Project {
  factory _Project(
      {String type,
      String title,
      String subtitle,
      String imgUrl,
      String content,
      DateTime dateTime}) = _$_Project;

  factory _Project.fromJson(Map<String, dynamic> json) = _$_Project.fromJson;

  @override
  String get type;
  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get imgUrl;
  @override
  String get content;
  @override
  DateTime get dateTime;
  @override
  _$ProjectCopyWith<_Project> get copyWith;
}
