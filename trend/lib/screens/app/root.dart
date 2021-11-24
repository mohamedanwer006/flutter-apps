import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:trend/screens/chat/chat.dart';
import 'package:trend/screens/home/home.dart';
import 'package:trend/screens/info/info.dart';
import 'package:trend/screens/packages/packages.dart';
import 'package:trend/screens/profile/profile.dart';
import 'package:trend/services/auth/auth_provider.dart';
import 'package:trend/services/database/db_services.dart';
import 'package:trend/utils/locator.dart';
import 'package:trend/theme/app_colors.dart';
import 'package:trend/theme/theme_data.dart';
import 'package:trend/widgets/custome_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  // Create the initilization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        // if (snapshot.hasError) {
        //   return SomethingWentWrong();
        // }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Trend',
          theme: themeData,
          home: Scaffold(
            body: Center(
              child: Text(
                  'Something went wrong, check your connection or try later'),
            ),
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthServices>(
              create: (context) => getIt<AuthServices>()),
          ChangeNotifierProvider<DbServices>(
              create: (context) => getIt<DbServices>()),
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Trend',
            theme: themeData,
            home: TrendApp(),
          );
        });
  }
}

class TrendApp extends StatefulWidget {
  final int tabIndex;
  const TrendApp({Key key, this.tabIndex}) : super(key: key);

  @override
  _TrendAppState createState() => _TrendAppState();
}

class _TrendAppState extends State<TrendApp> {
  List<Widget> screens = [
    Home(),
    PackagesPage(),
    ProfilePage(),
    ChatPage(),
    InfoPage(),
  ];
  int screenNum = 0;
  @override
  void initState() {
    Provider.of<DbServices>(context, listen: false).getTrendData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: screens,
        index: screenNum,
        sizing: StackFit.expand,
      ),
      extendBody: true,
      bottomNavigationBar: TrendNavBar(
          activeColor: AppColors.iconActiveColor,
          color: AppColors.iconDeActiveColor,
          iconSize: 22,
          duration: Duration(milliseconds: 800),
          textStyle: TextStyle(color: Colors.red),
          tabs: [
            NavBarItem(
              icon: Feather.home,
              text: 'Home',
              textColor: Colors.red,
            ),
            NavBarItem(
              icon: Feather.package,
              text: 'prices',
            ),
            NavBarItem(
              center: true,
              profileImag:
                  'https://jamalouki.net/uploads/richTextEditor/default_richTextEditor/bf9/054b5571a5a58bc630d10a58dead6090.jpeg',
              text: 'profile',
            ),
            NavBarItem(
              icon: Feather.message_circle,
              text: 'chat',
            ),
            NavBarItem(
              icon: Feather.info,
              text: 'info',
            ),
          ],
          selectedIndex: screenNum,
          onTabChange: (index) {
            setState(() {
              screenNum = index;
            });
          }),
    );
  }
}
