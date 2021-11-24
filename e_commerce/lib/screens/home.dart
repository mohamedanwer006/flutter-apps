import 'dart:convert';

import 'package:e_commerce/components/catagories.dart';
import 'package:e_commerce/components/products.dart';
import 'package:e_commerce/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart())))
        ],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Container(
          alignment: Alignment.center,
          // color: Colors.black12,
          child: TextField(
            autofocus: false,
            decoration: InputDecoration( 
              isDense: true,
              alignLabelWithHint: true,
              focusedBorder: InputBorder.none,
              enabledBorder:InputBorder.none ,
              disabledBorder:InputBorder.none,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              hintText: 'search',
              fillColor: Colors.black12
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blueGrey,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://coverfiles.alphacoders.com/461/46177.jpg'),
                      fit: BoxFit.cover)),
              accountName: Text('Test Test'),
              accountEmail: Text('test@test.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    //  'https://i.guim.co.uk/img/media/e4eaca6520eccc167a5c8afc9c67651ce01f4365/0_0_5568_3341/master/5568.jpg?width=1920&quality=85&auto=format&fit=max&s=90f48825a694acf5b28d6619925729ef'
                    'https://cdn1.i-scmp.com/sites/default/files/styles/768x768/public/images/methode/2017/04/02/77d329a2-173e-11e7-8424-32eaba91fe03_1280x720_091301.jpg?itok=ChNDG5Uz'),
              ),
            ),
            InkWell(
                child: ListTile(
              title: Text(
                'Home Page',
              ),
              leading: Icon(Icons.home),
            )),
            InkWell(
                child: ListTile(
              title: Text(
                'My Account',
              ),
              leading: Icon(Icons.person),
            )),
            InkWell(
                child: ListTile(
              title: Text(
                'My Orders',
              ),
              leading: Icon(Icons.shopping_basket),
            )),
            InkWell(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart())),
                child: ListTile(
                  title: Text(
                    'My Cart',
                  ),
                  leading: Icon(Icons.category),
                )),
            InkWell(
                child: ListTile(
              title: Text(
                'Favourits',
              ),
              leading: Icon(Icons.favorite),
            )),
            InkWell(
                child: ListTile(
              title: Text(
                'Settings',
              ),
              leading: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
            )),
            InkWell(
                child: ListTile(
              title: Text(
                'About',
              ),
              leading: Icon(
                Icons.help,
                color: Colors.green,
              ),
            )),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            child: Carousel(
              images: [
                AssetImage('assets/images/m1.jpeg'),
                AssetImage('assets/images/w4.jpeg'),
                AssetImage('assets/images/w3.jpeg'),
                AssetImage('assets/images/w3.jpeg'),
                AssetImage('assets/images/w1.jpeg'),
              ],
              // autoplay: false,
              boxFit: BoxFit.cover,
              animationCurve: Curves.linear,
              dotSize: 5,
              indicatorBgPadding: 2,
              dotBgColor: Colors.transparent,
              dotVerticalPadding: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9),
            child: Text('Catagoris'),
          ),
          CatagorieListView(),
          Padding(
            padding: const EdgeInsets.all(9),
            child: Text('Recent Products'),
          ),
          Container(height: 320, child: Products()),
        ],
      ),
    );
  }
}

// fun(){
//   showModalBottomSheet(context: context,builder: (context) => BottomSheet(
//               onClosing: (){},
//                builder:(context) => Column(
//               children: [
//                 Container(
//                   color: Colors.deepPurple,
//                   child: ListTile(
//                     title: Center(child: Text('Union Station',style: TextStyle(color: Colors.white),)),
//                     subtitle: Center(child: Text('sub title vdsdv data',style: TextStyle(color: Colors.white),)),
//                     trailing: CircleAvatar(
//                       backgroundColor: Colors.white,
//                       child: Icon(Icons.directions_car),
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                     title:Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Column(
//                           children: [
//                             Icon(Icons.phone),
//                             Text('data')
//                           ],
//                         ),Column(
//                           children: [
//                             Icon(Icons.not_interested),
//                             Text('data')
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Icon(Icons.screen_share),
//                             Text('data')
//                           ],
//                         ),
//                       ],
//                     ),

//                   ),
//                 ListTile(
//                     title: Text('sub title vdsdv data'),
//                     leading: Icon(Icons.pin_drop),
//                   ),
//                   ListTile(
//                     title: Text('sub title vdsdv data'),
//                     leading: Icon(Icons.open_in_new),
//                   ),
//                  ListTile(
//                     title: Text('sub title vdsdv data'),
//                     leading: Icon(Icons.link),
//                   ),
//                   ListTile(
//                     title: Text('0123456789'),
//                     leading: Icon(Icons.phone),
//                   ),

//               ],
//             ),
//             ),
//             );
// }
