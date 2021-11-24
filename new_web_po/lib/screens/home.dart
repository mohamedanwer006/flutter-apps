import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_web_po/screens/about.dart';
import 'package:new_web_po/screens/contact.dart';
import 'package:new_web_po/screens/home_body.dart';
import 'package:new_web_po/screens/skills.dart';
import 'package:new_web_po/utils/responsive.dart';
import 'package:new_web_po/utils/theme_changer.dart';
import 'package:new_web_po/utils/themes.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = new ScrollController();
  TabController controller;
  bool bulbColor = true;
  bool elevation = false;
  bool animate =true;

  List<String> drawerList=[
    'Home 🏠',
    'About 🙋‍♂️',
    'Skills 💻',
    'Contact 📱'
  ];

  check() {
    _scrollController.addListener(() {
      if (_scrollController.offset >= 0 && _scrollController.offset < 700) {
        setState(() {
          controller.index = 0;
        });
      } else if (_scrollController.offset >= 700 &&
          _scrollController.offset < 1400) {
        setState(() {
          controller.index = 1;
        });
      } else if (_scrollController.offset >= 1400 &&
          _scrollController.offset < 2100) {
        setState(() {
          controller.index = 2;
        });
      } else if (_scrollController.offset >= 2100 &&
          _scrollController.offset < 2800) {
        setState(() {
          controller.index = 3;
        });
      } else {
        //*nothing
      }
      setState(() {
        if (_scrollController.offset <= 10)
          elevation = false;
        else
          elevation = true;
      });
    });
  }

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 2), (timer){
       setState(() {
      animate = !animate;
    });
    });
    setState(() {
      animate = !animate;
    });
    controller = TabController(length: 4, vsync: this, initialIndex: 0);
    check();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _themeChange = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: elevation
            ? Theme.of(context).appBarTheme.color
            : Colors.transparent,
        elevation: elevation ? 4 : 0,
        centerTitle: true,
        title: ResponsiveWidget.isLargeScreen(context)
            ? TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                controller: controller,
                isScrollable: true,
                onTap: (index) {
                  setState(() {
                    if (index == 0)
                      elevation = false;
                    else
                      elevation = true;
                  });

                  _scrollController.animateTo(700 * index.toDouble(),
                      duration: Duration(seconds: 1), curve: Curves.easeInOut);
                },
                tabs: <Widget>[
                  Tab(
                    child: Text('Home'),
                  ),
                  Tab(
                    child: Text('About'),
                  ),
                  Tab(
                    child: Text('Skills'),
                  ),
                  Tab(
                    child: Text('Contact'),
                  ),
                ],
              )
            : Container(),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                splashColor: Theme.of(context).buttonColor,
                hoverColor: Theme.of(context).buttonColor.withOpacity(0.2),
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
        leading: Builder(
            builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Material(
                      shadowColor: Colors.redAccent,
                      elevation: 2.5,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: 200,
                        
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            tileMode: TileMode.repeated,
                            colors: [Colors.redAccent, Colors.pinkAccent],
                          ),
                        ),
                        child: Center(
                          child:ResponsiveWidget.isLargeScreen(context)? Text(
                            "M",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 33,
                                color: Colors.white),
                          ):(animate?Icon(Icons.menu):Text(
                            "M",
                            style: Theme.of(context).textTheme.subhead
                          )),
                        ),
                      ),
                    ),
                  ),
                )),
      ),
      drawer: ResponsiveWidget.isLargeScreen(context)
          ? null
          : Drawer(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.only(top:35.0),
                child: ListView.builder(
                  itemCount: drawerList.length,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(5),
                  itemBuilder: (context,index){
                    return  ListTile(
                      onTap: () {
                       Navigator.of(context).pop();
                        _scrollController.animateTo(700 * index.toDouble(),
                        duration: Duration(seconds: 1), curve: Curves.easeInOut);
                      },
                      title: Center(child: Text('${drawerList[index]}',style: Theme.of(context).textTheme.subtitle,)),
                    );
                  },
                
                ),
              ),
            ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CustomScrollView(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                        alignment: Alignment.center,
                        height: 700,
                        child: HomeBody()),
                    Container(
                      height: 700,
                      child: About(),
                    ),
                    Container(
                      child: SkillsScreen(),
                      height: 700,
                    ),
                    Container(
                      height: 700,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ContactScreen(),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
