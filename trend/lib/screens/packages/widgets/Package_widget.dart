import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:trend/theme/app_colors.dart';

class PackageCard extends StatelessWidget {
  final List<String> infoText = ['8 Posts', '2 Promotional', '1200 views'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 57.0, top: 25, right: 23),
      child: Container(
        height: 180.00,
        width: 300.00,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.00, 1.00),
              color: Color(0xff000000).withOpacity(0.09),
              blurRadius: 15,
            ),
          ],
          borderRadius: BorderRadius.circular(26.00),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildIcon(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Pack name',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 19),
                    ),
                  ),
                ],
              ),
              _buildPrice(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...infoText
                            .map((e) => _buildInfo(text: e, context: context))
                            .toList()
                      ]),
                  _buildConatctButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildPrice(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '1996 EGP',
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationStyle: TextDecorationStyle.solid,
              decorationThickness: 2.5,
              letterSpacing: 1,
              fontSize: 19),
        ),
        Text(
          '5656 EGP',
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              letterSpacing: 1,
              fontSize: 19),
        ),
      ],
    );
  }

  Container _buildConatctButton() {
    return Container(
      height: 37.00,
      width: 84.00,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        border: Border.all(
          width: 2.5,
          color: Color(0xffff4500),
        ),
        borderRadius: BorderRadius.circular(12.00),
      ),
      child: Center(
          child: Text(
        '5656 EGP',
        style: TextStyle(fontSize: 12, color: AppColors.darkTextColor),
      )),
    );
  }

  Row _buildInfo({String text, @required BuildContext context}) {
    return Row(
      children: [
        Container(
          height: 5.00,
          width: 5.00,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '$text',
          ),
        ),
      ],
    );
  }

  Widget _buildIcon() {
    return Container(
      height: 30.00,
      width: 30.00,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
              offset: Offset(0.00, 0.00),
              color: AppColors.primaryColor.withOpacity(0.1),
              blurRadius: 25,
              spreadRadius: 0),
        ],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          Feather.anchor,
          size: 16,
          color: AppColors.iconActiveColor,
        ),
      ),
    );
  }
}
