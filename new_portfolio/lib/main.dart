import 'package:flutter/material.dart';
import 'package:new_portfolio/screens/my_home.dart';
import 'package:new_portfolio/utils/theme_changer.dart';
import 'package:new_portfolio/utils/themes.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>ThemeChanger(myDark),
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
      title: 'Mohamed anwer',
      theme: theme.getTheme(),
      home: MyHomePage(),
    );
  }
}
