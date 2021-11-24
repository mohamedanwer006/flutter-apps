import 'package:flutter/material.dart';
import 'package:new_portfolio/animations/fade_animation.dart';
import 'package:new_portfolio/utils/responsive.dart';
import 'package:new_portfolio/widgets/info_card.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SkillsScreen extends StatefulWidget {
  SkillsScreen({Key key}) : super(key: key);

  _SkillsScreenState createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        ResponsiveWidget.isLargeScreen(context)
            ? largRight(height, width)
            : smallBottom(height, width),
        ResponsiveWidget.isLargeScreen(context)
            ? largeLeftWidget(height, width)
            : smallTop(),
      ],
    );
  }

  Widget largRight(height, width) {
    return Positioned(
      right: 0,
      top: 50,
      child: Container(
        height: 500,
        width: width * 0.5,
        child: FadeAndSlideWidget(
            duration: Duration(milliseconds: 1200),
            offset: Offset(-0.6, 0.6),
            child: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Center(child: profSkills()),
            )),
      ),
    );
  }

  Widget largeLeftWidget(height, width) {
    return Positioned(
      top: 50,
      left: 0.0,
      child: Container(
        // alignment: Alignment. center,
        height: 500,
        width: width * 0.5,
        child: FadeAndSlideWidget(
            duration: Duration(milliseconds: 1200),
            offset: Offset(-0.6, 0.6),
            child: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Center(child: programingSkills()),
            )),
      ),
    );
  }

  smallBottom(height, width) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.01,
      right: MediaQuery.of(context).size.width * 0.01,
      top: MediaQuery.of(context).size.height * 0.48,
      child: Container(
        child: Center(
          child: AnimatedContainer(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: FadeAndSlideWidget(
                  duration: Duration(seconds: 1),
                  offset: Offset(-0.6, 0.0),
                  child: profSkills()),
            ),
          ),
        ),
      ),
    );
  }

  Widget smallTop() {
    return Positioned(
      top: 0,
      left: MediaQuery.of(context).size.width * 0.01,
      right: MediaQuery.of(context).size.width * 0.01,
      child: Container(
        child: Center(
          child: AnimatedContainer(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: FadeAndSlideWidget(
                  offset: Offset(0.9, 0.0),
                  child: Container(
                      alignment: Alignment.topCenter,
                      child: programingSkills()),
                  duration: Duration(milliseconds: 1000),
                ),
              )),
        ),
      ),
    );
  }

  Widget profSkills() {
    return InfoCard(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
            alignment: Alignment.topCenter,
            child: Text('Professional skills',
                style: Theme.of(context).textTheme.title),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: circleProgress('Communication', 0.80),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: circleProgress('Team Work', 0.85),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: circleProgress('Communication', 0.80),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: circleProgress('Team Work', 0.85),
        ),
      ],
    );
  }

  programingSkills() {
    return InfoCard(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
            alignment: Alignment.topCenter,
            child: Text('Technical skills',
                style: Theme.of(context).textTheme.title),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: linerProgress('Dart', 0.9),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: linerProgress('C', 0.74),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: linerProgress('js', 0.6),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: linerProgress('Flutter', 0.9),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: linerProgress('nodejs', 0.7),
        ),
      ],
    );
  }

  Widget linerProgress(String text, double percent) {
    if (ResponsiveWidget.isLargeScreen(context)|| ResponsiveWidget.isMediumScreen(context))
      return LinearPercentIndicator(
        animation: true,
        animationDuration: 4000,
        leading: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 100,
            child: Text(
              text,
              style: Theme.of(context).textTheme.subtitle,
            ),
          ),
        ),
        percent: percent,
        trailing: Text((percent * 100).toString() + '%'),
        alignment: MainAxisAlignment.start,
        // width: 200,
        progressColor: Theme.of(context).buttonColor,
      );
    else
      return LinearPercentIndicator(
        animation: true,
        animationDuration: 4000,
        leading: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width:90,
            child: Text(
              text,
              style: Theme.of(context).textTheme.subtitle,
            ),
          ),
        ),
        percent: percent,
        trailing: Text((percent * 100).toString() + '%'),
        // alignment: MainAxisAlignment.start,
        // width: 200,
        progressColor: Theme.of(context).buttonColor,
      );
  }

  Widget circleProgress(String text, double percent) {
    return Container(
      width: 150,
      child: CircularPercentIndicator(
        animation: true,
        animationDuration: 4000,
        radius: 60,
        progressColor: Theme.of(context).buttonColor,
        footer: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.subtitle,
          ),
        ),
        percent: percent,
        lineWidth: 3,
        center: Text((percent * 100).toString() + '%'),
        // arcType: ArcType.FULL,
      ),
    );
  }
}
