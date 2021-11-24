import 'package:flutter/material.dart';


class ThemeChange with ChangeNotifier {
  ThemeData _themeData; 
  ThemeChange(this._themeData);


  getTheme(){
  return _themeData;
  }

  setTheme(ThemeData theme)async {
    _themeData = theme;
    notifyListeners();
  }
}


ThemeData myDark = ThemeData(
  textTheme: TextTheme(
      subhead: TextStyle(color: Colors.white),
      headline: TextStyle(color: Colors.white),
      body1: TextStyle(color: Colors.white),
      title: TextStyle(color: Colors.white),
      subtitle: TextStyle(color: Colors.white)),
  backgroundColor: Colors.black,
  brightness: Brightness.dark,
  accentColor: Colors.black,
  buttonColor: Colors.indigo,
  cardColor: Colors.white24,
  appBarTheme: AppBarTheme(color: Colors.black),
  canvasColor: Colors.black,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blueGrey,
    highlightColor: Colors.redAccent,
  ),
);
