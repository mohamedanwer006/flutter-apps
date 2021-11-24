import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/uitilies/model.dart';

 class WeatherApi{
   String key;
   String lang;
   String unit;

   String _baseUrl='https://api.darksky.net/forecast/';
   WeatherApi({this.key,this.lang='en',this.unit='ca'});

   String _getUrl(String lat,String long){
     String url='$_baseUrl'+'$key/'+'$lat,'+'$long'+'?units=$unit'+'&lang=$lang';
     return url;
   }

   Future<Weather> getData(String lat,String long )async{
    String url= _getUrl(lat, long);
     var response = await http.get(url);
     if (response.statusCode == 200) {
       var jsonResponse = jsonDecode(response.body);
       var weather = Weather.fromJson(jsonResponse);
       return weather;
     } else {
       print("Request failed with status: ${response.statusCode}.");
       return null;
     }
   }
 }

//Future getData(String url)async{
//  var response = await http.get(url);
//  if (response.statusCode == 200) {
//    var jsonResponse = jsonDecode(response.body);
//    return jsonResponse;
//  } else {
//    print("Request failed with status: ${response.statusCode}.");
//    return response.statusCode;
//  }
//}