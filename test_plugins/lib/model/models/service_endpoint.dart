import 'package:flutter/foundation.dart';

import 'request_body.dart';

@immutable
class ServiceEndpoint {
  final String? serviceUrl;
  final String? requestType;
  final List<RequestBody>? requestBody;
  final String? timeout;
  final String? checkType;
  final String? sucessfullResponse;

  const ServiceEndpoint({
    this.serviceUrl,
    this.requestType,
    this.requestBody,
    this.timeout,
    this.checkType,
    this.sucessfullResponse,
  });

  @override
  String toString() {
    return 'ServiceEndpoint(serviceUrl: $serviceUrl, requestType: $requestType, requestBody: $requestBody, timeout: $timeout, checkType: $checkType, sucessfullResponse: $sucessfullResponse)';
  }

  factory ServiceEndpoint.fromJson(Map<String, dynamic> json) =>
      ServiceEndpoint(
        serviceUrl: json['service-url'] as String?,
        requestType: json['request-type'] as String?,
        requestBody: (json['request-body'] as List<dynamic>?)
            ?.map((e) => RequestBody.fromJson(e as Map<String, dynamic>))
            .toList(),
        timeout: json['timeout'] as String?,
        checkType: json['check-type'] as String?,
        sucessfullResponse: json['sucessfull-response'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'service-url': serviceUrl,
        'request-type': requestType,
        'request-body': requestBody?.map((e) => e.toJson()).toList(),
        'timeout': timeout,
        'check-type': checkType,
        'sucessfull-response': sucessfullResponse,
      };
}
