import 'package:freezed_annotation/freezed_annotation.dart';

part 'trend_data.freezed.dart';
part 'trend_data.g.dart';

///Trend Data Model
@freezed
abstract class TrendData with _$TrendData {
  factory TrendData({
    List<TrendProject> projects,
    List<CarouselData> carouselImages,
    String title,
  }) = _TrendData;

  factory TrendData.fromJson(Map<String, dynamic> json) =>
      _$TrendDataFromJson(json);
}

///Projects model
@freezed
abstract class TrendProject with _$TrendProject {
  factory TrendProject({
    List<Project> projects,
    String title,
  }) = _TrendProject;

  factory TrendProject.fromJson(Map<String, dynamic> json) =>
      _$TrendProjectFromJson(json);
}

///CarouselData model
@freezed
abstract class CarouselData with _$CarouselData {
  factory CarouselData({
    String title,
    String subtitle,
    String imgUrl,
    String content,
    DateTime dateTime,
  }) = _CarouselData;

  factory CarouselData.fromJson(Map<String, dynamic> json) =>
      _$CarouselDataFromJson(json);
}

///Project details model
@freezed
abstract class Project with _$Project {
  factory Project({
    String type,
    String title,
    String subtitle,
    String imgUrl,
    String content,
    DateTime dateTime,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
