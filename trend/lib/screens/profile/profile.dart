import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:trend/screens/profile/widgets/profile_button.dart';
import 'package:trend/screens/sign_in/sign_in.dart';
import 'package:trend/services/auth/auth_provider.dart';
import 'package:trend/theme/app_colors.dart';
import 'package:trend/widgets/custome_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthServices>(builder: (context, auth, child) {
      var currentUser = auth.currentUser;
      if (auth.currentUser == null) {
        return buildSignInButton(context);
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Profile',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.black),
            ),
          ),
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 22.0, left: 27, bottom: 12),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                // border:
                                //     Border.all(width: 2.5, color: AppColors.primaryColor),
                                shape: BoxShape.circle,
                                color: AppColors.cardColor,
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    'https://jamalouki.net/uploads/richTextEditor/default_richTextEditor/bf9/054b5571a5a58bc630d10a58dead6090.jpeg',
                                    scale: 1,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 27, bottom: 5),
                            child: Container(
                                child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: 'Karime ahmed\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                              ),
                              TextSpan(
                                text: '${currentUser.email}',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ]))),
                          ),
                          Container(
                            height: 4.00,
                            width: double.infinity,
                            padding: EdgeInsets.only(bottom: 4),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.00, 1.00),
                                  color:
                                      AppColors.primaryColor.withOpacity(0.50),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 27, vertical: 14),
                      child: new Container(
                        height: 210.00,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ProfileButton(
                              onTap: () {},
                              title: 'All projects',
                              shadow: false,
                              icon: Feather.folder,
                            ),
                            ProfileButton(
                              onTap: () {},
                              title: 'In progress',
                              shadow: false,
                              icon: Feather.activity,
                            ),
                            ProfileButton(
                              onTap: () {},
                              title: 'Account',
                              shadow: false,
                              icon: Feather.user,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 33, horizontal: 27),
                      child: ProfileButton(
                        onTap: () {
                          print('logOut');
                          Provider.of<AuthServices>(context, listen: false)
                              .signOut();
                        },
                        shadow: true,
                        icon: Feather.log_out,
                        title: 'Log out',
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(
                    height: 100,
                  )
                ]),
              )
            ],
          ),
        );
      }
    });
  }

  Widget buildSignInButton(BuildContext context) {
    return Center(
      child: RectButton(
        text: 'Sign in',
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SignIn(),
          ));
        },
      ),
    );
  }
}
