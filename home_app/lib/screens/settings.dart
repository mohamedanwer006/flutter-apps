import 'package:flutter/material.dart';
import 'package:home_app/components/setting_card.dart';
import 'package:home_app/screens/about_page.dart';
import 'package:home_app/screens/add_device.dart';
import 'package:home_app/screens/devices_page.dart';
import 'package:home_app/screens/login_screen.dart';
import 'package:home_app/screens/rooms_page.dart';
import 'package:home_app/screens/profile_edit_page.dart';
import 'package:home_app/services/provider/user_provider.dart';
import 'package:home_app/theme/theme_changer.dart';
import 'package:home_app/utils/utilities.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static const String route = '/settings';
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _switch = false;
  SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context,listen: true).user;
    ThemeChanger _themeChange = Provider.of<ThemeChanger>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.mode_edit),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              Navigator.pushNamed(context,ProfileEditPage.route);
            },
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          '',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Consumer<ThemeChanger>(
        builder: (context, theme, child) => SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      // margin:
                      //     EdgeInsets.only(right: screenWidth(context, 12.7)),
                      // width: screenWidth(context, 156.26),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(25),
                        color: Theme.of(context).cardColor,

                        // boxShadow: [
                        //   BoxShadow(
                        //       color: theme.darkTheme
                        //           ? Colors.grey[900]
                        //           : Colors.grey[300],
                        //       blurRadius: theme.darkTheme ? 1 : 5,
                        //       spreadRadius: 1,
                        //       offset: theme.darkTheme
                        //           ? Offset(1, 1)
                        //           : Offset(4, 4)),
                        //   BoxShadow(
                        //       color: theme.darkTheme
                        //           ? Colors.grey[800]
                        //           : Colors.white,
                        //       blurRadius: theme.darkTheme ? 1 : 5,
                        //       spreadRadius: 1,
                        //       offset: theme.darkTheme
                        //           ? Offset(-1, -1)
                        //           : Offset(-4, -4)),
                        // ],
                      ),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 18.0, left: 14),
                                    child: Hero(
                                      tag: 'profile',
                                                                          child: Container(
                                        height: 115,
                                        width: 115,
                                        decoration: BoxDecoration(
                                          // border: Border.all(
                                          //     width: 1,
                                          //     color:
                                          //         Theme.of(context).primaryColor,
                                          //     style: BorderStyle.solid),
                                          color: theme.darkTheme
                                              ? Theme.of(context).backgroundColor
                                              : Colors.grey[200],
                                          shape: BoxShape.circle,
                                          image: user.picture == null
                                              ? DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/avatar.png'),
                                                  fit: BoxFit.fill,
                                                )
                                              : DecorationImage(
                                                  image:
                                                      NetworkImage(user.picture),
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child: Text(''),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 20.0, right: 20),
                                  child: Container(
                                    color: Colors.grey[800],
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.5,
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 20.0, right: 20),
                                    child: Text(
                                      '${user.name}',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10,
                                      // bottom: 25,
                                      left: 20.0,
                                      right: 20),
                                  child: Container(
                                    color: Colors.grey[800],
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SettingCard(
                image: 'assets/images/dark_icon.png',
                title: Provider.of<ThemeChanger>(context).darkTheme
                    ? 'Light mode'
                    : 'Dark mode',
                trailing: Container(
                  margin: EdgeInsets.only(bottom: 22),
                  child: Switch(
                    value: _switch,
                    onChanged: (value) {
                      setState(() {
                        _themeChange.toggleTheme();
                        _switch = value;
                      });
                    },
                    activeColor: Colors.white,
                    activeTrackColor: Color(0xffD9A20B),
                    inactiveTrackColor: Color(0xff414141),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
              SettingCard(
                image: 'assets/images/Notifications.png',
                title: 'Notifications',
                trailing: Container(
                  child: Icon(Icons.keyboard_arrow_right,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              SettingCard(
                image: 'assets/icons/device.png',
                title: 'My devices',
                onTap: () {
                   Navigator.pushNamed(context,DevicesPage.route);
                },
                trailing: Container(
                  child: Icon(Icons.keyboard_arrow_right,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              SettingCard(
                image: 'assets/icons/collections.png',
                title: 'My rooms',
                onTap: () {
                  Navigator.pushNamed(context,RoomsPage.route);
                },
                trailing: Container(
                  child: Icon(Icons.keyboard_arrow_right,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              SettingCard(
                 onTap: () {
                  Navigator.pushNamed(context, AddDevicePage.route);
                },
                image: 'assets/icons/device.png',
                title: 'Add new device',
                trailing: Container(
                  child: Icon(Icons.keyboard_arrow_right,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              SettingCard(
                onTap: () {
                  Navigator.pushNamed(context, AboutPage.route);
                },
                image: 'assets/icons/info.png',
                title: 'About',
                trailing: Container(
                  // color: Colors.red,
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SettingCard(
                onTap: () async {
                  sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.remove('token');
                  sharedPreferences.remove('user').then((value) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginPage()),
                        (Route<dynamic> route) => false);
                  }).catchError((onError) {
                    print(onError);
                  });
                },
                image: 'assets/images/exit_icon.png',
                title: 'Logout',
                trailing: Container(
                  child: Icon(Icons.keyboard_arrow_right,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
