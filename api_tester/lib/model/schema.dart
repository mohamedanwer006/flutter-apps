import 'service_endpoint.dart';

class Schema {
  List<ServiceEndpoint>? serviceEndpoints;

  Schema({this.serviceEndpoints});

  @override
  String toString() => 'Schema(serviceEndpoints: $serviceEndpoints)';

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        serviceEndpoints: (json['service-endpoints'] as List<dynamic>?)
            ?.map((e) => ServiceEndpoint.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'service-endpoints': serviceEndpoints?.map((e) => e.toJson()).toList(),
      };
}
