import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/uitilies/model.dart';
class Hours extends StatefulWidget {
  final Weather weather;
  Hours(this.weather);
  @override
  _HoursState createState() => _HoursState();
}

class _HoursState extends State<Hours> {
  TextStyle style = TextStyle(
    fontSize: 18,
    color: Colors.white,
  );

  String time(int time){
    //url for DataTime : https://stackoverflow.com/questions/50632217/dart-flutter-converting-timestamp?rq=1
    var dataTime = new DateTime.fromMillisecondsSinceEpoch(time*1000);
    var format = new DateFormat('ha');
    var date=format.format(dataTime);
//    print(date);
    return date;
  }

  @override
  Widget build(BuildContext context) {
    var data = widget.weather.hourly.data;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount:data.length ,
        itemBuilder: (BuildContext context,int index){
          return Container(
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '${time(data[index].time).toString()}',
                  style: style,
                ),
                Icon(
                  Icons.wb_sunny,
                  color: Colors.white,
                ),
                Text(
                  '${data[index].apparentTemperature.floor().toString()}°',
                  style: style,
                )
              ],
            ),
          );
        },
    );
  }
}
