import 'package:flutter/material.dart';
    var designWidth = 414.0;
    var designHight = 736.0;
    screenHight(BuildContext context , double hight){
      return MediaQuery.of(context).size.height*(hight/designHight);
    }
    screenWidth(BuildContext context , double width){
      return MediaQuery.of(context).size.width*(width/designWidth);
    }
    Widget spaceHight(BuildContext context,double hight){
      return SizedBox(
        height: screenHight(context,hight),
      );
    }



