import 'dart:async';
import 'dart:convert';
import 'package:home_app/models/sensor.dart';
import 'package:home_app/services/api/api.dart';
import 'package:home_app/services/api/pref_services.dart';
import 'package:http/http.dart' as http;

class SensorServices extends PrefServices{
///index Sensors for current user
  Future<List<Sensor>> getSensors() async {
    print('inside collections');
    String token = await getToken();
    print(token);
    String url = Api.sensorsUrl;
    http.Response response =
        await http.get(url, headers: createAuthorizationHeader(token));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Sensor> sensors = List<Sensor>();
      data.forEach((element) {
        sensors.add(Sensor.fromMap(element));
      });
      print(sensors);
      return sensors;
    } else {
      print('error${response.statusCode}');
      return null;
    }
  }

  ///get Sensors by ids
   Future<List<Sensor>> getSensorsByIds(List<String> ids) async {
    print(ids);
    String token = await getToken();
    Map<String, List<String>> body = {"Sensors": ids};
    String url = Api.sensorsUrl;
    http.Response response = await http.post(url,
        headers: createAuthorizationHeader(token), body: json.encode(body));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Sensor> sensors = List<Sensor>();
      data.forEach((element) {
        sensors.add(Sensor.fromMap(element));
      });
      return sensors;
    } else {
      print('error${response.statusCode}');
      return null;
    }
  }

  // ///Update Specific Sensor
  // Future<bool> updateSensor(String SensorId,Sensor Sensor) async {
  //   String url = Api.sensorsUrl;
  //    String token = await getToken();
  //   http.Response response = await http.put(url + SensorId,
  //       headers: createAuthorizationHeader(token),
  //       body: sensorToJson(Sensor));
  //   if (response.statusCode == 200) {
  //     // print(response.body);
  //     return true;
  //   } else {
  //     print('error${response.statusCode}');
  //     return false;
  //   }
  // }

  ///delete Sensor 
  Future deleteSensor()async{  

}
}
