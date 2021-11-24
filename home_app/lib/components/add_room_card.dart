import 'package:flutter/material.dart';
import 'package:home_app/theme/theme_changer.dart';
import 'package:home_app/utils/utilities.dart';
import 'package:provider/provider.dart';

class AddRoomCard extends StatefulWidget {
 final VoidCallback onTap;
const AddRoomCard({Key key,@required this.onTap}) ;
  @override
  _AddRoomCardState createState() => _AddRoomCardState();
}

class _AddRoomCardState extends State<AddRoomCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(
      builder: (context,theme,child)=>
         GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.only(top:10.0,bottom: 10.0,left: 10),
          child: Container(
            margin: EdgeInsets.only(right: screenWidth(context, 12.7)),
            width: screenWidth(context, 156.26),
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
            ),
            child: Center(
              child: Wrap(
                direction: Axis.vertical,
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Icon(Icons.add),
                  Text('Add room')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
