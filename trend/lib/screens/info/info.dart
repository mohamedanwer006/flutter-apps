import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:trend/screens/info/widgets/infoButton.dart';
import 'package:trend/utils/assets.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            stretch: true,
            expandedHeight: 200,
            // pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground,
                // StretchMode.blurBackground,
              ],
              centerTitle: false,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    Assets.trenCover,
                    fit: BoxFit.cover,
                  ),
                  // const DecoratedBox(
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       begin: Alignment(0.0, 0.5),
                  //       end: Alignment(0.0, 0.0),
                  //       colors: <Color>[
                  //         Color(0x60000000),
                  //         Color(0x00000000),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27, vertical: 14),
                  child: new Container(
                    height: 200.00,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.00, 1.00),
                          color: Color(0xff000000).withOpacity(0.10),
                          blurRadius: 15,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12.00),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   'Follow us in social media',
                        // ),
                        InfoButton(
                          onTap: () {},
                          title: 'Facebook',
                          shadow: false,
                          rounded: false,
                          icon: Feather.facebook,
                          iconColor: Colors.white,
                          iconBackgroundColor: Color(0xFF4267B2),
                        ),
                        InfoButton(
                          onTap: () {},
                          title: 'Twitter',
                          shadow: false,
                          rounded: false,
                          icon: Feather.twitter,
                          iconColor: Colors.white,
                          iconBackgroundColor: Color(0xFF1DA1F2),
                        ),
                        InfoButton(
                            onTap: () {},
                            title: 'Instagram',
                            shadow: false,
                            rounded: false,
                            icon: Feather.instagram,
                            iconColor: Colors.white,
                            iconBackgroundColor: Color(0xFFE1306C)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 33, horizontal: 27),
                  child: InfoButton(
                    onTap: () {},
                    shadow: true,
                    rounded: true,
                    icon: Feather.phone,
                    iconColor: Colors.white,
                    iconBackgroundColor: Color(0xff4AC959),
                    title: 'whats up',
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 300,
                  width: double.infinity,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
