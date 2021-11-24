import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:home_app/theme/theme_changer.dart';
import 'package:home_app/utils/utilities.dart';

class ListCollectionCard extends StatefulWidget {
  final String image;
  final String title;
  final Widget trailing;
  final VoidCallback onTap;
  final bool selected;
  const ListCollectionCard({
    Key key,
    this.image,
    this.title,
    this.trailing,
    this.onTap,
    this.selected,
  }) : super(key: key);

  @override
  _SettingCardState createState() => _SettingCardState();
}

class _SettingCardState extends State<ListCollectionCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(
      builder: (context, theme, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        child: Card(
          elevation: 0,
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenWidth(context, 15))),
          child: Container(
              height: 80,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  screenWidth(context, 15),
                ),
              ),
              child: ListTile(
                onTap: widget.onTap,
                leading: Container(
                  // height: 100,
                  width: 60,
                  child: Center(
                    child: widget.image != null
                        ? Image.network(
                            widget.image,
                            fit: BoxFit.fill,
                          )
                        : Icon(Icons.collections),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
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
