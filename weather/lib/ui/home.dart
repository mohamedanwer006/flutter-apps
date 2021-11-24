import 'package:flutter/material.dart';
import 'package:weather/ui/dailylist.dart';
import 'package:weather/ui/hourslist.dart';
import 'package:weather/ui/location.dart';
import 'package:weather/ui/temperature.dart';
import 'package:weather/uitilies/api_data.dart';
//import 'package:weather/uitilies/api_data.dart';
import 'package:weather/uitilies/model.dart';

class HomePage extends StatefulWidget {
  final Weather weather;
  HomePage(this.weather);
  @override
  _HomePageState createState() => _HomePageState(weather);
}

class _HomePageState extends State<HomePage> {
 Weather weather;
//
 _HomePageState(this.weather);

//  api()async{
//    var weatherApi=WeatherApi(
//        key:'17bca054c851089ce13d565d1bb537e7',
//        lang: 'en',
//        unit: 'ca'
//    );
//    Weather data = await weatherApi.getData('31.205753', '%2029.924526');
//    print(data.currently.apparentTemperature);
//    return data;
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //background Img
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'images/Blood.png',
              fit: BoxFit.cover,
            ),
          ),
          //location container
          Positioned(
            child: Location(weather),
            top: 55,
          ),
          //Temperature container
          Positioned(
            child:Temperature(weather),
            top: 150,
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.white70),
                      bottom: BorderSide(color: Colors.white70))),
              width: MediaQuery.of(context).size.width,
              height: 100,
              child:Hours(weather),
            ),
            top: 260,
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.white70))),
              width: MediaQuery.of(context).size.width,
              height: 285,
              child: DaysList(weather),
            ),
            top: 360,
          ),
          Positioned(
            child: Container(),
            top: 25,
            left: 10,
          ),
        ],
      ),
    );
  }
}
