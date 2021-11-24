import 'package:flutter/material.dart';
import 'package:portfolio/screens/about.dart';
import 'package:portfolio/screens/contact.dart';
import 'package:portfolio/screens/home.dart';
import 'package:portfolio/screens/skills.dart';
import 'package:portfolio/utils/theme_changer.dart';
import 'package:portfolio/utils/themes.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<Widget> listPages = [
    Home(),
    About(),
    SkillsScreen(),
    ContactScreen()
  ];

  PageController _pageController = PageController();
  TabController _tabController;
  bool bulbColor = true;

  ///use this as flag to check if user tab and not scroll throw pages
  ///because the highlight color on taps doesn't make sense
  bool tab = false;
  bool elevation = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: listPages.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _themeChange = Provider.of<ThemeChanger>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: elevation
            ? Theme.of(context).appBarTheme.color
            : Colors.transparent,
        elevation: elevation ? 4 : 0,
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
        
              splashColor: Theme.of(context).buttonColor,
              hoverColor:Theme.of(context).buttonColor.withOpacity(0.2) ,
                icon: Icon(
                  Icons.lightbulb_outline,
                  size: 20,
                  color: bulbColor ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  bulbColor = !bulbColor;
                  (_themeChange.getTheme() == myDark)
                      ? _themeChange.setTheme(mylight)
                      : _themeChange.setTheme(myDark);
                }),
          )
        ],
        title: TabBar(
          onTap: (index) {
            tab = true;
            _pageController.animateToPage(index,
                duration: Duration(
                  milliseconds: 1000,
                ),
                curve: Curves.linear);
          },
          controller: _tabController,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              child: Text(
                'Home',
              ),
            ),
          
            Tab(
              child: Text(
                'About',
              ),
            ),
            Tab(
              child: Text(
                'Skills',
              ),
            ),
            //   Tab(
            //   child: Text(
            //     'Portfolio',
            //   ),
            // ),
            Tab(
              child: Text(
                'Contact',
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            shadowColor: Colors.redAccent,
            elevation: 2.5,
            child: Container(
              width: 200,
              // color: Colors.red,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  tileMode: TileMode.repeated,
                  colors: [
                    Colors.redAccent,
                    Colors.pinkAccent
                    // Colors.tealAccent
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  "M",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 33,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        primary: true,
      ),

      body: PageView.custom(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        childrenDelegate: SliverChildBuilderDelegate(

           (BuildContext context, int index){
             return listPages[index] ;
           }
        ),
        onPageChanged:(index) {
          //todo:avoid taps animation error when tap
          setState(() {
            (index != 0) ? elevation = true : elevation = false;
            // tab ? tab = false : _tabController.index = index;
            if(tab){
              tab=false;
            }else{
             if(index>2){
               _tabController.index=index;
             }
            }
          });
        },
      ),
      // body: PageView(
      //   controller: _pageController,
      //   physics: BouncingScrollPhysics(),
      //   children: listPages,
      //   scrollDirection: Axis.vertical,
      //   onPageChanged: (index) {
      //     setState(() {
      //       (index != 0) ? elevation = true : elevation = false;
      //       // tab ? tab = false : _tabController.index = index;
      //       if(tab){
      //         tab=false;
      //       }else{
      //        if(index>2){
      //          _tabController.index=index;
      //        }
      //       }
      //     });
      //   },
      // ),
    );
  }
}
