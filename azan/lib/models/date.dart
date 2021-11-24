import 'gregorian.dart';
import 'hijri.dart';

class Date {
  String? readable;
  String? timestamp;
  Gregorian? gregorian;
  Hijri? hijri;

  Date({this.readable, this.timestamp, this.gregorian, this.hijri});

  @override
  String toString() {
    return 'Date(readable: $readable, timestamp: $timestamp, gregorian: $gregorian, hijri: $hijri)';
  }

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        readable: json['readable'] as String?,
        timestamp: json['timestamp'] as String?,
        gregorian: json['gregorian'] == null
            ? null
            : Gregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
        hijri: json['hijri'] == null
            ? null
            : Hijri.fromJson(json['hijri'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'readable': readable,
        'timestamp': timestamp,
        'gregorian': gregorian?.toJson(),
        'hijri': hijri?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Date &&
        other.readable == readable &&
        other.timestamp == timestamp &&
        other.gregorian == gregorian &&
        other.hijri == hijri;
  }

  @override
  int get hashCode =>
      readable.hashCode ^
      timestamp.hashCode ^
      gregorian.hashCode ^
      hijri.hashCode;
}
