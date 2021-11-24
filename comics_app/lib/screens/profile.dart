import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comics_app/models/user.dart';
import 'package:comics_app/screens/home_screen.dart';
import 'package:comics_app/screens/upload_photo_screen.dart';
import 'package:comics_app/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:comics_app/components/profile_btn.dart';
import 'package:comics_app/components/user_images_card.dart';
import 'package:comics_app/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:undraw/undraw.dart';

class Profile extends StatefulWidget {
  final User user;
  Profile({this.user});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  FirebaseServices _firebaseServices = FirebaseServices();
  FirebaseUser currentUser;
  Future<List<DocumentSnapshot>> documentSnapshot;
  double height, width;
  File _image;

  TextStyle _textStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 22,
  );
  TextStyle _nameStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );

  getCurrentUser() async {
    var val =await _firebaseServices.getCurrentUser();
      setState(() {
        currentUser = val;
        // print(currentUser);
      });
    // await _firebaseServices.getCurrentUser().then((val) {
    //   setState(() {
    //     currentUser = val;
    //     // print(currentUser);
    //   });
    // }).catchError((e) {});
  }

  Future<File> getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }

  void editProfilePic() {
    getImage().then((image) {
      setState(() {
        _image = image;
      });
      _firebaseServices.addProfilePicToStorage(image).then((url) {
        _firebaseServices.updatePhoto(url, currentUser.uid).then((val) {
          Scaffold.of(context).initState();
        });
      }).catchError((e) {});
    }).catchError((e) {});
  }

  void onSettingsPress() {
    //todo onSettingsPress
    print('Settings is press');
  }

  // getPosts() async {
  //   var user = await _firebaseServices.getCurrentUser();
  //   print('get posts test');
  //   print(user.uid);
  //   documentSnapshot = _firebaseServices.retrieveUserPosts(user.uid);
  //   var data = await documentSnapshot;
  //   var length = data.length;
  //   print(length);
  // }
  void signOut() {
    _firebaseServices.signOut().then((val) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    }).catchError((e) {});
  }

  void uploadTemp() {
    getImage().then((image) {
      if (image != null) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UploadPhotoScreen(image: image)));
      }
    }).catchError((e) {
      print(e);
    });
  }

  Widget background() {
    return UnDraw(
      color: Colors.blueGrey,
      illustration: UnDrawIllustration.game_day,
      placeholder: Container(),
    );
  }

  @override
  void initState() {
    super.initState();

    getCurrentUser();
//     getPosts();
//    getProduct();
  }
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    //check if there is user
    return currentUser != null ? profile() : loginWidget();
  }

//  user != null ? profile() : loginWidget();

  ///profile screen if there is user
  Widget profile() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              UserImagesCard(
                onEditPress: editProfilePic,
                image: _image,
                imgUrl: currentUser.photoUrl,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${currentUser.displayName}',
                      style: _nameStyle,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.blue,
                      size: 20,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ProfileButtons(
                  signOutPress: signOut,
                  settingsPress: onSettingsPress,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              line(),
              SizedBox(
                height: 15,
              ),
              Container(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Uploded Templates',
                      style: _textStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: MaterialButton(
                        onPressed: uploadTemp,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.pinkAccent,
                        height: 35,
                        minWidth: 66,
                        elevation: 1,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.cloud_upload),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Upload'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              line(),
              Container(
                width: width,
              ),
              SizedBox(
                height: 10,
              ),
            ]),
          ),
