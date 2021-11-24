import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comics_app/edit_image/screen/story_create_screen.dart';
import 'package:comics_app/models/post.dart';
import 'package:comics_app/screens/see_all.dart';
import 'package:comics_app/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagesScreen extends StatefulWidget {
  @override
  _ImagesScreenState createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  FirebaseServices _firebaseServices = FirebaseServices();
  Future<List<DocumentSnapshot>> documentSnapshot;
  getPosts() async {
    Future futurePosts = _firebaseServices.retrieveUserPosts();
    setState(() {
      documentSnapshot = futurePosts;
    });
    // Future query = _firebaseServices.retrieveUserPosts(_user.uid);
    // setState(() {
    //   querySnapshot = query;
    // });
  }

  // getUser() async {
  //   var currentUser = await _firebaseServices.getCurrentUser();
  //   setState(() {
  //     _user = currentUser;
  //   });
  // }

  TextStyle _textStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 22,
  );
  TextStyle moreStyle = TextStyle(
      fontSize: 15, color: Colors.deepPurple, fontWeight: FontWeight.w300);
  TextStyle _appTitleStyle = TextStyle(
    fontSize: 25,
    color: Colors.blueGrey,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
  );
  double height, width;
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

  FirebaseUser currentUser;

  getCurrentUser() async {
    var val = await _firebaseServices.getCurrentUser();
    setState(() {
      currentUser = val;
      // print(currentUser);
    });
  }

  Post _post = Post();

  @override
  void initState() {
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
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                width: width,
                height: height * 0.15,
                color: Colors.transparent,
                child: Center(
                    child: Text(
                  'Comics Maker',
                  style: _appTitleStyle,
                )),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Recent',
                        style: _textStyle,
                      ),
                      FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'SEE ALL',
                              style: moreStyle,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                            )
                          ],
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SeeAll(
                                    title: 'Recent',
                                    documentSnapshot: documentSnapshot,
                                  )));
                        },
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: height * 0.3,
                width: width,
                child: FutureBuilder(
                    future: documentSnapshot,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          padding: const EdgeInsets.all(5.0),
                          itemCount: snapshot.data.length > 10
                              ? 10
                              : snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: GestureDetector(
                                onDoubleTap: () {
                                  // print({
                                  //         'userUId': snapshot.data[
                                  //             ((snapshot.data.length - 1) -
                                  //                 index)]['userUId'],
                                  //         'caption': snapshot.data[
                                  //             ((snapshot.data.length - 1) -
                                  //                 index)]['caption'],
                                  //         'imgUrl': snapshot.data[
                                  //             ((snapshot.data.length - 1) -
                                  //                 index)]['imgUrl'],
                                  //         'postOwnerDisplayName': snapshot.data[
                                  //                 ((snapshot.data.length - 1) -
                                  //                     index)]
                                  //             ['postOwnerDisplayName'],
                                  //         'postOwnerPhotoUrl': snapshot.data[
                                  //             ((snapshot.data.length - 1) -
                                  //                 index)]['postOwnerPhotoUrl'],
                                  //       });
                                  if (currentUser != null) {
                                    _firebaseServices.addPostToFavorites(
                                        currentUser,
                                        Post.fromMap({
                                          'userUId': snapshot.data[
                                              ((snapshot.data.length - 1) -
                                                  index)]['userUId'],
                                          'caption': snapshot.data[
                                              ((snapshot.data.length - 1) -
                                                  index)]['caption'],
                                          'imgUrl': snapshot.data[
                                              ((snapshot.data.length - 1) -
                                                  index)]['imgUrl'],
                                          'postOwnerDisplayName': snapshot.data[
                                                  ((snapshot.data.length - 1) -
                                                      index)]
                                              ['postOwnerDisplayName'],
                                          'postOwnerPhotoUrl': snapshot.data[
                                              ((snapshot.data.length - 1) -
                                                  index)]['postOwnerPhotoUrl'],
                                        }));
                                  } else {
                                    print('please sign');
                                  }
                                },
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => StoryCreateScreen(
                                            imagePath: snapshot.data[
                                                ((snapshot.data.length - 1) -
                                                    index)]['imgUrl'],
                                          )));
                                },
                                child: Container(
                                    height: height * 0.30,
                                    width: width * 0.35,
                                    color: Colors.blueGrey,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: <Widget>[
                                        getImage(
                                            context,
                                            snapshot.data[
                                                ((snapshot.data.length - 1) -
                                                    index)]['imgUrl']),
                                      ],
                                    )),
                              ),
                            );
                          },
                        );
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
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Trend',
                        style: _textStyle,
                      ),
                      FlatButton(
                        child: Row(
                          children: <Widget>[
                            Text(
                              'SEE ALL',
                              style: moreStyle,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                            )
                          ],
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SeeAll(
                                    title: 'Trend',
                                    documentSnapshot: documentSnapshot,
                                  )));
                        },
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: height * 0.3,
                width: width,
                child: FutureBuilder(
                    future: documentSnapshot,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          padding: const EdgeInsets.all(5.0),
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => StoryCreateScreen(
                                            imagePath: snapshot.data[index]
                                                ['imgUrl'],
                                          )));
                                },
                                child: Container(
                                    height: height * 0.30,
                                    width: width * 0.35,
                                    color: Colors.blueGrey,
                                    child: getImage(context,
                                        snapshot.data[index]['imgUrl'])),
                              ),
                            );
                          },
                        );
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
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10, bottom: 15, left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Recommended',
                        style: _textStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          FutureBuilder(
            future: documentSnapshot,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // if(snapshot.connectionState==ConnectionState.done)
                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: 1),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StoryCreateScreen(
                                    imagePath: snapshot.data[index]['imgUrl'],
                                  )));
                        },
                        child: Container(
                          height: height * 0.30,
                          width: width * 0.35,
                          color: Colors.blueGrey,
                          child: !snapshot.hasData
                              ? LinearProgressIndicator()
                              : getImage(
                                  context, snapshot.data[index]['imgUrl']),
                        ),
                      ),
                    );
                  }, childCount: snapshot.data.length),
                );
              } else
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
            },
          ),
        ],
      ),
    );
  }
}
