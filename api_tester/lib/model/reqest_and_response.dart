import 'package:api_tester/model/service_endpoint.dart';
import 'package:api_tester/model/single_response.dart';

class ReqAndRes {
  final SingleResponse singleResponse;
  final ServiceEndpoint serviceEndpoint;
  ReqAndRes({
    required this.singleResponse,
    required this.serviceEndpoint,
  });
}
