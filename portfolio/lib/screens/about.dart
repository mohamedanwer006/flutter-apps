import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/animations/fade_animation.dart';
import 'package:portfolio/utils/responsive.dart';

class About extends StatefulWidget {
  About({Key key}) : super(key: key);
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

 var text ='Hello, I’m Mohamed , Flutter-developer For Apps , Web . I have experience in web site design . Also I am good at';
 bool selected = false;

@override
  void initState() {
    //  Timer(Duration(milliseconds: 500), () {
    //   setState(() {
    //     // _animationController.forward();
    //     selected = true;
    //   });
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
                      height: 700,
                      child: AboutScreen(),
               );


    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    // return Stack(
    //   children: <Widget>[
    //     ResponsiveWidget.isLargeScreen(context)?largeText(height, width):smallText(height, width),
    //     ResponsiveWidget.isLargeScreen(context) ? largeImage(height,width) : smallImage(),
    //   ],
    // );
  }
//  Widget largeText(height,width){
//     return  Positioned(
//           right: 10,
//           top: 100,
//           child: Container(
//             alignment: Alignment.centerLeft,
//             height: height  ,
//             width: width * 0.45,
//             // duration: Duration(milliseconds: 1000),
//             // curve: Curves.easeInOut,
//             child:FadeAndSlideWidget(
//                   duration: Duration(milliseconds: 1200),
//                   offset: Offset(-0.6,0.6),
//                   child: someText()
//                   ),
//           ),
//         );
//   }

// smallText(height,width){
//     return  Positioned(
//           right: 0.0,
//           left: 0.0,
//           top: MediaQuery.of(context).size.height*0.48,
//           child: Container(
//             height: MediaQuery.of(context).size.height*0.5,
//             child: Container(
//               child:Padding(
//                 padding: const EdgeInsets.only(left: 20,right: 20),
//                 child: FadeAndSlideWidget(
//                   duration: Duration(seconds: 1),
//                   offset: Offset(0.9,0.0),
//                   child: someText()
//                   ),
//               ) ,
//             ),
//         ),
//      );
//   }
  
//   Widget largeImage(height,width) {
//     return Positioned(
//       top: 100,
//       left: 80,
//       child: Container(
//         child: Center(
//           child: AnimatedContainer(
//                height: height  ,
//               width: width * 0.4,
//               duration: Duration(seconds: 1),
//               curve: Curves.easeInOut,
//                child: FadeAndSlideWidget(
//                 child: Container(
//                   alignment: Alignment.topCenter,
//                   child: Image.asset('assets/images/ab-img.png'),
//                 ),
//                 duration: Duration(milliseconds: 1000),
//                 offset: Offset(0.0,0.6),
//               )
//               ),
//         ),
//       ),
//     );
//   }

//   Widget smallImage() {
//     return Positioned(
//       top: 50,
//       left: 0.0,
//       right: 0.0,
//       child: Container(
//         child: Center(
//           child: AnimatedContainer(
//               height: MediaQuery.of(context).size.height*0.4,
//               width: MediaQuery.of(context).size.width,
//               duration: Duration(seconds: 1),
//               curve: Curves.easeInOut,
//               child: FadeAndSlideWidget(
//                 offset: Offset(-0.9,0.0),
//                    duration: Duration(milliseconds: 1000),
//                 child: Container(
//                   alignment: Alignment.topCenter,
//                   child: Image.asset('assets/images/ab-img.png'),
//                 ),
//               )
//               ),
//         ),
//       ),
//     );
//   }

//   Widget someText() {
//     return Column(
//     children: <Widget>[
//        Container(
//          alignment:ResponsiveWidget.isLargeScreen(context)?  Alignment.centerLeft:Alignment.center,
//          child: Text(
//              'About',
//              style:Theme.of(context).textTheme.headline
//            ),
//        ),
//          SizedBox(height: 30),
//        Container(
//         alignment:ResponsiveWidget.isLargeScreen(context)?  Alignment.centerLeft:Alignment.center,
//         child: Text(
//           text,
//           style: Theme.of(context).textTheme.body1
//         ),
//       ),
//       SizedBox(height: 30),
//       Row(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: circleText('C'),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: circleText('js'),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: circleText('Agile'),
//           ),
//         ],
//       ),
//     ],
//   );
//   }

//   Widget circleText(String text){
//     return Container(
//         padding: EdgeInsets.only(right: 15,left: 15,top: 15,bottom: 15),
//         decoration: BoxDecoration(
//           border:Border.all(width: 2,color:  Theme.of(context).buttonColor,style: BorderStyle.solid),
//           shape: BoxShape.circle
//         ),
//         child: Text(text,style: Theme.of(context).textTheme.body1),
//       );
//   }
}



class AboutScreen extends StatefulWidget {
  AboutScreen({Key key}) : super(key: key);
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  var text =
      'Hello, I’m Mohamed From Egypt, Flutter-developer For Apps , Web . I have experience in web site design . Also I am good at';
  bool selected = false;

  @override
  void initState() {
    print('about init');
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
                child: circleText('Agile'),
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
