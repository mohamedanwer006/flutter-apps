import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسبيح'),
      ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        child:FlareActor(
          'assets/flare.flr',
          animation: 'animate',
          fit: BoxFit.fitHeight,
          isPaused: true,
        ),
      ),
    );
  }
}


