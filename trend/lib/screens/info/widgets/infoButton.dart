import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:trend/theme/app_colors.dart';

class InfoButton extends StatelessWidget {
  const InfoButton(
      {Key key,
      this.title,
      this.icon,
      this.backgroundColor,
      @required this.onTap,
      this.shadow,
      this.iconBackgroundColor,
      this.iconColor,
      this.rounded})
      : super(key: key);

  final String title;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;
  final Color backgroundColor;
  final bool shadow;
  final bool rounded;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).cardColor,
        boxShadow: shadow
            ? [
                BoxShadow(
                  offset: Offset(0.00, 1.00),
                  color: Color(0xff000000).withOpacity(0.10),
                  blurRadius: 15,
                ),
              ]
            : null,
        borderRadius: shadow ? BorderRadius.circular(12.00) : null,
      ),
      child: RawMaterialButton(
        fillColor: backgroundColor ?? Theme.of(context).cardColor,
        onPressed: onTap,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius:
                rounded ? BorderRadius.circular(12.00) : BorderRadius.zero),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 13),
          width: double.infinity,
          decoration: BoxDecoration(
              // color: backgroundColor ?? Theme.of(context).cardColor,
              // boxShadow: shadow
              //     ? [
              //         BoxShadow(
              //           offset: Offset(0.00, 1.00),
              //           color: Colors.black.withOpacity(0.10),
              //           blurRadius: 15,
              //         ),
              //       ]
              //     : null,
              // borderRadius: shadow ? BorderRadius.circular(12.00) : null,
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 37.00,
                width: 37.00,
                decoration: BoxDecoration(
                  color: iconBackgroundColor ??
                      AppColors.primaryColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 16,
                  color: iconColor ?? Theme.of(context).iconTheme.color,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 25),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${title ?? ''}',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.bold,
                          // fontSize: 16,
                        ),
                  ),
                ),
              ),
              Icon(
                Feather.chevron_right,
                size: 16,
                color: AppColors.iconDarkColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
