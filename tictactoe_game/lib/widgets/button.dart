import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final int buttonNum;
  const Button({Key key, this.buttonNum}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(width: 0.9, color: Colors.grey[900])),
      child: Center(
        child: Text(
          '$buttonNum',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}