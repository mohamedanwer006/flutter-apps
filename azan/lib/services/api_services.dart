import 'dart:convert';

import 'package:azan/models/aladhan.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Services {
  var apiUrl =
      'https://api.aladhan.com/v1/calendarByAddress?address=cairo&method=5';

  Future<Aladhan?> getData() async {
    Aladhan aladhan;
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      print(response.body);
      aladhan = Aladhan.fromJson(json.decode(response.body));
    } else {
      return null;
    }
    return aladhan;
  }
}
