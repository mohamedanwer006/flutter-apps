import 'package:flutter/material.dart';
ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(
    headline6: TextStyle(
      // fontFamily: 'Concert',
      color: Color(0xFFD9A20B),
      fontWeight: FontWeight.w400,
    ),
    headline2:TextStyle(
      // fontFamily: 'Concert',
      color: Color(0xFFD9A20B),
      fontWeight: FontWeight.w400,
    ),
    headline3: TextStyle(
      color: Color(0xFFD9A20B),
      fontWeight: FontWeight.w400,
      // fontSize: 43
    ),
    headline4: TextStyle(
      color: Color(0xFFD9A20B),
    ),
    headline5: TextStyle(
      color: Color(0xFFF6F6F6),
      // fontSize: 22,
      // fontWeight: FontWeight.bold,
    ),
    subtitle2: TextStyle(
      // fontFamily: 'Concert',
      color: Color(0xFFD9A20B),
      fontWeight: FontWeight.normal,
      fontSize: 20,
    ),
    headline1: TextStyle(
      // fontFamily: 'Concert',
      color: Color(0xFFD9A20B),
      letterSpacing: 1,
      fontWeight: FontWeight.bold,
      // fontSize: 22,
    ),
    subtitle1: TextStyle(
        // fontFamily: 'Concert',
        fontWeight: FontWeight.w200,
        fontSize: 20,
        color: Colors.white),
    bodyText2: TextStyle(
      // fontFamily: 'Concert',
      color:  Color(0xFFD9A20B),
      fontWeight: FontWeight.normal,
      letterSpacing: 1,
      fontSize: 14,
    ),
    bodyText1: TextStyle(
      // fontFamily: 'Concert',
      color:  Color(0xFFD9A20B),
      fontWeight: FontWeight.normal,
      letterSpacing: 1,
      fontSize: 20,
    ),
  ),
  backgroundColor: Color(0xFF242424),

  primaryColor: Color(0xFFD9A20B),
  iconTheme: IconThemeData(
    color:Color(0xFFD9A20B)
  ),
  cardColor: Color(0xff2a2a2a),
  accentColor:Color(0xff2a2a2a), 
  dialogTheme: DialogTheme(elevation: 0),
  dialogBackgroundColor: Color(0xff2a2a2a),
  canvasColor: Color(0xFF242424),
  hoverColor: Color(0xFFD9A20B).withOpacity(0.2),
  highlightColor: Color(0xFFD9A20B).withOpacity(0.5),
  
);

///*lightTheme */
ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.blueGrey,
      fontWeight: FontWeight.w400,
    ),
    headline5: TextStyle(
      color: Colors.blueGrey,
    ),
    headline4: TextStyle(
      color: Colors.blueGrey,
    ),
    headline3: TextStyle(
      color: Colors.blueGrey,
    ),
    headline1: TextStyle(
      color:  Colors.blueGrey,
      letterSpacing: 1,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
     subtitle2: TextStyle(
      color:  Colors.blueGrey,
      fontWeight: FontWeight.normal,
      fontSize: 20,
    ),
    subtitle1: TextStyle(
        // fontFamily: 'Concert',
        fontWeight: FontWeight.w200,
        fontSize: 20,
        color: Colors.blueGrey,
        ),
    bodyText2: TextStyle(
      color:Colors.blueGrey,
      fontWeight: FontWeight.normal,
      letterSpacing: 1,
      fontSize: 14,
    ),
    bodyText1: TextStyle(
      color: Colors.blueGrey,
      fontWeight: FontWeight.normal,
      letterSpacing: 1,
      fontSize: 18,
    ),
  ),
   iconTheme: IconThemeData(
    color: Colors.blueGrey
  ),
  primaryColor: Color(0xFFD9A20B),
  backgroundColor: Colors.grey[100],
  cardColor:Colors.grey[300],
  //  Color(0xffF6F6F6),
  canvasColor: Colors.white,
  accentColor:Color(0xFFD9A20B),
  toggleButtonsTheme: ToggleButtonsThemeData(
    color: Colors.grey[50],
    selectedColor:Color(0xFFD9A20B) ,
    highlightColor: Colors.white,
  ),
  hoverColor: Color(0xFFD9A20B).withOpacity(0.2),
  highlightColor: Color(0xFFD9A20B).withOpacity(0.5),
);
