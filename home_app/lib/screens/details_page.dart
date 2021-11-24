import 'package:flutter/material.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';
import 'package:home_app/components/device_card.dart';
import 'package:home_app/models/device_model.dart';
import 'package:home_app/screens/devices_page.dart';
import 'package:home_app/screens/room_edit.dart';
import 'package:home_app/services/api/device.dart';
import 'package:home_app/services/mqtt/mqtt_services.dart';
import 'package:home_app/services/provider/collection_provider.dart';
import 'package:home_app/services/provider/devices_provider.dart';
import 'package:home_app/theme/theme_changer.dart';
import 'package:home_app/utils/utilities.dart';
import 'package:home_app/components/power_card.dart';
import 'package:home_app/components/weather_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  static const String route = '/details';
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double _sliderValue = 40.0;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  Duration _duration;
  bool _activePinDetails = false;
  bool _activeIntensity = false;
  bool _activeSchedule = true;

  DeviceServices _deviceServices = DeviceServices();
  // ApiServices _apiServices = ApiServices();
  MqttServices _mqttServices = MqttServices();
  ValueNotifier pinNumber = ValueNotifier<int>(0);
  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var collectionProvider =
        Provider.of<CollectionProvider>(context).collection;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          '${collectionProvider.name}',
          style: Theme.of(context).textTheme.headline6,
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              Navigator.of(context).pop();
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                Navigator.pushNamed(context, DevicesPage.route);
              }),
          IconButton(
              icon: Icon(
                Icons.mode_edit,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => RoomEdit()));
              })
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            spaceHight(context, 42.0),
            _drawUpperBoxes(22, 42, "On", "Off"),
            spaceHight(context, 20.0),
            _drawDevices(),
            spaceHight(context, 5.0),
            _activePinDetails ? _drawDetails() : Container(),
          ],
        ),
      ),
    );
  }

  Widget _drawDevices() {
    return Container(
        height: 130,
        width: MediaQuery.of(context).size.width,
        child: Consumer<DeviceProvider>(
          builder: (context, deviceProvider, child) {
            return FutureBuilder(
              future: deviceProvider.devices,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Device> devices = snapshot.data;
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: devices.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          Provider.of<DeviceProvider>(context)
                              .setDevice(devices[index]);
                          setState(() {
                            pinNumber.value = index;
                            _activePinDetails = true;
                            // _activeIntensity = snapshot.data[position]['intinisty'];
                          });
                        },
                        onLongPress: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    //  mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: _name,
                                          style: TextStyle(
                                            fontSize: 22,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: 'Device name',
                                          ),
                                          // onSaved: (val) => _name = val,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          RaisedButton(
                                            color:
                                                Theme.of(context).primaryColor,
                                            child: const Text('Close'),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                          RaisedButton(
                                            color:
                                                Theme.of(context).primaryColor,
                                            child: const Text('Done'),
                                            onPressed: () {
                                              print(_name.text);
                                              updateDeviceDetails(
                                                  Device(name: _name.text));
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: DeviceCard(
                            selected: pinNumber.value == index ? true : false,
                            device: snapshot.data[index]),
                      );
                    },
                  );
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Theme.of(context).primaryColor,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).backgroundColor),
                      ),
                    ),
                  );
                }
              },
            );
          },
        ));
  }

  Widget _drawUpperBoxes(
      int tempVal, int humidVal, String lightsState, String devicesState) {
    return Container(
      height: screenHight(context, 138),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          WeatherCard(
            weather: null,
          ),
          PowerCard(
            devicesState: devicesState,
            lightsState: lightsState,
          )
        ],
      ),
    );
  }

  Widget _drawDetails() {
    return Consumer2<ThemeChanger, DeviceProvider>(
      builder: (context, theme, deviceProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth(context, 27.0),
                right: screenWidth(context, 27.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Power',
                    style: TextStyle(
                        color: theme.darkTheme ? Colors.white : null,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Switch(
                      value: isSwitched1,
                      onChanged: (value) {
                        setState(() {
                          isSwitched1 = value;
                        });
                        _mqttServices.toggleDevice(
                            deviceProvider.device.id, (value ? 'on' : 'off'));

                        // (value ? 'on' : 'off');
                        // Pin _pin = widget.device.pins[pinNumber.value]
                        //     .copyWith(value: value ? 'on' : 'off');
                        // var _pins = widget.device.pins;
                        // _pins[pinNumber.value] = _pin;
                        // var device = widget.device.copyWith(pins: _pins);
                        ///implement mqtt publish
                        // _updateDeviceDetails(device);
                      },
                      activeColor: Colors.white,
                      activeTrackColor: Color(0xffD9A20B),
                      inactiveTrackColor: Color(0xff414141),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHight(context, 21.0),
            ),
            _activeIntensity
                ? Column(
                    children: <Widget>[
                      Divider(
                        color: Color(0xff414141),
                      ),
                      SizedBox(
                        height: screenHight(context, 10.0),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: screenWidth(context, 27)),
                        child: Text(
                          'Intensity',
                          style: TextStyle(
                              color: theme.darkTheme ? Colors.white : null,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: screenHight(context, 1),
                      ),
                      Slider(
                        divisions: 8,
                        min: 20,
                        max: 100,
                        value: _sliderValue,
                        onChanged: (double newValue) {
                          setState(() {
                            _sliderValue = newValue;
                          });
                          print(_sliderValue.floor());
                        },
                        activeColor: Color(0xffD9A20B),
                        inactiveColor: Color(0xff414141),
                      ),
                      SizedBox(
                        height: screenHight(context, 1),
                      ),
                      Divider(
                        color: Color(0xff414141),
                      ),
                    ],
                  )
                : Container(),
            _activeSchedule
                ? Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth(context, 27.0),
                          right: screenWidth(context, 27.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Schedule',
                              style: TextStyle(
                                  color: theme.darkTheme ? Colors.white : null,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Switch(
                                value: isSwitched2,
                                onChanged: (value) async {
                                  //TODO:Schedule;
                                  setState(() {
                                    isSwitched2 = value;
                                  });
                                  if (value) {
                                    Duration resultingDuration =
                                        await showDurationPicker(
                                      context: context,
                                      initialTime: new Duration(minutes: 30),
                                    );

                                    setState(() {
                                      if (resultingDuration == null)
                                        isSwitched2 = false;
                                      _duration = resultingDuration;
                                    });

                                    Scaffold.of(context).showSnackBar(
                                      new SnackBar(
                                        content: new Text(resultingDuration
                                                    .inHours ==
                                                0
                                            ? 'Switch on for ${resultingDuration.inMinutes} Minutes'
                                            : 'Switch on for ${resultingDuration.inHours} Hours'),
                                      ),
                                    );
                                  }
                                },
                                activeColor: Colors.white,
                                activeTrackColor: Color(0xffD9A20B),
                                inactiveTrackColor: Color(0xff414141),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHight(context, 20),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: screenWidth(context, 27)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'From',
                                  style: TextStyle(
                                    fontSize: screenWidth(context, 18.0),
                                    color:
                                        isSwitched2 ? null : Color(0xff414141),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth(context, 60),
                                ),
                                Text(
                                  '${DateFormat('kk:mm').format(DateTime.now())}',
                                  style: TextStyle(
                                    fontSize: screenWidth(context, 18.0),
                                    color:
                                        isSwitched2 ? null : Color(0xff414141),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth(context, 5.0),
                                ),
                                //TODO:AM & PM
                                Text(
                                  '',
                                  style: TextStyle(
                                    fontSize: screenWidth(context, 18.0),
                                    color:
                                        isSwitched2 ? null : Color(0xff414141),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'To',
                                  style: TextStyle(
                                    fontSize: screenWidth(context, 35.0),
                                    color:
                                        isSwitched2 ? null : Color(0xff414141),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth(context, 60),
                                ),
                                Text(
                                  '${isSwitched2 ? _duration != null ? DateFormat('kk:mm').format(DateTime.now().add(_duration)) : null : DateFormat('kk:mm').format(DateTime.now())}',
                                  style: TextStyle(
                                    fontSize: screenWidth(context, 35.0),
                                    color:
                                        isSwitched2 ? null : Color(0xff414141),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth(context, 5.0),
                                ),
                                Text(
                                  '',
                                  style: TextStyle(
                                    fontSize: screenWidth(context, 35.0),
                                    color:
                                        isSwitched2 ? null : Color(0xff414141),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        );
      },
    );
  }

  void updateDeviceDetails(Device _device) async {
    Device device = Provider.of<DeviceProvider>(context).device;
    if (await _deviceServices.updateDevice(device.id, _device))
      print("pin number:${pinNumber.value}Updated");
    else
      print('error');
  }
}
