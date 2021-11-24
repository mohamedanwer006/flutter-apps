import 'package:flutter/material.dart';
import 'package:home_app/components/add_button.dart';
import 'package:home_app/components/room_card.dart';
import 'package:home_app/components/add_room_card.dart';
import 'package:home_app/models/weather.dart';
import 'package:home_app/screens/add_room.dart';
import 'package:home_app/screens/details_page.dart';
import 'package:home_app/screens/settings.dart';
import 'package:home_app/services/api/device.dart';
import 'package:home_app/services/api/weather_services.dart';
import 'package:home_app/services/provider/collection_provider.dart';
import 'package:home_app/services/provider/devices_provider.dart';
import 'package:home_app/services/provider/user_provider.dart';
import 'package:home_app/utils/utilities.dart';
import 'package:home_app/components/power_card.dart';
import 'package:home_app/components/weather_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String route = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool switchValue = false;
  GlobalKey _globalKey;
  DeviceServices _deviceServices = DeviceServices();
  WeatherServices weatherServices = WeatherServices();
  var w;
  getweather()async{
   var d= weatherServices.fetchData();
   setState(() {
     w=d;
   });
  }
  @override
  void initState() {
    getweather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        key: _globalKey,
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: FloatingButton(
          title: 'Add Room',
          onPressed: _addRoom,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Home',
            style: Theme.of(context).textTheme.headline4,
          ),
          leading: GestureDetector(
              // shape: CircleBorder(side: BorderSide(width: 1,color:Theme.of(context).primaryColor)),
              onTap: _setting,
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 10, bottom: 4),
                child: Hero(
                  tag: 'profile',
                     child: Container(
                    // margin: EdgeInsets.all(8),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      image: user != null
                          ? DecorationImage(
                              image: user.picture != null
                                  ? NetworkImage(user.picture)
                                  : AssetImage('assets/images/idea.png'),
                            )
                          : DecorationImage(
                              image: AssetImage('assets/images/avatar.png'),
                            ),
                      // color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              )),
        ),
        body: Stack(
          children: <Widget>[
            // Positioned(bottom: 10,
            // child: MusicCard()
            // ),
            ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                spaceHight(context, 42),
                _drawUpperBoxes(25, 42, "On", "Off"),
                spaceHight(context, 30.0),
                _descText(),
                spaceHight(context, 13.2),
                _drawRooms(),
                // Expanded(child: spaceHight(context, 28.7)),
                // Expanded(child: MusicCard())
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawUpperBoxes(
      int tempVal, int humidVal, String lightsState, String devicesState) {
    return Container(
      height: screenHight(context, 138),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          FutureBuilder(
            future: w,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return WeatherCard(
                  weather: snapshot.data,
                );
              } else {
                return WeatherCard(
                  weather: null,
                );
              }
            },
          ),
          PowerCard(lightsState: lightsState, devicesState: devicesState),
        ],
      ),
    );
  }

  Widget _descText() {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth(context, 18.0)),
      child: Text('Select room ', style: Theme.of(context).textTheme.headline5),
    );
  }

  Widget _drawRooms() {
    return Container(
      height: screenHight(context, 265.09),
      child: Consumer<CollectionProvider>(
        builder: (context, value, child) {
          return FutureBuilder(
            future: value.collections,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length + 1,
                  itemBuilder: (BuildContext context, index) {
                    //*check if index is equal to the last item in the list+1
                    if (index == snapshot.data.length) {
                      return AddRoomCard(
                        onTap: _addRoom,
                      );
                    } else
                      return RoomCard(
                        onTap: () {
                          // _apiServices.getDevicesByIds(snapshot.data[index].devices);
                          Provider.of<DeviceProvider>(context).setDevices(
                              _deviceServices.getDevicesByIds(
                                  snapshot.data[index].devices));
                          Provider.of<CollectionProvider>(context)
                              .setCollection(snapshot.data[index]);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(),
                            ),
                          );
                        },
                        collection: snapshot.data[index],
                      );
                  },
                );
              } else
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).backgroundColor),
                    ),
                  ),
                );
            },
          );
        },
      ),
    );
  }

  void _setting() {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => SettingsPage()));
    Navigator.pushNamed(
      context,
      SettingsPage.route,
    );
  }

  void _addRoom() {
    print('add room taped');
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => AddRoomPage()));
    Navigator.pushNamed(context, AddRoomPage.route);
  }
}
