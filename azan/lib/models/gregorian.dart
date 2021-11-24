import 'designation.dart';
import 'month.dart';
import 'weekday.dart';

class Gregorian {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;

  Gregorian({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
  });

  @override
  String toString() {
    return 'Gregorian(date: $date, format: $format, day: $day, weekday: $weekday, month: $month, year: $year, designation: $designation)';
  }

  factory Gregorian.fromJson(Map<String, dynamic> json) => Gregorian(
        date: json['date'] as String?,
        format: json['format'] as String?,
        day: json['day'] as String?,
        weekday: json['weekday'] == null
            ? null
            : Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
        month: json['month'] == null
            ? null
            : Month.fromJson(json['month'] as Map<String, dynamic>),
        year: json['year'] as String?,
        designation: json['designation'] == null
            ? null
            : Designation.fromJson(json['designation'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'format': format,
        'day': day,
        'weekday': weekday?.toJson(),
        'month': month?.toJson(),
        'year': year,
        'designation': designation?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Gregorian &&
        other.date == date &&
        other.format == format &&
        other.day == day &&
        other.weekday == weekday &&
        other.month == month &&
        other.year == year &&
        other.designation == designation;
  }

  @override
  int get hashCode =>
      date.hashCode ^
      format.hashCode ^
      day.hashCode ^
      weekday.hashCode ^
      month.hashCode ^
      year.hashCode ^
      designation.hashCode;
}
