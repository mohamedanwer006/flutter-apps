import 'package:flutter/material.dart';
import 'package:new_web_po/screens/home.dart';
import 'package:new_web_po/utils/theme_changer.dart';
import 'package:new_web_po/utils/themes.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_)=>ThemeChanger(myDark),
      child: MaterialTheme(),
    );
  }
}

class MaterialTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mohamed anwar',
      theme: theme.getTheme(),
      home: MyHomePage(),
    );
  }
}


