import 'package:flutter/material.dart';
import 'package:new_web_po/animations/fade_animation.dart';
import 'package:new_web_po/utils/responsive.dart';
import 'package:new_web_po/utils/social_link.dart';
import 'package:new_web_po/widgets/circle_image.dart';
import 'package:universal_html/html.dart'as html;


class HomeBody extends StatefulWidget {
  HomeBody({Key key}) : super(key: key);

  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
 
 @override
  void initState() {
    print('home init');
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
                  largeWidget(),
                  largeImage(),
                ],
              ),
              Container(),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[smallImage(), smallWidget(), Container()],
          );
  }

  largeImage() {
    return FadeAndSlideWidget(
      duration: Duration(milliseconds: 1000),
      offset: Offset(0.0, 0.6),
      child: Container(
        height: 400,
        width: 400,
        child: CircleImage(),
      ),
    );
  }

  smallImage() {
    return FadeAndSlideWidget(
       duration: Duration(milliseconds: 1000),
        offset: Offset(-0.6, 0.0),
        child: Container(
          height:400,
          width: MediaQuery.of(context).size.width*0.7,
        child: CircleImage(),
      ),
    );
  }

  Widget largeWidget() {
    return Container(
      child: FadeAndSlideWidget(
        child: someText(),
        duration: Duration(milliseconds: 1000),
        offset: Offset(0.0, 0.6),
      ),
    );
  }

  Widget smallWidget() {
    return Container(
      child: Center(
        child: FadeAndSlideWidget(
          offset: Offset(0.6, 0.0),
          child: someText(),
          duration: Duration(milliseconds: 1000),
        ),
      ),
    );
  }

  Widget someText() {
    return Card(
      color: Colors.transparent,
      elevation: 0,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            child: Center(
              child: Text('Hello! I\'m',
                  style: Theme.of(context).textTheme.subtitle),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
        
            alignment: Alignment.centerLeft,
            child: Text('Mohamed Anwar ',
                style: Theme.of(context).textTheme.headline),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
         
            // alignment: Alignment.centerLeft,
            child: Text('Flutter Developer',
                style: Theme.of(context).textTheme.title),
          ),
          SizedBox(
            height: 20,
          ),
          info('mohamedanwer006@gmail.com', Icons.email),
      
          // MaterialButton(
          //   onPressed: (){
          //      html.window.open(github, 'github');
          //   },
          //   child: Image.asset('assets/images/github1.png',height: 30,),
          // )
        ],
      ),
    );
  }

  Widget info(String text, IconData icon) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Theme.of(context).textTheme.body1.color,
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: SelectableText(text,
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
      ],
    );
  }
}
