import 'package:flutter/material.dart';
import 'package:home_app/models/collections.dart';
import 'package:home_app/theme/theme_changer.dart';
import 'package:home_app/utils/utilities.dart';
import 'package:provider/provider.dart';

class RoomCard extends StatefulWidget {
 final VoidCallback onTap;
 final Collection collection;
const RoomCard({Key key, this.collection,@required this.onTap}) ;
  @override
  _RoomCardState createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(
      builder: (context,theme,child)=>
         GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.only(top:10.0,bottom: 10.0,left: 10),
          child: Container(
            margin: EdgeInsets.only(right: 12.7),
            width:MediaQuery.of(context).size.width>760?200: 156.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
             color:theme.darkTheme==true? Theme.of(context).backgroundColor:Colors.grey[200],
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
            image: widget.collection.picture !=null?DecorationImage(image:NetworkImage(widget.collection.picture),fit: BoxFit.fill):null,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left:30,
                right: 30
              ),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  Text('${widget.collection.devices!=null?widget.collection.devices.length:0}',
                    // '${widget.device.pins.length} devices',
                    style:Theme.of(context).textTheme.bodyText2
                  ),
                  Text(
                    widget.collection.name??'',
                    style: Theme.of(context).textTheme.bodyText1
                  ),    
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