//          SliverGrid(
//            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//              crossAxisCount: 3,
//              crossAxisSpacing: 0,
//              childAspectRatio: 0.75,
//              mainAxisSpacing: 1,
//            ),
//            delegate: SliverChildBuilderDelegate(
//                    (context, index) {
//                  return Padding(
//                    padding: const EdgeInsets.all(2.0),
//                    child: Container(
//                      height: height * 0.30,
//                      width: width * 0.35,
//                      color: Colors.blueGrey,
//                    ),
//                  );
//                },
//                childCount: 10
//            ),
//          ),
          imageWidget()
        ],
      ),
    );
  }

  ///login screen if there is not user
  Widget loginWidget() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 15,
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              alignment: Alignment.topCenter,
              child: background()),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height*0.6,
          left:(MediaQuery.of(context).size.width*0.5)-66,
          child: Container(
            alignment: Alignment.center,
            width: 150,
            // color: Colors.red,
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.lightBlue,
              height: 35,
              minWidth: 66,
              elevation: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.input),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Sign In'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  ///to create line between widget
  Widget line() {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22),
      child: Container(
        width: width,
        height: 1,
        color: Colors.white.withOpacity(0.2),
      ),
    );
  }

  ///for show user posts in profile screen
  Widget imageWidget() {
    ///work
    return StreamBuilder(
      stream: Firestore.instance
          .collection('users')
          .document(currentUser.uid)
          .collection('posts')
          .snapshots(),
      builder: (context, snapshot) {
        print('inside snapshot:');
        if (snapshot.hasData) {
          return SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 0,
              childAspectRatio: 0.75,
              mainAxisSpacing: 1,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: height * 0.30,
                  width: width * 0.35,
                  color: Colors.blueGrey,
                  child: !snapshot.hasData
                      ? LinearProgressIndicator()
                      : cachedImage(
                          context, snapshot.data.documents[(snapshot.data.documents.length-1)-index]['imgUrl']),
                ),
              );
            },
                childCount:
                     snapshot.data.documents.length
                    ), //todo
          );
        } else {
          return SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: height * 0.30,
                width: width * 0.35,
                color: Colors.blueGrey,
                // child: LinearProgressIndicator(),
              ),
            ]),
          );
        }
      },
    );
  }

  Widget cachedImage(context, String url) {
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
  ///for test
//  Widget imageWidget2() {
//    return FutureBuilder(
//      future: documentSnapshot,
//      builder: (context, snapshot) {
//        print('inside snapshot' + snapshot.toString());
//        return SliverGrid(
//          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 3,
//            crossAxisSpacing: 0,
//            childAspectRatio: 0.75,
//            mainAxisSpacing: 1,
//          ),
//          delegate: SliverChildBuilderDelegate((context, index) {
//            return Padding(
//              padding: const EdgeInsets.all(2.0),
//              child: Container(
//                height: height * 0.30,
//                width: width * 0.35,
//                color: Colors.blueGrey,
//                child: cachedImage(
//                    context,snapshot.hasData?snapshot.data[index].data['imgUrl']:''),
//              ),
//            );
//          }, childCount:snapshot.hasData? snapshot.data.length:0),
//        );
//      },
//    );
//  }

////  Widget img(){
////    return SliverGrid(
////      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
////        crossAxisCount: 3,
////        crossAxisSpacing: 0,
////        childAspectRatio: 0.75,
////        mainAxisSpacing: 1,
////      ),
////      delegate: SliverChildBuilderDelegate((context, index) {
////        return Padding(
////          padding: const EdgeInsets.all(2.0),
////          child: Container(
////            height: height * 0.30,
////            width: width * 0.35,
////            color: Colors.blueGrey,
////            child: cachedImage(
////                context, documentSnapshot[index].data['imgUrl']),
////          ),
////        );
////      }, childCount: documentSnapshot.length),
////    );
////  }
////getProduct()async{
////    print("inside get product");
////    print('test');
////    var data= await _firebaseServices.retrieveUserPosts('yOOnrCmuHDhD66JkZek33X1kKrn2');
////    setState(() {
////      documentSnapshot = data;
////    });
////}
//
//
//  Widget imageWidget3() {
//    return StreamBuilder(
//      stream: Firestore.instance
//          .collection('users')
//          .document(currentUser.uid)
//          .collection('posts')
//          .snapshots(),
//      builder: (context, snapshot) {
//        print('inside snapshot');
//        return SliverGrid(
//          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 3,
//            crossAxisSpacing: 0,
//            childAspectRatio: 0.75,
//            mainAxisSpacing: 1,
//          ),
//          delegate: SliverChildListDelegate(
//            data(snapshot),
//          ),
//        );
//      },
//    );
//  }
//
//  List<Widget>data(AsyncSnapshot snapshot) {
//    if(!snapshot.hasData)return [LinearProgressIndicator(),LinearProgressIndicator()];
//    return  snapshot.data.documents
//        .map((document) => Padding(
//              padding: const EdgeInsets.all(2.0),
//              child: Container(
//                height: height * 0.30,
//                width: width * 0.35,
//                color: Colors.blueGrey,
//                child: cachedImage(context, document['imgUrl']),
//              ),
//            ))
//        .toList();
//  }

//  Widget imagesLoad() {
//    return StreamBuilder(
//      stream:  Firestore.instance.collection('users')
//          .document(currentUser.uid)
//          .collection('posts')
//          .snapshots(),
//      builder: (context,snapshot){
//        if (!snapshot.hasData) return LinearProgressIndicator();
//        return GridView.builder(
//          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 3
//          ),
//          itemCount: 3,
//          itemBuilder: (context,index){
//            return Padding(
//              padding: const EdgeInsets.all(2.0),
//              child: Container(
//                height: height * 0.30,
//                width: width * 0.35,
//                color: Colors.blueGrey,
//                child:
//                cachedImage(context, snapshot.data.documents[index]['imgUrl']),
//              ),
//            );
//          },
//        );
//      },
//    );
//
//  }
//
//  Widget wid(context,DocumentSnapshot document){
//    return Padding(
//    padding: const EdgeInsets.all(2.0),
//    child: Container(
//      height: height * 0.30,
//      width: width * 0.35,
//      color: Colors.blueGrey,
//      child:
//      cachedImage(context, document.data['imgUrl']),
//    ),
//  );
//  }
//
//
//  Widget stream(){
//    return StreamBuilder<QuerySnapshot>(
//      stream:Firestore.instance.collection('users')
//          .document('yOOnrCmuHDhD66JkZek33X1kKrn2')
//          .collection('posts').snapshots(),
//      builder: (context,snapshot){
//        if (!snapshot.hasData) return LinearProgressIndicator();
//
//      },
//    );
//  }
}
