import 'package:e_commerce/screens/home.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-commerce',
      debugShowCheckedModeBanner: false,
      home:Home()
    );
  }
}

