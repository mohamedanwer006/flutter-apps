import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class NumberButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  NumberButton({@required this.onPressed,this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: CircleBorder(),
      padding: EdgeInsets.all(20),
      onPressed: onPressed,
      color: Colors.grey.withOpacity(0.5),
      child: Text(
        text,
        style: TextStyle(fontSize: 38),
      ),
      elevation:0 ,
    );
  }
}
