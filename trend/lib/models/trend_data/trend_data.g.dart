// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trend_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrendData _$_$_TrendDataFromJson(Map<String, dynamic> json) {
  return _$_TrendData(
    projects: (json['projects'] as List)
        ?.map((e) =>
            e == null ? null : TrendProject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    carouselImages: (json['carouselImages'] as List)
        ?.map((e) =>
            e == null ? null : CarouselData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$_$_TrendDataToJson(_$_TrendData instance) =>
    <String, dynamic>{
      'projects': instance.projects,
      'carouselImages': instance.carouselImages,
      'title': instance.title,
    };

_$_TrendProject _$_$_TrendProjectFromJson(Map<String, dynamic> json) {
  return _$_TrendProject(
    projects: (json['projects'] as List)
        ?.map((e) =>
            e == null ? null : Project.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$_$_TrendProjectToJson(_$_TrendProject instance) =>
    <String, dynamic>{
      'projects': instance.projects,
      'title': instance.title,
    };

_$_CarouselData _$_$_CarouselDataFromJson(Map<String, dynamic> json) {
  return _$_CarouselData(
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    imgUrl: json['imgUrl'] as String,
    content: json['content'] as String,
    dateTime: json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
  );
}

Map<String, dynamic> _$_$_CarouselDataToJson(_$_CarouselData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'imgUrl': instance.imgUrl,
      'content': instance.content,
      'dateTime': instance.dateTime?.toIso8601String(),
    };

_$_Project _$_$_ProjectFromJson(Map<String, dynamic> json) {
  return _$_Project(
    type: json['type'] as String,
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    imgUrl: json['imgUrl'] as String,
    content: json['content'] as String,
    dateTime: json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
  );
}

Map<String, dynamic> _$_$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'imgUrl': instance.imgUrl,
      'content': instance.content,
      'dateTime': instance.dateTime?.toIso8601String(),
    };
