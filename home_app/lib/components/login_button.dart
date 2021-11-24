import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {

 final VoidCallback onPressed;

  const LoginButton({@required this.onPressed}) ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(28),
      color: Color(0xFFD9A20B),
      shape: CircleBorder(side: BorderSide.none),
      onPressed: onPressed,
      elevation: 5,
      child: Icon(
        Icons.arrow_forward,
        size: 34,
        color: Colors.white,
      ),
    );
  }
}
