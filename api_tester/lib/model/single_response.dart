import 'dart:convert';

import 'package:flutter/foundation.dart';

class SingleResponse {
  String? body;
  int? statusCode;
  Map<String, String>? headers;
  SingleResponse({
    this.body,
    this.statusCode,
    this.headers,
  });

  SingleResponse copyWith({
    String? body,
    int? statusCode,
    Map<String, String>? headers,
  }) {
    return SingleResponse(
      body: body ?? this.body,
      statusCode: statusCode ?? this.statusCode,
      headers: headers ?? this.headers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'body': body,
      'statusCode': statusCode,
      'headers': headers,
    };
  }

  factory SingleResponse.fromMap(Map<String, dynamic> map) {
    return SingleResponse(
      body: map['body'],
      statusCode: map['statusCode'],
      headers: Map<String, String>.from(map['headers']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SingleResponse.fromJson(String source) =>
      SingleResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'SingleResponse(body: $body, statusCode: $statusCode, headers: $headers)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SingleResponse &&
        other.body == body &&
        other.statusCode == statusCode &&
        mapEquals(other.headers, headers);
  }

  @override
  int get hashCode => body.hashCode ^ statusCode.hashCode ^ headers.hashCode;
}
