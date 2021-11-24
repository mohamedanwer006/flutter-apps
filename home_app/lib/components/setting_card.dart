import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:home_app/theme/theme_changer.dart';
import 'package:home_app/utils/utilities.dart';

class SettingCard extends StatefulWidget {
  final String image;
  final String title;
  final Widget trailing;
  final VoidCallback onTap;
  const SettingCard({
    Key key,
    this.image,
    this.title,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  _SettingCardState createState() => _SettingCardState();
}

class _SettingCardState extends State<SettingCard> {
  @override
  Widget build(BuildContext context) {
    return 
    Consumer<ThemeChanger>(
      builder: (context, theme, child) =>
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        child: Card(
          elevation: 0,
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenWidth(context, 15))),
          child: Container(
              height: 70,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth(context, 15)),
              ),
              child: ListTile(
                onTap: widget.onTap,
                leading: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    // height: 65,
                    width: 30,
                    child: Center(
                      //#464646
                      child: Image.asset(
                      widget.image,
                      scale: 1.2,
                    )),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: widget.trailing,
                ),
              )),
        ),
      ),
    );
  }
}
