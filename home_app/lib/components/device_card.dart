import 'package:flutter/material.dart';
import 'package:home_app/models/device_model.dart';
import 'package:home_app/theme/theme_changer.dart';
import 'package:home_app/utils/utilities.dart';
import 'package:provider/provider.dart';


class DeviceCard extends StatefulWidget {
  final bool selected;
  final Device device;
  const DeviceCard({Key key, this.device, this.selected}) : super(key: key);
  @override
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(
      builder: (context,theme,childe)=>
          Padding(
        padding: const EdgeInsets.only(left:10,top:20.0,bottom: 20.0 ),
        child: Container(
          margin: EdgeInsets.only(right: screenWidth(context, 12.7)),
          width: 100,
          height: 110,
          decoration: BoxDecoration(
            border: widget.selected?Border.all(width: 1.5,color:Theme.of(context).primaryColor):null,
            color: theme.darkTheme==true?Theme.of(context).backgroundColor:Colors.grey[200],
            borderRadius: BorderRadius.circular(screenWidth(context, 25)),
            boxShadow: [
            BoxShadow(
                color:theme.darkTheme? Colors.grey[900]:Colors.grey[300],
                blurRadius:theme.darkTheme? 1:5,
                spreadRadius:1,
                offset: theme.darkTheme?Offset(1,1):Offset(4, 4)),
            BoxShadow(
                color:theme.darkTheme? Colors.grey[800]:Colors.white,
                blurRadius: theme.darkTheme?1:5,
                spreadRadius:1,
                offset:theme.darkTheme? Offset(-1,-1):Offset(-4,-4)),
          ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  '${widget.device.name}',
                  style: TextStyle(
                    color: Color(0xffD9A20B),
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

deviceCard() {
  return new Container(
    height: 36.00,
    width: 386.00,
    decoration: BoxDecoration(
      color: Color(0xff2a2a2a),
      border: Border.all(
        width: 0.50,
        color: Color(0xff545454),
      ),
      borderRadius: BorderRadius.circular(13.00),
    ),
  );
}