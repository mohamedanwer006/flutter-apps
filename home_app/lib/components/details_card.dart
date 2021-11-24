import 'package:flutter/material.dart';
import 'package:home_app/theme/theme_changer.dart';
import 'package:home_app/utils/utilities.dart';
import 'package:provider/provider.dart';

class DetailsCard extends StatefulWidget {
  final String title;
  final Widget icon;
  final bool showIcon;
  final Widget child;
  final VoidCallback onTapIcon;
  DetailsCard(
      {this.title,
      this.icon,
      @required this.showIcon,
      @required this.child,
      this.onTapIcon});

  @override
  _DetailsCardState createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(
      builder: (context, theme, child) {
        return Container(
          margin: EdgeInsets.only(left: screenWidth(context, 14)),
          height: screenHight(context, 138.0),
          width: screenWidth(context, 184.0),
          decoration: BoxDecoration(
            color: theme.darkTheme == true
                ? Theme.of(context).backgroundColor
                : Colors.grey[200],
            boxShadow: [
              BoxShadow(
                  color: theme.darkTheme ? Colors.grey[900] : Colors.grey[300],
                  blurRadius: theme.darkTheme ? 1 : 5,
                  spreadRadius: 1,
                  offset: theme.darkTheme ? Offset(1, 1) : Offset(4, 4)),
              BoxShadow(
                  color: theme.darkTheme ? Colors.grey[800] : Colors.white,
                  blurRadius: theme.darkTheme ? 1 : 5,
                  spreadRadius: 1,
                  offset: theme.darkTheme ? Offset(-1, -1) : Offset(-4, -4)),
            ],
            // color: Color(0xFF242424),
            borderRadius: BorderRadius.circular(
             15,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left:4,
                right: 4,
                top:10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                   child: Text('${widget.title}',
                          style: Theme.of(context).textTheme.headline5),
                    ),
                    widget.showIcon
                        ? Expanded(
                             child: Container(
                               alignment: Alignment.centerRight ,
                               child: GestureDetector(
                                onTap: widget.onTapIcon,
                                child: widget.icon,
                            ),
                             ),
                        )
                        : Container(),
                  ],
                ),
                theme.darkTheme
                    ? SizedBox(
                        height:screenHight(context, 35.0),
                      )
                    : SizedBox(
                        height: 10,
                      ),
                Expanded(
                    child: Container(
                    alignment: Alignment.bottomCenter,
                    child: widget.child
                    ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
