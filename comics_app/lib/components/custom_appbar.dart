import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String imgUrl;

  CustomAppBar({this.imgUrl});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  double height , width;

  TextStyle _appTitleStyle=TextStyle(
    fontSize: 22,
    color: Colors.deepPurpleAccent,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,

  );
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.bottomCenter,
      width: width,
      height: height*0.1,
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Comics Maker',style: _appTitleStyle,),
            CircleAvatar(
              backgroundImage:widget.imgUrl!=null?NetworkImage(widget.imgUrl):ExactAssetImage('images/avatar.png'),
              radius: 22,
            ),
          ],
        ),
      ),
    );
  }
}

