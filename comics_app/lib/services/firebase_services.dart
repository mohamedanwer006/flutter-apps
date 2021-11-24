import 'dart:io';
import 'package:comics_app/models/post.dart';
import 'package:comics_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {

  ///use this class for [FirebaseAuth]function[signUp],[signIn],[signInWithGoogle],[signOut],
  ///[getCurrentUser],[userToDB],[updatePhoto],
  ///[addPhotoToStorage],[addProfilePicToStorage],[addPostUrlToDB]
  ///[retrieveUserPosts].[retrieveUserDetails]

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  Firestore _firestore = Firestore.instance;
  User _user;
  Post _post;

//create sign in  function
  Future<FirebaseUser> signIn(String email, String password) async {
    print('inside SignIn function ');

    var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser firebaseUser = authResult.user;
    return firebaseUser;
  }

// Create sign up function
  Future<FirebaseUser> signUp(
    String name, String email, String password) async {
    print('inside SignUp function ');
    FirebaseUser firebaseUser;
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((currentUser) async {
      ///user update display name
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = name;
      print(name);
      currentUser.user.updateProfile(userUpdateInfo);
      await currentUser.user.reload();
      firebaseUser = await _firebaseAuth.currentUser();

      ///end of update
    }).catchError((e) {
      print(e);
    });
    print('return data d test : ' + firebaseUser.displayName.toString());
    return firebaseUser;
  }

  //Create sign out function

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

//Create get current user function

  Future<FirebaseUser> getCurrentUser() async {
    print('inside get current user');
    return await _firebaseAuth.currentUser();
  }

//Create add new user to database

  Future<void> userToDB(FirebaseUser firebaseUser) async {
    print('inside userToDB function ');
    _firestore
        .collection('display_names')
        .document(firebaseUser.displayName)
        .setData({'displayName': firebaseUser.displayName});
    _user = User(
      uid: firebaseUser.uid,
      email: firebaseUser.email,
      displayName: firebaseUser.displayName,
      photoUrl: firebaseUser.photoUrl,
    );
    return _firestore
        .collection('users')
        .document(firebaseUser.uid)
        .setData(_user.toMap(_user));
  }

//update user profile img to db

  Future<void> updatePhoto(String url, String uid) async {
    ///user update display name
    await _firebaseAuth.currentUser().then((currentUser) {
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.photoUrl = url;
      currentUser.updateProfile(userUpdateInfo);
      currentUser.reload();
      print('test updat :' + currentUser.photoUrl.toString());
    });
    await _firestore
        .collection('users')
        .document(uid)
        .updateData({'photoUrl': url}).then((val) {
      print("update profile photo url");
    }).catchError((e) {
      print(e);
    });
  }

//Create upload image to storage and get back download url function

  Future<String> addPhotoToStorage(File file) async {
    print('inside addPhotoToStorage function ');
    StorageReference reference = FirebaseStorage.instance
        .ref()
        .child('image/${DateTime.now().millisecondsSinceEpoch}');
    StorageUploadTask uploadTask = reference.putFile(file);
    var downloadUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    return downloadUrl;
  }

  //Add profile pic to Storage
  Future<String> addProfilePicToStorage(File file) async {
    StorageReference reference = FirebaseStorage.instance
        .ref()
        .child('profile_image/${DateTime.now().millisecondsSinceEpoch}');
    StorageUploadTask uploadTask = reference.putFile(file);
    var downloadUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    return downloadUrl;
  }

//Create add post to db
  Future<void> addPostUrlToDB(
    FirebaseUser currentUser,
    String imageUrl,
    String caption,
  ) async {
    print('insid post to db');
    print(currentUser.uid);
    print(imageUrl);
    print(caption);

    CollectionReference collectionReference = _firestore
        .collection('users')
        .document(currentUser.uid)
        .collection('posts');
    CollectionReference postsReference = _firestore.collection('all_posts');

    _post = Post(
      imgUrl: imageUrl,
      caption: caption,
      userUId: currentUser.uid,
      postOwnerDisplayName: currentUser.displayName,
      postOwnerPhotoUrl: currentUser.photoUrl,
    );
    print(_post.toMap(_post));
    await postsReference.add(_post.toMap(_post));

    ///to add post to collection
    return await collectionReference.add(_post.toMap(_post));
  }

  Future<void> addPostToFavorites(
    FirebaseUser currentUser,
    Post post,

  ) async {
    print('insid Favorites to db');
    print(currentUser.uid);
    print('ttttttttttttttttt'+post.userUId.toString());
    CollectionReference collectionReference = _firestore
        .collection('users')
        .document(currentUser.uid)
        .collection('favorites');
    // _post = Post(
    //   imgUrl: imageUrl,
    //   caption: caption,
    //   userUId: currentUser.uid,
    //   postOwnerDisplayName: currentUser.displayName,
    //   postOwnerPhotoUrl: currentUser.photoUrl,
    // );
    ///to add post to collection
    return await collectionReference.add(_post.toMap(post));
  }
  Future<List<DocumentSnapshot>> retrieveUserPosts() async {
    print('inside retrieveUserPosts function ');
    QuerySnapshot querySnapshot =
        await _firestore.collection('all_posts').getDocuments();
    return querySnapshot.documents;
  }
  Future<List<DocumentSnapshot>> retrieveUserFavPosts(FirebaseUser user ) async {
    print('inside retrieveUserFavPosts function ');
    QuerySnapshot querySnapshot =
        await _firestore.collection('users').document(user.uid).collection('favorites').getDocuments();
    return querySnapshot.documents;
  }

  Future<User> retrieveUserDetails(FirebaseUser user) async {
    DocumentSnapshot _documentSnapshot =
        await _firestore.collection('users').document(user.uid).get();
    if (_documentSnapshot.data != null) {
      print('user data is null');
      return User.fromMap(_documentSnapshot.data);
    } else {
      return null;
    }
  }

  Future<FirebaseUser> signInWithGoogle() async {
    print("inside signInWithGoogle func");
    final GoogleSignInAccount account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication authentication =
        await account.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: authentication.accessToken,
      idToken: authentication.idToken,
    );
    AuthResult result = await _firebaseAuth.signInWithCredential(credential);
    return result.user;
  }

 Future<PlatformException>sendPassReset(String email)async{
   try{
  await _firebaseAuth.sendPasswordResetEmail(email: email);
  return null;
  }catch (e){
    return e ;
  }
}


Future<List<DocumentSnapshot>> search(String text)async{
  QuerySnapshot _querySnapshot =await _firestore.collection('all_posts').where('caption',isEqualTo: text).getDocuments();
 return _querySnapshot.documents;

}
}
