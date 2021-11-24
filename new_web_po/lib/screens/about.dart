import 'package:flutter/material.dart';
import 'package:new_web_po/animations/fade_animation.dart';
import 'package:new_web_po/utils/responsive.dart';

class About extends StatefulWidget {
  About({Key key}) : super(key: key);
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  var text =
      'Hello😀, I’m Mohamed , Flutter-developer For Apps 📱 , Web💻. Also I am good at';
  bool selected = false;

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isLargeScreen(context)
        ? Padding(
          padding: EdgeInsets.only(top: 140),
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                largeImage(),
                largeText(),
              ]))
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              smallImage(),
        smallText(),
    ]);
  }

  Widget largeText() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: someText(),
    );
  }

  smallText() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: someText(),
      ),
    );
  }

  Widget largeImage() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      alignment: Alignment.topCenter,
      child: Image.asset('assets/images/ab-img.png'),
    );
  }

  Widget smallImage() {
    return FadeAndSlideWidget(
      offset: Offset(-0.9, 0.0),
      duration: Duration(milliseconds: 1000),
      child: Container(
        height: MediaQuery.of(context).size.width*0.45,
        alignment: Alignment.topCenter,
        child: Image.asset('assets/images/ab-img.png'),
      ),
    );
  }

  Widget someText() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
             padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
          child: Text('About', style: Theme.of(context).textTheme.headline),
        ),
        SizedBox(height: 30),
        Container(
          child: Text(text, style: Theme.of(context).textTheme.body1),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: circleText('C'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: circleText('js'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: circleText('py'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget circleText(String text) {
    return Container(
      padding: EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 15),
      decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: Theme.of(context).buttonColor,
              style: BorderStyle.solid),
          shape: BoxShape.circle),
      child:
          Center(child: Text(text, style: Theme.of(context).textTheme.body1)),
    );
  }
}
