import 'package:flutter/material.dart';
import 'package:new_web_po/animations/fade_animation.dart';
import 'package:new_web_po/utils/responsive.dart';
import 'package:new_web_po/utils/social_link.dart';
import 'package:new_web_po/widgets/info_card.dart';
import 'package:universal_html/html.dart' as html;

class ContactScreen extends StatefulWidget {
  ContactScreen({Key key}) : super(key: key);

  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void initState() {
    // print('contact init');
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
              copyRight(),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[smallTop(), smallBottom(), copyRight()],
          );
  }

  largeLeft() {
    return FadeAndSlideWidget(
      duration: Duration(milliseconds: 1000),
      offset: Offset(0.0, 0.6),
      child: Container(
        child: sociallinks(),
      ),
    );
  }

  largeRight() {
    return FadeAndSlideWidget(
      duration: Duration(milliseconds: 1000),
      offset: Offset(0.0, 0.6),
      child: Container(
        child: infoCard(),
      ),
    );
  }

  smallTop() {
    return Container(
      child: infoCard(),
    );
  }

  smallBottom() {
    return Container(
      child: sociallinks(),
    );
  }

  infoCard() {
    return Container(
      height: 250,
      width: ResponsiveWidget.isLargeScreen(context)
          ? MediaQuery.of(context).size.width * 0.4
          : MediaQuery.of(context).size.width * 0.9,
      child: InfoCard(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Text(
              'Contact Info',
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Theme.of(context).buttonColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: ListTile(
              //todo:Ontap
              leading: Icon(
                Icons.email,
                color: Theme.of(context).textTheme.body1.color,
              ),
              title: SelectableText('mohamedanwer006@gmail.com',
                  cursorColor: Theme.of(context).buttonColor,
                  toolbarOptions: ToolbarOptions(
                    copy: true,
                    selectAll: true,
                  ),
                  strutStyle: StrutStyle(
                    height: 1,
                  ),
                  style: Theme.of(context).textTheme.body1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: ListTile(
              onTap: () {
                html.window.open(w_up, 'whatsapp');
              },
              //todo:Ontap
              leading: Icon(
                Icons.phone,
                color: Theme.of(context).textTheme.body1.color,
              ),
              title: Text('WhatsApp Me',
                  strutStyle: StrutStyle(
                    height: 1,
                  ),
                  style: Theme.of(context).textTheme.body1),
            ),
          ),
        ],
      ),
    );
  }

  sociallinks() {
    return Container(
      height: 250,
      width: ResponsiveWidget.isLargeScreen(context)
          ? MediaQuery.of(context).size.width * 0.4
          : MediaQuery.of(context).size.width * 0.9,
      child: InfoCard(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: ListTile(
              leading: Image.asset(
                'assets/images/facebook.png',
                height: 30,
              ),
              onTap: () {
                html.window.open(facebook, 'facebook');
              },
              title: Text('Facebook',style: Theme.of(context).textTheme.body1,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: ListTile(
              leading: Image.asset(
                'assets/images/twitter.png',
                height: 30,
              ),
              onTap: () {
                html.window.open(twitter, 'twitter');
              },
              title: Text('Twitter',style: Theme.of(context).textTheme.body1,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: ListTile(
              leading: Image.asset(
                'assets/images/github1.png',
                height: 30,
              ),
              onTap: () {
                html.window.open(github, 'github');
              },
              title: Text('Github',style: Theme.of(context).textTheme.body1,),
            ),
          ),
        ],
      ),
    );
  }

  copyRight() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: Text(
        'Made with ❤ by mohamed anwar  All rights reserved © 2020 ',
        style: Theme.of(context).textTheme.body2,
      )),
    );
  }
}
