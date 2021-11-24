import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/uitilies/model.dart';

class DaysList extends StatefulWidget {
  final Weather weather;
  DaysList(this.weather);
  @override
  _DaysListState createState() => _DaysListState();
}

class _DaysListState extends State<DaysList> {
  var style = TextStyle(
    fontSize: 18,
    color: Colors.white,
  );
  String date(int time){
    var dataTime = new DateTime.fromMillisecondsSinceEpoch(time*1000);
    var format = new DateFormat.EEEE();
    var date=format.format(dataTime);
//    print(date);
    return date;
  }
  @override
  Widget build(BuildContext context) {
    List<Datum> daysData=widget.weather.daily.data;
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 15),
                width: 110,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${date(daysData[index].time)}',
                    style: style,
                  ),
                ),
              ),
              Container(
                width: 110,
                child: Align(
                  child: Icon(
                    Icons.wb_sunny,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: 110,
                child: Align(
                  child: Text(
                    '${daysData[index].temperatureHigh.floor()}°',
                    style: style,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
