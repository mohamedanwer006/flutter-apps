import 'package:flutter/material.dart';

import 'package:trend/theme/app_colors.dart';

class RectButton extends StatelessWidget {
  final Function onTap;
  final String text;
  const RectButton({
    Key key,
    @required this.onTap,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 200,
      child: Center(
        child: RawMaterialButton(
          onPressed: onTap,
          child: Center(
            child: Text(
              '$text',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ),
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          disabledElevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.primaryColor.withOpacity(0.8),
          boxShadow: [
            BoxShadow(
                blurRadius: 15,
                color: AppColors.primaryColor.withOpacity(0.4),
                offset: Offset(0, 3),
                spreadRadius: 0),
          ]),
    );
  }
}

class SignButton extends StatelessWidget {
  final Function onTap;
  final String text;
  const SignButton({
    Key key,
    @required this.onTap,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 18,
      ),
      child: Center(
        child: RawMaterialButton(
          onPressed: onTap,
          child: Center(
            child: Text('$text',
                style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w600)),
          ),
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          disabledElevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.primaryColor.withOpacity(0.8),
          boxShadow: [
            BoxShadow(
                blurRadius: 8,
                color: AppColors.primaryColor.withOpacity(0.4),
                offset: Offset(0, 3),
                spreadRadius: 0),
          ]),
    );
  }
}
