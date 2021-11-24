import 'package:flutter/material.dart';
import 'package:home_app/models/weather.dart';
import 'package:home_app/theme/theme_changer.dart';
import 'package:home_app/utils/utilities.dart';
import 'package:home_app/components/details_card.dart';
import 'package:provider/provider.dart';

class WeatherCard extends StatefulWidget {
  final Weather weather;
  const WeatherCard({Key key, this.weather}) : super(key: key);
  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    var weather= widget.weather ;
    return Consumer<ThemeChanger>(
      builder: (context, theme, child) => DetailsCard(
        showIcon: false,
        icon: Text('mansoura'),
        title: 'Weather',
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               theme.darkTheme? Text(
                  'Temp',
                  style: TextStyle(
                    color:theme.darkTheme? Color(0XFFF6F6F6):Color(0XFF242424),
                    fontSize: 16,
                  ),
                ):Image.asset('assets/images/weather1.png',height: 35,),
                Text(
                  '${weather!=null?weather.temp.value:' '}${weather!=null?'°':' '}${weather!=null?weather.temp.units:' '}',
                  style: TextStyle(
                    color: theme.darkTheme? Color(0XFFF6F6F6):Color(0XFF242424),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height:3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               theme.darkTheme? Text(
                  'Humidity',
                  style: TextStyle(
                    color: theme.darkTheme? Color(0XFFF6F6F6):Color(0XFF242424),
                    fontSize:16,
                  ),
                ):Image.asset('assets/images/humidity.png',height: 35,),
                Text(
                 '${weather!=null?weather.humidity.value:' '}${weather!=null?weather.humidity.units:' '}',
                  style: TextStyle(
                    color: theme.darkTheme? Color(0XFFF6F6F6):Color(0XFF242424),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
