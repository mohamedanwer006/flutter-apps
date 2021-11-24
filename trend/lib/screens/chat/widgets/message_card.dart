import 'package:flutter/material.dart';

import 'package:trend/theme/app_colors.dart';

class MessagesCard extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color shadow;
  final Color textColor;
  const MessagesCard({
    Key key,
    this.text,
    this.backgroundColor,
    this.shadow,
    this.textColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
          borderRadius:
              //  BorderRadius.circular(22),
              BorderRadius.only(
            bottomRight: Radius.circular(12),
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: backgroundColor ?? AppColors.sendMessageColor.withOpacity(0.8),
          boxShadow: [
            BoxShadow(
                blurRadius: 15,
                color: shadow,
                offset: Offset(0, 0),
                spreadRadius: 1),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
