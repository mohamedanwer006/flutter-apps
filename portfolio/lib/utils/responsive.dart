
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeWidget;
  final Widget mediumWidget;
  final Widget smallWidget;
  ResponsiveWidget({@required this.largeWidget,this.mediumWidget,this.smallWidget});

static bool isSmallScreen(BuildContext context){
  return MediaQuery.of(context).size.width<750;
}
static bool isMediumScreen(BuildContext context){
  return MediaQuery.of(context).size.width>750
  &&MediaQuery.of(context).size.width<1200;
}
static bool isLargeScreen(BuildContext context){
  return MediaQuery.of(context).size.width>800;
}


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        if(constraints.maxWidth > 1200){
          return largeWidget;
        }else if(constraints.maxWidth > 750 && constraints.maxWidth<1200){
          ///return medium widget if = null return lage widget
          return mediumWidget??largeWidget; 
        }else{
          ///return medium widget if = null return lage widget
          return smallWidget??largeWidget;
        }
      },
    );
  }
}