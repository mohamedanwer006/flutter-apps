import 'package:flutter/material.dart';
import 'package:home_app/components/list_device_card.dart';
import 'package:home_app/models/device_model.dart';
import 'package:home_app/services/api/collection.dart';
import 'package:home_app/services/api/device.dart';
import 'package:home_app/services/provider/collection_provider.dart';
import 'package:home_app/services/provider/devices_provider.dart';
import 'package:home_app/theme/theme_changer.dart';
import 'package:provider/provider.dart';

class DevicesPage extends StatefulWidget {
  static const route = '/devices';
  @override
  _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  int selected = 0;
  DeviceServices _deviceServices = DeviceServices();
  CollectionServices _collectionServices = CollectionServices();
  // GlobalKey _scaffoldKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.done),
        //     color: Theme.of(context).iconTheme.color,
        //     onPressed: addSelectetdDevices,
        //   ),
        // ],
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              Navigator.of(context).pop();
            }),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Devices',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Consumer<ThemeChanger>(
        builder: (context, theme, child) => Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: _deviceServices.getDevices(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Device> devices = snapshot.data;
                      return ListView.builder(
                        shrinkWrap: false,
                        scrollDirection: Axis.vertical,
                        itemCount: devices.length,
                        itemBuilder: (context, index) {
                          return ListDeviceCard(
                            image: 'assets/images/idea.png',
                            title: devices[index].name ?? 'No name',
                            onTap: () {
                               addSelectetdDevice(devices[index]);
                              
                            },
                          );
                        },
                      );
                    } else
                      return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addSelectetdDevice(Device device) async {
    var collection = Provider.of<CollectionProvider>(context).collection;
    showLoading();
    var res = await _collectionServices.addDeviceToCollection(
        collection.id, device.id);
    if (res != null) {
      stopLoading();

    if(res){
      collection.devices.add(device.id);
      var devices = await Provider.of<DeviceProvider>(context).devices;
      devices.add(device);
      Provider.of<CollectionProvider>(context).setCollection(collection);
      }else{
      final snackBar = SnackBar(
        content: Text('Device already there!!'));
      _scaffoldKey.currentState.showSnackBar(snackBar);  
      }
    } else {
      errorDialog(collection.name, device.name);
    }
  }

  stopLoading() {
    Navigator.pop(context);
  }

  showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      // useSafeArea: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).backgroundColor,
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          ),
        );
      },
    );
  }

  errorDialog(String collectionName, String deviceName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Text(
            'Error',
          ),
        ),
        content: Text(
            'Oh no!🤦‍♂️ can\'t add $deviceName to $collectionName now,\ncheck your connection or try later'),
        contentTextStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
