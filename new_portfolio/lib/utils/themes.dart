import 'package:flutter/material.dart';

ThemeData myDark = ThemeData(
  hoverColor: Color(0xff0bceaf).withOpacity(0.2),
  highlightColor: Color(0xff0bceaf).withOpacity(0.5),
  tabBarTheme: TabBarTheme(
    labelPadding: EdgeInsets.only(left: 15,right: 15),
      labelColor: Color(0xff0bceaf),
      unselectedLabelColor: Colors.white,
      unselectedLabelStyle: TextStyle(
        fontSize: 18,
        letterSpacing: 1,
      ), 
      labelStyle: TextStyle(
        fontSize: 18,
        letterSpacing: 1,
      ),
      
      indicator: UnderlineTabIndicator(
          insets: EdgeInsets.only(bottom: 5),
          borderSide: BorderSide(width: 1, color: Color(0xff0bceaf),),),),
  textTheme: TextTheme(
      subhead: TextStyle(color: Colors.white),
      headline: TextStyle(
        color: Colors.white,
        letterSpacing: 1,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),
      body1:TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w200,
        letterSpacing: 1,
        fontSize: 18,
      ),
      body2:TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        letterSpacing: 1,
        fontSize: 12,
      ),
      title: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 30,
      ),
      subtitle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 20,
      )),
  backgroundColor: Color(0xff100e17),
  primaryColor: Colors.black,
  primaryColorLight: Color(0xff100e17),
  buttonColor: Color(0xff0bceaf),
  cardColor: Color(0xff1e1e24),
  appBarTheme: AppBarTheme(
      color: Color(0xff1e1e24),
      textTheme: TextTheme(
          title: TextStyle(
        color: Colors.pinkAccent,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        letterSpacing: 2,
      ))),
  canvasColor: Color(0xff100e17),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xffd31c5b),
    highlightColor: Colors.redAccent,
  ),
);

///** */
ThemeData mylight = ThemeData(
  hoverColor: Color(0xffE91E63).withOpacity(0.2),
  highlightColor:  Color(0xffE91E63).withOpacity(0.5),
  tabBarTheme: TabBarTheme(
     labelPadding: EdgeInsets.only(left: 15,right: 15),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey.withOpacity(0.5),
      unselectedLabelStyle: TextStyle(
        fontSize: 18,
        letterSpacing: 1,
      ),
      labelStyle: TextStyle(
        fontSize: 18,
        letterSpacing: 1,
      ),
      indicator: UnderlineTabIndicator(
          insets: EdgeInsets.only(bottom: 5),
          borderSide: BorderSide(width: 2, color: Colors.black))),
  textTheme: TextTheme(
      subhead: TextStyle(color: Colors.black),
      headline: TextStyle(
        color: Colors.black,
        letterSpacing: 1,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),
      body1:TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w200,
        fontSize: 18,
      ),
      body2:TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        letterSpacing: 1,
        fontSize: 12,
      ),
      title: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 30,
      ),
      subtitle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 20,
      )),
  backgroundColor: Colors.white,
  primaryColor: Color(0xffefefef),
  primaryColorLight: Color(0xffd8d8d8),
  accentColor: Color(0xffE91E63),
  buttonColor: Color(0xffE91E63),
  cardColor: Colors.white,
  appBarTheme: AppBarTheme(
      textTheme: TextTheme(
          title: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 2,
  ))),
  canvasColor: Colors.white,
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xffE91E63),
    highlightColor: Colors.redAccent,
  ),
);
