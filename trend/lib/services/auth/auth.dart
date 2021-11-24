import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:trend/models/current_user/current_user.dart';
import 'package:trend/services/auth/i_auth.dart';

@Injectable(as: IAuth)
class AuthImpl implements IAuth {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Future<CurrentUser> signInWithEmailAndPassword(
      String email, String password) async {
    var userCred = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    var user = userCred.user;
    return CurrentUser(
      email: user.email,
      name: user.displayName,
      profilePicture: user.photoURL,
      uid: user.uid,
    );
  }

  @override
  Future<void> signInWithGoogle() async {
    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
      await firebaseAuth.signInWithRedirect(googleProvider);
      var userCred = await firebaseAuth.getRedirectResult();
      print("ttttttttttttt");
      return userCred.user;
    } else {
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      var userCred =
          await FirebaseAuth.instance.signInWithCredential(credential);
      // Once signed in, return the UserCredential
      return userCred.user;
    }
    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

  @override
  Future<void> signOut() async {
    // final GoogleSignIn googleSignIn = GoogleSignIn();
    // await googleSignIn.signOut();
    return firebaseAuth.signOut();
  }

  @override
  Future<CurrentUser> signUpWithEmailAndPassword(
      String email, String password) async {
    var userCred = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    var user = userCred.user;
    return CurrentUser(
      email: user.email,
      name: user.displayName,
      profilePicture: user.photoURL,
      uid: user.uid,
    );
  }

  @override
  CurrentUser currentUser() {
    if (firebaseAuth.currentUser != null) {
      return CurrentUser(
        email: firebaseAuth.currentUser.email,
        name: firebaseAuth.currentUser.displayName,
        profilePicture: firebaseAuth.currentUser.photoURL,
        uid: firebaseAuth.currentUser.uid,
      );
    } else {
      return null;
    }
  }
}
