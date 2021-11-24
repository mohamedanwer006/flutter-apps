import 'package:comics_app/screens/downloaded.dart';
import 'package:comics_app/screens/search_screen.dart';
import 'package:comics_app/screens/images_screen.dart';
import 'package:comics_app/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {

  void navigationTapped(int page) {
    //Animating Page
    setState(() {
      this._selectedIndex = page;
    });
  }
  void onPageChanged(int page) {
    setState(() {
      this._selectedIndex = page;
    });
  }
  var _selectedIndex=0;
  final List listOfWidget = <Widget>[
    ImagesScreen(),
    SearchScreen(),
    Downloaded(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(
        children: listOfWidget,
        index: _selectedIndex,
      ),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.transparent,
          selectedIndex: _selectedIndex,
          showElevation: true,
          onItemSelected:navigationTapped,
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: Colors.red,
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
            activeColor: Colors.deepOrangeAccent
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
            activeColor: Colors.pinkAccent
        ),
        BottomNavyBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            title: Text('Profile'),
            activeColor: Colors.white
        ),
      ],
    )
   );
  }
}


// import 'package:comics_app/screens/downloaded.dart';
// import 'package:comics_app/screens/search_screen.dart';
// import 'package:comics_app/screens/images_screen.dart';
// import 'package:comics_app/screens/profile.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:bottom_navy_bar/bottom_navy_bar.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// PageController pageController;


// class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
//   void navigationTapped(int page) {
//     //Animating Page
//     pageController.jumpToPage(page);
//   }
//   void onPageChanged(int page) {
//     setState(() {
//       this._selectedIndex = page;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     pageController = new PageController();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     pageController.dispose();
//   }

//   var _selectedIndex=0;

//   final List listOfWidget = <Widget>[
//     ImagesScreen(),
//     SearchScreen(),
//     Downloaded(),
//     Profile(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body:  new PageView(
//         children: listOfWidget,
//         controller: pageController,
//         physics: new BouncingScrollPhysics(),
//         onPageChanged: onPageChanged,
//       ),
//         bottomNavigationBar: BottomNavyBar(
//           backgroundColor: Colors.transparent,
//           selectedIndex: _selectedIndex,
//           showElevation: true,
//           onItemSelected:navigationTapped,
//       items: [
//         BottomNavyBarItem(
//           icon: Icon(Icons.home),
//           title: Text('Home'),
//           activeColor: Colors.red,
//         ),
//         BottomNavyBarItem(
//             icon: Icon(Icons.search),
//             title: Text('Search'),
//             activeColor: Colors.deepOrangeAccent
//         ),
//         BottomNavyBarItem(
//             icon: Icon(Icons.favorite),
//             title: Text('Favorites'),
//             activeColor: Colors.pinkAccent
//         ),
//         BottomNavyBarItem(
//             icon: Icon(CupertinoIcons.profile_circled),
//             title: Text('Profile'),
//             activeColor: Colors.white
//         ),
//       ],
//     )
//     );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }


