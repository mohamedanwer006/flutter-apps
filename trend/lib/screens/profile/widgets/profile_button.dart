import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:trend/theme/app_colors.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton(
      {Key key,
      this.title,
      this.icon,
      this.backgroundColor,
      @required this.onTap,
      this.shadow})
      : super(key: key);

  final String title;
  final IconData icon;
  final Color backgroundColor;
  final bool shadow;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 13),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).cardColor,
          boxShadow: shadow
              ? [
                  BoxShadow(
                    offset: Offset(0.00, 1.00),
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 15,
                  ),
                ]
              : null,
          borderRadius: BorderRadius.circular(12.00),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 37.00,
              width: 37.00,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 16,
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
    );
  }
}
