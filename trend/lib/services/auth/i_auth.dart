import 'package:trend/models/current_user/current_user.dart';

///Auth Interferance
abstract class IAuth {
  Future<CurrentUser> signInWithEmailAndPassword(String email, String password);
  Future<CurrentUser> signUpWithEmailAndPassword(String email, String password);
  Future<void> signInWithGoogle();
  CurrentUser currentUser();
  Future<void> signOut();
}
