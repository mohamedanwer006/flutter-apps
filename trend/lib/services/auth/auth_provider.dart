import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:trend/models/current_user/current_user.dart';
import 'package:trend/services/auth/core/auth_result.dart';
import 'package:trend/services/auth/i_auth.dart';

@injectable
class AuthServices extends ChangeNotifier {
  final IAuth _auth;
  AuthServices(this._auth);

  CurrentUser get currentUser => _auth.currentUser();

  AuthResult signInWithEmailAndPassword(String email, String password) {
    try {
      var user = _auth.signInWithEmailAndPassword(email, password);
      if (user != null) {
        return AuthResult.autherized();
      } else {
        return AuthResult.none();
      }
    } catch (e) {
      return AuthResult.none();
    }
  }

  void signUpWithEmailAndPassword(String email, String password) async {
    var user = await _auth.signUpWithEmailAndPassword(email, password);
    notifyListeners();
  }

  signInWithGoogle() async {
    await _auth.signInWithGoogle();

    notifyListeners();
  }

  void signOut() {
    _auth.signOut();
    notifyListeners();
  }
}
