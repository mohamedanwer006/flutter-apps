import 'package:flutter/material.dart';
import 'package:new_portfolio/animations/fade_animation.dart';
import 'package:new_portfolio/utils/responsive.dart';
import 'package:new_portfolio/utils/social_link.dart';
import 'package:new_portfolio/widgets/circle_image.dart';
import 'package:universal_html/html.dart'as html;
class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
            ? largeImage(height, width)
            : smallImage(height, width),
        ResponsiveWidget.isLargeScreen(context) ? largeWidget() : smallWidget(),
      ],
    );
  }

  largeImage(height, width) {
    return Positioned(
      right: 10,
      top: 120,
      child: FadeAndSlideWidget(
        duration: Duration(milliseconds: 1000),
        offset: Offset(0.0, 0.6),
        child: Container(
          height: height * 0.7,
          width: width * 0.6,
          child: CircleImage(),
        ),
      ),
    );
  }

  smallImage(height, width) {
    return Positioned(
      left: width * 0.5 - (width * 0.35),
      top: 10,
      child: FadeAndSlideWidget(
         duration: Duration(milliseconds: 1000),
          offset: Offset(-0.6, 0.0),
          child: Container(
          height: height * 0.4,
          width: width * 0.7,
          child: CircleImage(),
        ),
      ),
    );
  }

  Widget largeWidget() {
    return Positioned(
      top: 170,
      left: 100,
      child: Container(
        child: Center(
          child: FadeAndSlideWidget(
            child: someText(),
            duration: Duration(milliseconds: 1000),
            offset: Offset(0.0, 0.6),
          ),
        ),
      ),
    );
  }

  Widget smallWidget() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.45,
      left: 0.0,
      right: 0.0,
      child: Container(
        child: Center(
          child: FadeAndSlideWidget(
            offset: Offset(0.6, 0.0),
            child: someText(),
            duration: Duration(milliseconds: 1000),
          ),
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
          Padding(
            padding: const EdgeInsets.symmetric( horizontal: 50),
            child: Container(
              // width:MediaQuery.of(context).size.width*0.4,
              decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  // bottomLeft: Radius.circular(20),
                  // topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
              child: Center(
                child: Text('Hello! I\'m',
                    style: Theme.of(context).textTheme.subtitle),
              ),
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
          //  SizedBox(
          //   height: 10,
          // ),
          // info('', Icons.email),
      
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
