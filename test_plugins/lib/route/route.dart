// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_plugins/block/counter_block.dart';
import 'package:test_plugins/main.dart';
import 'package:test_plugins/screen/second_screen.dart';

class MyRouteImplementation {
  CounterBlock counterBlock = CounterBlock();
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());

      case '/second':
        return MaterialPageRoute(builder: (_) => SecondScreen());

      default:
        throw ('the route ${routeSettings.name}}is wrong check the correct rout name');
    }
  }
}
