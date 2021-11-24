import 'package:flutter/material.dart';
import 'package:home_app/screens/add_device_page2.dart';
import 'package:home_app/theme/theme_changer.dart';
import 'package:home_app/utils/utilities.dart';
import 'package:provider/provider.dart';

///Add new device with AP mode
class AddDevicePage extends StatefulWidget {
  static const String route = '/add_device';
  @override
  _AddDevicePageState createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Add device',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Consumer<ThemeChanger>(
        builder: (context, theme, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:10,),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(25),
                    color: Theme.of(context).cardColor,
                  ),
                  child: tut()
                ),
              ),
            ),
             Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.43,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(25),
                    color: Theme.of(context).cardColor,
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset('assets/images/ap.jpg',fit: BoxFit.fill
                    ,),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: MaterialButton(
        child: Text('Next',style:Theme.of(context).textTheme.headline6,),
        height: 45,
        minWidth: 120,
        elevation: 0,
        color: Theme.of(context).accentColor,
        onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AddDevicePage2(),));
        },
      ),
    );
  }

  Widget tut(){
    var textTheme=Theme.of(context).textTheme.headline6;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('1. Power device',style: textTheme,),
          Text('2. Open Settings>Wi-Fi',style: textTheme,),
          Text('3. Select ACDevice',style: textTheme,),
          Text('3. Enter password MD1234567',style: textTheme,),
          Text('4. Click Next',style: textTheme,),
          // Text('5. Enter your network password'),
        ],
      ),
    );
  }
}
