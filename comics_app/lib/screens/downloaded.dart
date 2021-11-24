import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comics_app/components/custom_appbar.dart';
import 'package:comics_app/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Downloaded extends StatefulWidget {
  @override
  _DownloadedState createState() => _DownloadedState();
}

class _DownloadedState extends State<Downloaded>{
  double width, height;
  FirebaseServices _firebaseServices = FirebaseServices();
  FirebaseUser currentUser;
  Future<List<DocumentSnapshot>> documentSnapshot;
  void getCurrentUser() async {
   await _firebaseServices.getCurrentUser().then((user){
     setState(() {
       currentUser = user;
     });
   }).catchError((e){});

  }
 getPosts(){
    Future futurePosts = _firebaseServices.retrieveUserFavPosts(currentUser);
    setState(() {
      documentSnapshot = futurePosts;
    });
    }

  @override
  void initState() {
    getPosts();
    super.initState();
    getCurrentUser();
    getPosts();
  }
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: CustomAppBar(
              imgUrl: currentUser != null ? currentUser.photoUrl:null,
            ),
          ),
          Expanded(
            child: FutureBuilder(
                    future: documentSnapshot,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
            itemCount: snapshot.data.length,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,),
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: height * 0.30,
                  width: width * 0.35,
                  color: Colors.blueGrey,
                  child: getImage(context,snapshot.data[(snapshot.data.length-1)-index]['imgUrl']),
                ),
              );
            }));
                      } else {
                        return Container(
                          height: height * 0.30,
                          width: width * 0.35,
                          color: Colors.blueGrey,
                          // child: LinearProgressIndicator(),
                        );
                      }
                    }),
          ),
        ],
      ),
    );
  }
  
Widget getImage(context, String url) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) {
        return Center(child: CircularProgressIndicator());
      },
      errorWidget: (context, url, error) {
        print(error.toString());
        return Icon(Icons.error);
      },
      fadeInDuration: Duration(seconds: 1),
      fadeOutDuration: Duration(seconds: 1),
    );
  }
}

