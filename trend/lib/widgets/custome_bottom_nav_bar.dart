import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trend/theme/app_colors.dart';

class TrendNavBar extends StatefulWidget {
  TrendNavBar({
    Key key,
    this.tabs,
    this.selectedIndex = 0,
    this.onTabChange,
    this.activeColor,
    this.color,
    this.iconSize,
    this.textStyle,
    this.curve,
    this.duration,
  });

  final List<NavBarItem> tabs;
  final int selectedIndex;
  final Function onTabChange;
  final double iconSize;
  final Color activeColor;
  final Color color;
  final TextStyle textStyle;
  final Duration duration;
  final Curve curve;

  @override
  _TrendNavBarState createState() => _TrendNavBarState();
}

class _TrendNavBarState extends State<TrendNavBar> {
  int selectedIndex;
  bool clickable = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    selectedIndex = widget.selectedIndex;
    return Material(
      color: Colors.white.withOpacity(0.75),
      elevation: 5,
      type: MaterialType.canvas,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(21.00),
          topRight: Radius.circular(21.00),
        ),
      ),
      child: Container(
          height: 56.00,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(21.00),
              topRight: Radius.circular(21.00),
            ),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widget.tabs
                  .map((t) => NavBarItem(
                        width: MediaQuery.of(context).size.width /
                            (widget.tabs.length),
                        active: selectedIndex == widget.tabs.indexOf(t),
                        iconActiveColor:
                            t.iconActiveColor ?? widget.activeColor,
                        iconColor: t.iconColor ?? widget.color,
                        iconSize: t.iconSize ?? widget.iconSize,
                        textColor: t.textColor ?? widget.activeColor,
                        textStyle: t.textStyle ?? widget.textStyle,
                        text: t.text,
                        icon: t.icon,
                        center: t.center,
                        profileImag: t.profileImag,
                        curve: widget.curve ?? Curves.ease,
                        duration:
                            widget.duration ?? Duration(milliseconds: 500),
                        onPressed: () {
                          if (!clickable) return;
                          setState(() {
                            selectedIndex = widget.tabs.indexOf(t);
                            clickable = false;
                          });
                          widget.onTabChange(selectedIndex);
                          Future.delayed(
                              widget.duration ?? Duration(milliseconds: 500),
                              () {
                            setState(() {
                              clickable = true;
                            });
                          });
                        },
                      ))
                  .toList())),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final bool active;
  final Color iconColor;
  final Color iconActiveColor;
  final Color textColor;
  final TextStyle textStyle;
  final double iconSize;
  final double width;
  final bool center;
  final Function onPressed;
  final String text;
  final IconData icon;
  final Duration duration;
  final Curve curve;
  final String profileImag;
  NavBarItem({
    Key key,
    this.active,
    this.icon,
    this.iconColor,
    this.iconActiveColor,
    this.text,
    this.textColor,
    this.duration,
    this.curve,
    this.textStyle,
    this.iconSize,
    this.onPressed,
    this.width,
    this.center = false,
    this.profileImag,
  });

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  @override
  Widget build(BuildContext context) {
    return ItemWidget(
      center: widget.center,
      profileImag: widget.profileImag,
      width: widget.width,
      duration: widget.duration,
      iconSize: widget.iconSize,
      active: widget.active,
      onPressed: () {
        widget.onPressed();
      },
      curve: widget.curve,
      color: widget.center && widget.active
          ? widget.iconActiveColor
          : widget.iconColor,
      icon: Icon(widget.icon,
          color: widget.active ? widget.iconActiveColor : widget.iconColor,
          size: widget.iconSize),
      text: Text(
        widget.text,
        style: widget.textStyle ??
            TextStyle(fontWeight: FontWeight.w600, color: widget.textColor),
      ),
    );
  }
}

class ItemWidget extends StatefulWidget {
  ItemWidget({
    Key key,
    this.icon,
    this.iconSize,
    this.text,
    this.color,
    this.onPressed,
    this.duration,
    this.curve,
    this.active = false,
    this.center = false,
    this.profileImag,
    this.width,
  }) : super(key: key);

  final Widget icon;
  final double iconSize;
  final double width;
  final Widget text;
  final String profileImag;
  final Color color;
  final bool active;
  final bool center;
  final VoidCallback onPressed;
  final Duration duration;
  final Curve curve;

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> with TickerProviderStateMixin {
  bool _expanded;
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _expanded = widget.active;

    expandController =
        AnimationController(vsync: this, duration: widget.duration);
    animation = CurvedAnimation(
        parent: expandController,
        curve: widget.curve,
        reverseCurve: widget.curve.flipped);
  }

  @override
  void dispose() {
    expandController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _expanded = !widget.active;
    if (_expanded)
      expandController.reverse();
    else
      expandController.forward();

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        widget.onPressed();
      },
      child: widget.center ? _profileButton() : _iconButton(),
    );
  }

// https://media.filfan.com/NewsPics/FilfanNew/large/211819_0.jpg
  Widget _profileButton() => Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(width: 2.5, color: widget.color),
          shape: BoxShape.circle,
          color: AppColors.cardColor,
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              widget.profileImag,
              scale: 1,
            ),
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget _iconButton() => Container(
        width: widget.width,
        child: Center(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(child: widget.icon),
                SizeTransition(
                  axis: Axis.vertical,
                  axisAlignment: 1,
                  sizeFactor: animation,
                  child: Opacity(
                    opacity: 1, // debug use
                    child: Center(
                      child: widget.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
