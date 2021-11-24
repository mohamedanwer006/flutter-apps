import 'package:flutter/foundation.dart';

import 'data.dart';

class Aladhan {
  int? code;
  String? status;
  List<Data>? data;

  Aladhan({this.code, this.status, this.data});

  @override
  String toString() => 'Aladhan(code: $code, status: $status, data: $data)';

  factory Aladhan.fromJson(Map<String, dynamic> json) => Aladhan(
        code: json['code'] as int?,
        status: json['status'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Aladhan &&
        listEquals(other.data, data) &&
        other.code == code &&
        other.status == status;
  }

  @override
  int get hashCode => code.hashCode ^ status.hashCode ^ data.hashCode;
}
