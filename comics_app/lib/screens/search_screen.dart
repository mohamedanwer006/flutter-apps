import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comics_app/services/firebase_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextStyle _textStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 18);

FirebaseServices _firebaseServices=FirebaseServices();
List<DocumentSnapshot> list;
search()async{
  print('inside serch');
  var data= await  _firebaseServices.search('mohamed salah');
  setState(() {
   list = data;
   print('hhhhhh'+list.toString()); 
  });
}
@override
  void initState() {
   search();
    super.initState();
  }
  var height;
  var width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: Icon(Icons.view_list),
          backgroundColor: Colors.transparent,
          title: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12)
            ),
            height: 70,
            child: InkWell(
              onTap: () {
                showSearch(context: context, delegate: SearchBar());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.search),
                  SizedBox(
                    width: 15,
                  ),
                  Text('Search'),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          )),
          body: Stack(
            
          ),
    );
  }
}

var searchText = [
  'هنيدي',
  'الزعامه',
  'هنيدي',
  'الزعامه',
  'المبي',
  'عادل امام',

];

String url = 'https://scontent-hbe1-1.xx.fbcdn.'
    'net/v/t1.0-9/44317403_693185707719648_1494449723367489536_n'
    '.jpg?_nc_cat=109&_nc_oc=AQnXPAbwXGswHwWG1rqD9F9UTMPkXft5'
    'FYpl_xSo-Rx1-xhxMHUsYhBdrN3kKfixNFg&_nc_ht=scontent-hbe1-1.'
    'xx&oh=7d7c87e1fecbae1b5bde9d7598c36221&oe=5DC0B828';

class SearchBar extends SearchDelegate {
FirebaseServices _firebaseServices=FirebaseServices();
  TextStyle _textStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 18);
  @override
  List<Widget> buildActions(BuildContext context) {
    return null;
  }
  @override
  Widget buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Text('ssss'),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color:Colors.white,fontSize: 22)),
        primaryColor: Colors.blueGrey.withOpacity(0.6),
        primaryIconTheme: theme.primaryIconTheme,
        primaryColorBrightness: theme.primaryColorBrightness,
        primaryTextTheme: theme.primaryTextTheme,
        textTheme: theme.textTheme.copyWith(
            title: theme.textTheme.title
                .copyWith(color: Colors.white)));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.black,
      child:Text('ssss')
    );
  }

  data(){
    return  ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: searchText.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2),
                child: ListTile(
                    leading: Container(
                      // width: width * 0.15,
                      // height: height * 0.18,
                      color: Colors.blueGrey,
                      child: CachedNetworkImage(
                        imageUrl: url,
                        fit: BoxFit.cover,
                        placeholder: (context, url) {
                          return Center(child: CircularProgressIndicator());
                        },
                        errorWidget: (context, url, error) {
                          print('mohamed test' + error.toString());
                          return Icon(Icons.error);
                        },
                      ),
                    ),
                    title: Text(
                      '${searchText[index]}',
                      style: _textStyle,
                    )),
              );
            },
          );
  }
}
