import 'package:flutter/material.dart';
import 'package:new_web_po/utils/responsive.dart';
class CircleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///todo:fix circle around img
    return 
    CustomPaint(
      painter: DrawCircle(inColor:Theme.of(context).backgroundColor ,outColor:Theme.of(context).primaryColor ),
        child: Container(
              width: ResponsiveWidget.isLargeScreen(context)?400:MediaQuery.of(context).size.width*0.7,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image.png',),
              ),
            ),
      ),
    );
    
    
    //  CircleAvatar(
    //   backgroundColor: Theme.of(context).primaryColor,
    //   child: Container(
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage(
    //     'assets/images/hero.png',
    //   ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

class DrawCircle extends CustomPainter{
  Color inColor;
  Color outColor;
  DrawCircle({this.inColor,this.outColor});
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint=Paint()
    ..color=outColor
    ..strokeCap=StrokeCap.round
    ..strokeWidth=20;
    paint.style=PaintingStyle.stroke;
    Offset offset=Offset(size.width*0.5,size.height*0.5);
    canvas.drawCircle(offset, size.width*0.25, paint);
    canvas.drawCircle(offset, size.width*0.225, paint..color=inColor);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }



}
