import 'package:flutter/material.dart';
import 'package:home_app/theme/theme_changer.dart';
import 'package:home_app/utils/utilities.dart';
import 'package:provider/provider.dart';

class MusicCard extends StatefulWidget {
  @override
  _MusicCardState createState() => _MusicCardState();
}

class _MusicCardState extends State<MusicCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(builder: (context, theme, childe) {
      return Container(
        margin: EdgeInsets.only(left: screenWidth(context, 30.0)),
        height: screenHight(context, 72),
        width: screenWidth(context, 353),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenWidth(context, 15.0)),
          color:theme.darkTheme?Colors.grey[200]:Colors.grey[200],
          boxShadow:  [
            BoxShadow(
                color:theme.darkTheme? Colors.grey[900]:Colors.grey[400],
                blurRadius:theme.darkTheme? 1:15,
                spreadRadius:1,
                offset: theme.darkTheme?Offset(1,1):Offset(4, 4)),
            BoxShadow(
                color:theme.darkTheme? Colors.grey[800]:Colors.white,
                blurRadius: theme.darkTheme?1:15,
                spreadRadius:1,
                offset:theme.darkTheme? Offset(-1,-1):Offset(-4,-4)),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: screenWidth(context, 14.0)),
          child: Row(
            children: <Widget>[
              Container(
                height: screenHight(context, 40.0),
                width: screenWidth(context, 40.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth(context, 20)),
                  color:theme.darkTheme?Color(0xff242424): Color(0xff242424),
                ),
                child: ImageIcon(
                  AssetImage('assets/icons/music.png'),
                  color: Color(0XFFF6F6F6),
                ),
              ),
              SizedBox(
                width: screenWidth(context, 21.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'My Song',
                    style: TextStyle(
                        color: theme.darkTheme==true?Color(0xff242424):Color(0xff242424),
                        fontSize: screenWidth(context, 17.0),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Artist',
                    style: TextStyle(
                      color:theme.darkTheme==true?Color(0xff242424):Color(0xff242424),
                      fontSize: screenWidth(context, 12.0),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: screenWidth(context, 50.0),
              ),
              GestureDetector(
                child: ImageIcon(
                  AssetImage('assets/icons/Skip previous.png'),
                  color:theme.darkTheme==true?Color(0xff242424): Color(0xff242424),
                ),
                onTap: () {},
              ),
              SizedBox(
                width: screenWidth(context, 30.0),
              ),
              GestureDetector(
                child: ImageIcon(
                  AssetImage('assets/icons/Pause.png'),
                  color:theme.darkTheme==true?Color(0xff242424): Color(0xff242424),
                ),
                onTap: () {},
              ),
              SizedBox(
                width: screenWidth(context, 30.0),
              ),
              GestureDetector(
                child: ImageIcon(
                  AssetImage('assets/icons/Skip next.png'),
                  color:theme.darkTheme==true?Color(0xff242424): Color(0xff242424),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      );
    });
  }
}
