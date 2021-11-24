import 'dart:convert';
import 'package:api_tester/model/reqest_and_response.dart';
import 'package:api_tester/model/schema.dart';
import 'package:api_tester/model/service_endpoint.dart';
import 'package:api_tester/model/single_response.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FilePikerRepo {
//function to pick file and return string json

  Future<String?> pickFile() async {
    String? file;
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles();
    var platformFile = filePickerResult!.files.first;
    var codeUnits = platformFile.bytes;
    file = utf8.decode(codeUnits!.toList());

    return file;
  }
}

class ApiRepo {
  Schema createModel(String json) {
    return Schema.fromJson(jsonDecode(json));
  }

  Future<SingleResponse> req(String method, Uri url,
      {Map<String, String>? headers, dynamic body}) async {
    http.Response res = await _sendUnstreamed(method, url, headers, body);
    SingleResponse singleResponse = SingleResponse(
        body: res.body, headers: res.headers, statusCode: res.statusCode);
    if (kDebugMode) {
      print(singleResponse.headers);
    }
    return singleResponse;
  }

  Future<ReqAndRes> multReq(String method, Uri url,
      {Map<String, String>? headers, dynamic body}) async {
    http.Response res = await _sendUnstreamed(method, url, headers, body);
    SingleResponse singleResponse = SingleResponse(
        body: res.body, headers: res.headers, statusCode: res.statusCode);
    ReqAndRes reqAndRes = ReqAndRes(
        singleResponse: singleResponse,
        serviceEndpoint: ServiceEndpoint(
            serviceUrl: url.toString(),
            requestBody: body,
            requestType: method));
    return reqAndRes;
  }

  Future<http.Response> _sendUnstreamed(
      String method, Uri url, Map<String, String>? headers,
      [body, Encoding? encoding]) async {
    var request = http.Request(method, url);

    if (headers != null) request.headers.addAll(headers);
    if (encoding != null) request.encoding = encoding;
    if (body != null) {
      if (body is String) {
        request.body = body;
      } else if (body is List) {
        request.bodyBytes = body.cast<int>();
      } else if (body is Map) {
        request.bodyFields = body.cast<String, String>();
      } else {
        throw ArgumentError('Invalid request body "$body".');
      }
    }

    return http.Response.fromStream(await request.send());
  }
}
