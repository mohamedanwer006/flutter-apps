import 'package:flutter/material.dart';
import 'package:ograty/screens/first_screen.dart';
import 'package:ograty/screens/second_srceen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> myScreens =[
    FirstScreen(),SecondScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return PageView(
      children:myScreens,
      scrollDirection: Axis.horizontal,
      onPageChanged: (i){
        print(i);
      },
      physics: AlwaysScrollableScrollPhysics(),
    );
  }
}
