import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:home_app/theme/theme_changer.dart';
import 'package:home_app/utils/utilities.dart';

class FloatingButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;

  const FloatingButton({
    Key key,
    this.onPressed,
    this.title,
  }) : super(key: key);

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(builder: (context, theme, childe) {
      return GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          margin: EdgeInsets.only(left: 30),
          height: 72,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: theme.darkTheme ? Colors.grey[200] : Colors.grey[200],
            boxShadow: [
              BoxShadow(
                  color: theme.darkTheme ? Colors.grey[900] : Colors.grey[400],
                  blurRadius: theme.darkTheme ? 1 : 15,
                  spreadRadius: 1,
                  offset: theme.darkTheme ? Offset(1, 1) : Offset(4, 4)),
              BoxShadow(
                  color: theme.darkTheme ? Colors.grey[800] : Colors.white,
                  blurRadius: theme.darkTheme ? 1 : 15,
                  spreadRadius: 1,
                  offset: theme.darkTheme ? Offset(-1, -1) : Offset(-4, -4)),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(18),
                      color: theme.darkTheme
                          ? Color(0xff242424)
                          : Color(0xff242424),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 10
                ),
                Text(
                  '${widget.title}',
                  style: TextStyle(
                    color: theme.darkTheme == true
                        ? Color(0xff242424)
                        : Color(0xff242424),
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
