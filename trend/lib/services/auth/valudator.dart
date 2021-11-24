import 'package:injectable/injectable.dart';

@lazySingleton
class Valudator {
  emailValudator(email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) {
      return 'Please Enter Valid Email';
    } else {
      return null;
    }
  }

  passwordValudator(val) {
    if (val.isEmpty) {
      return 'Please Enter Your Password';
    } else if (val.length < 6) {
      return 'password need to be least 6 character';
    } else {
      return null;
    }
  }
}
