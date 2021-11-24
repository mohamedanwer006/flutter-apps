import 'package:flutter/material.dart';
import 'package:home_app/theme/theme_changer.dart';
import 'package:home_app/utils/utilities.dart';
import 'package:home_app/components/details_card.dart';
import 'package:provider/provider.dart';

class PowerCard extends StatefulWidget {
  final String lightsState;
  final String devicesState;

  const PowerCard({Key key, this.lightsState, this.devicesState})
      : super(key: key);
  @override
  _PowerCardState createState() => _PowerCardState();
}

class _PowerCardState extends State<PowerCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(
      builder: (context, theme, child) => DetailsCard(
        title: 'Power',
        icon: Icon(Icons.power_settings_new,),
        onTapIcon: () {
          print("icon buttom is taped");
          //Todo:implement power iconButton
        },
        showIcon: true,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                theme.darkTheme
                    ? Text(
                        'Lights',
                        style: TextStyle(
                          color: theme.darkTheme ? Colors.white : null,
                          fontSize: 16
                          ,
                        ),
                      )
                    : Image.asset(
                        'assets/images/idea.png',
                        height: 35,
                      ),
                Text(
                  widget.lightsState,
                  style: TextStyle(
                    color: Color(0xffD9A20B),
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            theme.darkTheme
                ? SizedBox(
                    height: 4,
                  )
                : SizedBox(
                    height: 10,
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Devices',
                  style: TextStyle(
                    color: theme.darkTheme ? Colors.white : null,
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.devicesState,
                  style: TextStyle(
                    color: Color(0xff6D6D6D),
                    fontSize: 18,
                    fontWeight: FontWeight.bold
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
