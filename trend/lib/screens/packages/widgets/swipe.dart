import 'package:flutter/material.dart';

enum Swipe { left, right }
typedef OnSwipe = void Function(Swipe onSwipe);

class SwipeDetector extends StatefulWidget {
  const SwipeDetector({Key key, this.child, this.onSwipe});
  final Widget child;
  final OnSwipe onSwipe;

  @override
  _SwipeDetectorState createState() => _SwipeDetectorState();
}

class _SwipeDetectorState extends State<SwipeDetector> {
  double _startDX;
  double _endDX;
  double swipeDistance = 50; //distance in x direction to make swipe
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onHorizontalDragStart: _onHDrageStart,
      onHorizontalDragUpdate: _onHDrageUpdate,
      onHorizontalDragEnd: _onHDrageEnd,
      child: widget.child,
    );
  }

  void _onHDrageStart(DragStartDetails details) {
    _startDX = details.globalPosition.dx;
  }

  void _onHDrageUpdate(DragUpdateDetails details) {
    _endDX = details.globalPosition.dx;
  }

  void _onHDrageEnd(DragEndDetails details) {
    if (_startDX != null && _endDX != null) {
      final dx = _startDX - _endDX;
      print('start X = $_startDX  ' + '  end X = $_endDX' + '   dx = $dx');
      if (dx > swipeDistance) {
        //slide right
        widget.onSwipe(Swipe.right);
      } else if (dx < -swipeDistance) {
        // slide  left
        widget.onSwipe(Swipe.left);
      }
    }
    _startDX = null;
    _endDX = null;
  }
}
