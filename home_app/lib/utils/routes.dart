import 'package:flutter/material.dart';
import 'package:home_app/main.dart';
import 'package:home_app/screens/about_page.dart';
import 'package:home_app/screens/add_device.dart';
import 'package:home_app/screens/add_room.dart';
import 'package:home_app/screens/details_page.dart';
import 'package:home_app/screens/devices_page.dart';
import 'package:home_app/screens/home_page.dart';
import 'package:home_app/screens/login_screen.dart';
import 'package:home_app/screens/rooms_page.dart';
import 'package:home_app/screens/my_devices_page.dart';
import 'package:home_app/screens/profile_edit_page.dart';
import 'package:home_app/screens/settings.dart';

final routes = {
  '/': (BuildContext context) => HomeApp(),
  LoginPage.route: (BuildContext context) => LoginPage(),
  HomePage.route: (BuildContext context) => HomePage(),
  DetailsPage.route: (BuildContext context) => DetailsPage(),
  SettingsPage.route: (BuildContext context) => SettingsPage(),
  AddRoomPage.route: (BuildContext context) => AddRoomPage(),
  AboutPage.route: (BuildContext context) => AboutPage(),
  DevicesPage.route: (BuildContext context) => DevicesPage(),
  RoomsPage.route: (BuildContext context) => RoomsPage(),
  ProfileEditPage.route: (BuildContext context) => ProfileEditPage(),
  MyDevicesPage.route: (BuildContext context) => MyDevicesPage(),
  AddDevicePage.route: (BuildContext context) => AddDevicePage(),
  
};
