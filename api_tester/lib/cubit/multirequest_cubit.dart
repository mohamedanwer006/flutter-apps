import 'package:api_tester/model/reqest_and_response.dart';
import 'package:api_tester/model/schema.dart';
import 'package:api_tester/repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'multirequest_state.dart';

class MultirequestCubit extends Cubit<MultirequestState> {
  MultirequestCubit() : super(MultirequestState());
  final ApiRepo _apiRepo = ApiRepo();

  responseData(Schema schema) async {
    List<ReqAndRes>? response = [];
    for (var service in schema.serviceEndpoints!) {
      try {
        var res = await _apiRepo.multReq(
            service.requestType!, Uri.parse(service.serviceUrl!));
        response.add(res);
        emit(MultirequestState(response: response));
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }
  }
}
