import 'package:flutter/material.dart';
import 'package:home_app/components/list_device_card.dart';
import 'package:home_app/models/device_model.dart';
import 'package:home_app/services/api/device.dart';
import 'package:home_app/theme/theme_changer.dart';
import 'package:provider/provider.dart';

class MyDevicesPage extends StatefulWidget {
  static const route = '/myDevices';
  @override
  _MyDevicesPageState createState() => _MyDevicesPageState();
}

class _MyDevicesPageState extends State<MyDevicesPage> {
  int selected = 0;
  DeviceServices _deviceServices = DeviceServices();
  GlobalKey key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
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
          style: Theme.of(context).textTheme.headline6,
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
                            title: devices[index].name??'No name',
                            onTap: (){},
                          
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
}