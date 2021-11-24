import 'dart:async';
import 'package:flutter/material.dart';

class FadeAndSlideWidget extends StatefulWidget {
 final Widget child;
 final  Duration duration;
 final Offset offset;

 FadeAndSlideWidget({@required this.child,@required this.duration,@required this.offset});

  @override
  _FadeAndSlideWidgetState createState() => _FadeAndSlideWidgetState();
}

class _FadeAndSlideWidgetState extends State<FadeAndSlideWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animationOffset;
  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: widget.duration);
     var curve = CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: _controller);
        _animationOffset =
        Tween<Offset>(begin:widget.offset, end: Offset.zero).animate(curve);
    Timer(Duration(milliseconds: 500), (){ 
       _controller.forward();
    });
    // _controller.forward();
    super.initState();
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child:SlideTransition(
        position: _animationOffset,
        child: widget.child,
      )
    );
  }
}