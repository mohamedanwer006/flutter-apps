import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trend/screens/packages/widgets/Package_widget.dart';
import 'package:trend/screens/packages/widgets/swipe.dart';
import 'package:trend/theme/app_colors.dart';

class PackagesPage extends StatefulWidget {
  @override
  _PackagesPageState createState() => _PackagesPageState();
}

class _PackagesPageState extends State<PackagesPage>
    with SingleTickerProviderStateMixin {
  final List<String> tabs = [
    'Facebook social Pack',
    'Design',
    'Design',
    'Design',
    'Design',
    'Design',
  ];
  TabController controller;
  ValueNotifier<int> val = ValueNotifier(0);
  ValueListenable f;

  @override
  void initState() {
    super.initState();
    controller =
        TabController(vsync: this, length: tabs.length, initialIndex: 0);

    controller.addListener(() {
      val.value = controller.index;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            title: Text(
              'Our Prices',
              style: TextStyle(color: AppColors.darkTextColor),
            ),
            centerTitle: false,
            floating: true,
            pinned: true,
            stretch: true,
            expandedHeight: 125,
            primary: true,
            snap: false,
            backgroundColor: AppColors.backgroundColor,
            bottom: TabBar(
              indicatorPadding: EdgeInsets.zero,
              labelColor: AppColors.darkTextColor,
              unselectedLabelColor: AppColors.lightTextColor,
              controller: controller,
              dragStartBehavior: DragStartBehavior.start,
              labelPadding: EdgeInsets.symmetric(horizontal: 20),
              labelStyle: Theme.of(context).textTheme.subtitle2.copyWith(
                    fontSize: 15,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w900,
                    color: AppColors.darkTextColor,
                  ),
              unselectedLabelStyle: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(
                      fontSize: 15,
                      letterSpacing: 0,
                      color: AppColors.lightTextColor,
                      fontWeight: FontWeight.w500),
              indicator: UnderlineTabIndicator(
                insets: EdgeInsets.zero,
                borderSide: BorderSide.none,
              ),
              tabs: tabs
                  .map(
                    (e) => Padding(
                      padding:
                          const EdgeInsets.only(left: 0, top: 0, bottom: 0),
                      child: Text(
                        e,
                      ),
                    ),
                  )
                  .toList(),
              isScrollable: true,
              onTap: (value) {
                print(value);
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => SwipeDetector(
                      onSwipe: (swipe) {
                        if (swipe == Swipe.right) {
                          if (val.value < 5) {
                            controller.animateTo(val.value + 1);
                          } else {
                            //nothing
                          }
                        } else if (swipe == Swipe.left) {
                          if (val.value > 0) {
                            controller.animateTo(val.value - 1);
                          } else {
                            //nothing
                          }
                        } else {
                          //nothing
                        }
                      },
                      child: PackageCard(),
                    ),
                childCount: 5),
          ),
        ],
      ),
    );
  }
}
