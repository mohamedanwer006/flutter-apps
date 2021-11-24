import 'method.dart';
import 'offset.dart';

class Meta {
  double? latitude;
  double? longitude;
  String? timezone;
  Method? method;
  String? latitudeAdjustmentMethod;
  String? midnightMode;
  String? school;
  Offset? offset;

  Meta({
    this.latitude,
    this.longitude,
    this.timezone,
    this.method,
    this.latitudeAdjustmentMethod,
    this.midnightMode,
    this.school,
    this.offset,
  });

  @override
  String toString() {
    return 'Meta(latitude: $latitude, longitude: $longitude, timezone: $timezone, method: $method, latitudeAdjustmentMethod: $latitudeAdjustmentMethod, midnightMode: $midnightMode, school: $school, offset: $offset)';
  }

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        latitude: json['latitude'] as double?,
        longitude: json['longitude'] as double?,
        timezone: json['timezone'] as String?,
        method: json['method'] == null
            ? null
            : Method.fromJson(json['method'] as Map<String, dynamic>),
        latitudeAdjustmentMethod: json['latitudeAdjustmentMethod'] as String?,
        midnightMode: json['midnightMode'] as String?,
        school: json['school'] as String?,
        offset: json['offset'] == null
            ? null
            : Offset.fromJson(json['offset'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        'timezone': timezone,
        'method': method?.toJson(),
        'latitudeAdjustmentMethod': latitudeAdjustmentMethod,
        'midnightMode': midnightMode,
        'school': school,
        'offset': offset?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Meta &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.timezone == timezone &&
        other.method == method &&
        other.latitudeAdjustmentMethod == latitudeAdjustmentMethod &&
        other.midnightMode == midnightMode &&
        other.school == school &&
        other.offset == offset;
  }

  @override
  int get hashCode =>
      latitude.hashCode ^
      longitude.hashCode ^
      timezone.hashCode ^
      method.hashCode ^
      latitudeAdjustmentMethod.hashCode ^
      midnightMode.hashCode ^
      school.hashCode ^
      offset.hashCode;
}
