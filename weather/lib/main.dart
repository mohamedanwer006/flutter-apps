import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather/ui/home.dart';
import 'package:weather/uitilies/api_data.dart';
import 'package:weather/uitilies/model.dart';


void main ()async{
//  var url='https://api.darksky.net/forecast/17bca054c851089ce13d565d1bb537e7/31.205753,%2029.924526?units=ca';
//  var data = await api.getData(url);
  var weatherApi=WeatherApi(
    key:'17bca054c851089ce13d565d1bb537e7',
    lang: 'en',
    unit: 'ca'
  );
  Weather data =await weatherApi.getData('31.205753', '%2029.924526');
  print(data.currently.apparentTemperature);
  runApp(
   MyApp(data)
  );
}

class MyApp extends StatelessWidget {
   final Weather  data;
  MyApp(this.data);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen() ,
      routes:<String,WidgetBuilder>{
        '/Home':(BuildContext context)=>HomePage(data),
      } ,
    );
  }
}

class SplashScreen extends StatefulWidget {
//  final Weather data;
//  SplashScreen(this.data);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
   timer(){
    var duration=new Duration(seconds: 3);
    return Timer(duration,navigate);
  }
  void navigate(){
     Navigator.of(context).pushReplacementNamed('/Home');
  }
  @override
  Widget build(BuildContext context) {
      return Container(
        child: Image.asset('images/cover.jpg', fit: BoxFit.cover,),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }

}

