import 'package:flutter/material.dart';
import 'package:trend/theme/app_colors.dart';

class CustomSliver extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // print('offset:$shrinkOffset');
    return Material(
      shadowColor: AppColors.primaryColor.withOpacity(0.5),
      elevation: shrinkOffset > 60 ? 10 : 0,
      child: Container(
        height: maxExtent,
        alignment: Alignment.bottomCenter,
        color: AppColors.primaryColor
            .withOpacity((shrinkOffset / maxExtent) * 0.8),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: shrinkOffset < 60
              ? Text.rich(
                  TextSpan(
                      text: 'making ',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'your\n',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: AppColors.primaryColor),
                        ),
                        TextSpan(
                          text: 'brand shine',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Colors.black),
                        ),
                      ]),
                )
              : Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Trend',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: shrinkOffset < 60 ? Colors.black : Colors.white),
                  ),
                ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  double get minExtent => 70;

  @override
  double get maxExtent => 150;
}
