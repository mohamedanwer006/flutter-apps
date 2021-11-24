///-----------------------  comicsApp  -----------------------
/// **** Auth : ----- mohamed anwer mohamed ----------
/// **** Date : ----- 7/2019 ----------
/// ----------------------------------------------------------
///* firebase : project-824938341892

import 'package:comics_app/screens/home_screen.dart';
import 'package:comics_app/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

  runApp(MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
 final PushNotificationService _pushNotificationService = PushNotificationService();
Future not()async{
  await _pushNotificationService.initialise();
}

  @override
  Widget build(BuildContext context) {
  not();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home:Home(),
    );
  }
}

