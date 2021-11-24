import 'package:flutter/material.dart';
import 'package:portfolio/animations/fade_animation.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/utils/social_link.dart';
import 'package:portfolio/widgets/info_card.dart';
import 'package:universal_html/html.dart' as html;

class ContactScreen extends StatefulWidget {
  ContactScreen({Key key}) : super(key: key);

  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ResponsiveWidget.isLargeScreen(context) ? largeLeft() : smallTop(),
        ResponsiveWidget.isLargeScreen(context) ? largeRight() : smallBottom(),
        copyRight()
      ],
    );
  }

  largeLeft() {
    return Positioned(
      top: 50,
      left: MediaQuery.of(context).size.width * 0.1,
      child: FadeAndSlideWidget(
          duration: Duration(milliseconds: 1000),
        offset: Offset(0.0, 0.6),
              child: Container(
          width: ResponsiveWidget.isLargeScreen(context)
              ? MediaQuery.of(context).size.width * 0.3
              : MediaQuery.of(context).size.width * 0.8,
          height: ResponsiveWidget.isLargeScreen(context)
              ? MediaQuery.of(context).size.height * 0.4
              : MediaQuery.of(context).size.height * 0.3,
          child: sociallinks(),
        ),
      ),
    );
  }

  largeRight() {
    return Positioned(
      top: 50,
      right: MediaQuery.of(context).size.width * 0.1,
      child: FadeAndSlideWidget(
        duration: Duration(milliseconds: 1000),
        offset: Offset(0.0, 0.6),
              child: Container(
          width: ResponsiveWidget.isLargeScreen(context)
              ? MediaQuery.of(context).size.width * 0.3
              : MediaQuery.of(context).size.width * 0.8,
          height: ResponsiveWidget.isLargeScreen(context)
              ? MediaQuery.of(context).size.height * 0.4
              : MediaQuery.of(context).size.height * 0.3,
          child: infoCard(),
        ),
      ),
    );
  }

  smallTop() {
    return Positioned(
      top: 50,
      left: MediaQuery.of(context).size.width * 0.05,
      right: MediaQuery.of(context).size.width * 0.05,
      child: FadeAndSlideWidget(
                   offset: Offset(-0.9,0.0),
                   duration: Duration(milliseconds: 1000),
              child: Container(
          width: ResponsiveWidget.isLargeScreen(context)
              ? MediaQuery.of(context).size.width * 0.3
              : MediaQuery.of(context).size.width * 0.8,
          height: ResponsiveWidget.isLargeScreen(context)
              ? MediaQuery.of(context).size.height * 0.4
              : MediaQuery.of(context).size.height * 0.3,
          child: infoCard(),
        ),
      ),
    );
  }

  smallBottom() {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.45,
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
        child: FadeAndSlideWidget(
                     offset: Offset(0.9,0.0),
                   duration: Duration(milliseconds: 1000),
                  child: Container(
            width: ResponsiveWidget.isLargeScreen(context)
                ? MediaQuery.of(context).size.width * 0.3
                : MediaQuery.of(context).size.width * 0.8,
            height: ResponsiveWidget.isLargeScreen(context)
                ? MediaQuery.of(context).size.height * 0.4
                : MediaQuery.of(context).size.height * 0.3,
            child: sociallinks(),
          ),
        ));
  }

  infoCard() {
    return InfoCard(
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
    );
  }

  sociallinks() {
    return InfoCard(
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
            title: Text('Facebook'),
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
            title: Text('Twitter'),
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
            title: Text('Github'),
          ),
        ),
      ],
    );
  }

  copyRight() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Text(
          'All right reserved © mohamed anwer 2019',
          style: Theme.of(context).textTheme.body2,
        )),
      ),
    );
  }
}
