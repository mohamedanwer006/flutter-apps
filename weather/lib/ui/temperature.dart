import 'package:flutter/material.dart';
import 'package:weather/uitilies/model.dart';

class Temperature extends StatefulWidget {
  final Weather weather;
  Temperature(this.weather);
  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  TextStyle _tempStyle = TextStyle(
    fontSize: 82,
    fontWeight: FontWeight.w100,
    color: Colors.white,
  );
  TextStyle _statesStyle = TextStyle(
    fontSize: 18,
    color: Colors.white,
  );
  var _rainStyle = TextStyle(
    color: Colors.white,
    fontSize: 15,
  );
  var _parameterStyle = TextStyle(
    color: Colors.white,
    fontSize: 25,
  );
  var _oStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //State
          Container(
            width: MediaQuery.of(context).size.width/2,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                ),
                Text(
                  '${widget.weather.currently.summary}',
                  style: _statesStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text(
                      '${widget.weather.currently.precipProbability}%',
                      style: _rainStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
          // temp
          Container(
            width: MediaQuery.of(context).size.width/2,
            height: 100,
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${widget.weather.currently.apparentTemperature.floor()}',
                  style: _tempStyle,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'O',
                    style: _oStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'C',
                    style: _parameterStyle,
                  ),
                ),
              ],
            ) ,
          ),
        ],
      ),
    );
  }
}
