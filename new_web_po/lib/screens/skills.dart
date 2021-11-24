import 'package:flutter/material.dart';
import 'package:new_web_po/animations/fade_animation.dart';
import 'package:new_web_po/utils/responsive.dart';
import 'package:new_web_po/widgets/info_card.dart';
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
    return ResponsiveWidget.isLargeScreen(context)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.values[4],
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  largeLeft(),
                  largeRight(),
                ],
              ),
              Container(),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[smallTop(), smallBottom(), Container()],
          );
  }

  Widget largeRight() {
    return Center(
      child: Container(
        child: FadeAndSlideWidget(
            duration: Duration(milliseconds: 1200),
            offset: Offset(-0.6, 0.6),
            child: pSkills()),
      ),
    );
  }

  Widget largeLeft() {
    return Container(
      child: FadeAndSlideWidget(
          duration: Duration(milliseconds: 1200),
          offset: Offset(-0.6, 0.6),
          child: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Center(child: tskills()),
          )),
    );
  }

  smallTop() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: FadeAndSlideWidget(
          duration: Duration(seconds: 1),
          offset: Offset(-0.6, 0.0),
          child: pSkills()),
    );
  }

  Widget smallBottom() {
    return Container(
      child: Center(
        child: FadeAndSlideWidget(
          offset: Offset(0.9, 0.0),
          child: Container(alignment: Alignment.topCenter, child: tskills()),
          duration: Duration(milliseconds: 1000),
        ),
      ),
    );
  }

  tskills() {
    return Container(
      height: 340,
      width: ResponsiveWidget.isLargeScreen(context)
          ? MediaQuery.of(context).size.width * 0.4
          : MediaQuery.of(context).size.width * 0.9,
      child: InfoCard(
        color: Colors.transparent,
        elevation: 0,
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
            alignment: Alignment.topCenter,
            child: Text('Technical skills',
                style: Theme.of(context).textTheme.title),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: linerProgress('Dart', 0.9),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: linerProgress('Flutter', 0.9),
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
            child: linerProgress('nodejs', 0.7),
          ),
        ],
      ),
    );
  }

  pSkills() {
    return Container(
      height: 340,
      width: ResponsiveWidget.isLargeScreen(context)
          ? MediaQuery.of(context).size.width * 0.4
          : MediaQuery.of(context).size.width * 0.9,
      child: InfoCard(
        color: Colors.transparent,
        elevation: 0,
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
            alignment: Alignment.topCenter,
            child: Text('Professional skills',
                style: Theme.of(context).textTheme.title),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: circleProgress('Communication', 0.75),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: circleProgress('Team Work', 0.80),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: circleProgress('Management', 0.80),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: circleProgress('Creativity', 0.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget linerProgress(String text, double percent) {
    return LinearPercentIndicator(
      animation: true,
      animationDuration: 4000,
      leading: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          width: 62,
          child: Text(
            text,
            style: Theme.of(context).textTheme.subtitle,
          ),
        ),
      ),
      percent: percent,
      trailing: Text((percent * 100).toString() + '%'),
      alignment: MainAxisAlignment.spaceEvenly,
      width: ResponsiveWidget.isLargeScreen(context)
          ? MediaQuery.of(context).size.width * 0.2
          : MediaQuery.of(context).size.width * 0.3,
      progressColor: Theme.of(context).buttonColor,
    );
  }

  Widget circleProgress(String text, double percent) {
    return Container(
      child: CircularPercentIndicator(
        animation: true,
        animationDuration: 4000,
        radius: 60,
        progressColor: Theme.of(context).buttonColor,
        footer: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            alignment: Alignment.center,
            width: 135,
            child: Text(
              text,
              style: Theme.of(context).textTheme.subtitle,
            ),
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
