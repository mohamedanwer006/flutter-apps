import 'package:flutter/material.dart';
class ProfileButtons extends StatelessWidget {
  final VoidCallback signOutPress;
  final VoidCallback settingsPress;

  ProfileButtons({this.signOutPress, this.settingsPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MaterialButton(
              onPressed: signOutPress,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ) ,
              color: Colors.blue,
              height: 35,
              minWidth: 66,
              elevation: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons. remove_circle_outline),
                  SizedBox(width: 10,),
                  Text('Sign Out'),
                ],
              ),

            ),

            MaterialButton(
              onPressed: settingsPress,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ) ,
              color: Colors.white30,
              height: 35,
              minWidth: 66,
              elevation: 1,
              child: Row(
                children: <Widget>[
                  Icon(Icons.settings),
                  SizedBox(width: 10,),
                  Text('Settings'),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
