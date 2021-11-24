import 'package:flutter/material.dart';
import 'package:trend/screens/home/widgets/carousel_widget.dart';
import 'package:trend/screens/home/widgets/custome_sliver.dart';
import 'package:trend/screens/home/widgets/logoCard.dart';
import 'package:trend/screens/home/widgets/project_card.dart';
import 'package:trend/theme/app_colors.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        slivers: [
          SliverPersistentHeader(
            delegate: CustomSliver(),
            floating: true,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: CarouselWidget(),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 40,
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 35, top: 10, bottom: 10),
                    child: Text(
                      'Appplications',
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                          fontSize: 13,
                          letterSpacing: 0,
                          color: AppColors.darkTextColor,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  //  ListView.builder(
                  //   itemCount: 10,
                  //   scrollDirection: Axis.horizontal,
                  //   itemBuilder: (context, index) => Padding(
                  //     padding:
                  //         const EdgeInsets.only(left: 35, top: 10, bottom: 10),
                  //     child: Text(
                  //       'Facebook',
                  //       style: Theme.of(context).textTheme.subtitle2.copyWith(
                  //           fontSize: 13,
                  //           letterSpacing: 0,
                  //           color: index == 0
                  //              ? AppColors.darkTextColor
                  //               : AppColors.lightTextColor,
                  //           fontWeight: FontWeight.w500),
                  //     ),
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: MediaQuery.of(context).size.height * 0.50,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: ProCard(
                        backgroundColor: Color(0xffedb79f),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 40,
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 35, top: 10, bottom: 10),
                    child: Text(
                      'Logos',
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                          fontSize: 13,
                          letterSpacing: 0,
                          color: AppColors.darkTextColor,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: MediaQuery.of(context).size.height * 0.31,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: LogoCard(
                          backgroundColor: Colors.lightBlue,
                        )),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
