import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/uitilies/model.dart';

class Location extends StatefulWidget {
  final Weather weather;
  Location(this.weather);
  @override
  _LocationState createState() => _LocationState();
}
class _LocationState extends State<Location> {

  TextStyle _headStyle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 2,
  );
  TextStyle _timeStyle = TextStyle(
    color: Colors.white,
    fontSize: 17,
  );
  @override
  Widget build(BuildContext context) {
    //url fo DataTime : https://stackoverflow.com/questions/50632217/dart-flutter-converting-timestamp?rq=1
    var dataTime = new DateTime.fromMillisecondsSinceEpoch(widget.weather.currently.time*1000);
//    print(widget.weather.currently.time);
//    print(dataTime.toString());
//    print('${dataTime.year}-${dataTime.month}-${dataTime.day}  ${dataTime.hour}:${dataTime.minute}');
    var format = new DateFormat.MMMEd();
    var date=format.format(dataTime);
//    print(date);
    return Container(
      width: MediaQuery.of(context).size.width ,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.white,
                size: 30,
              ),
              Text(
                '${widget.weather.timezone}',
                style: _headStyle,
              ),
            ],
          ),
          Text(
            '$date',
            style: _timeStyle,
          ),
        ],
      ),
    );
  }
}
