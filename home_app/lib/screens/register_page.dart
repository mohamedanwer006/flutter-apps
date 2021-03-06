import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_app/components/login_button.dart';
import 'package:home_app/screens/home_page.dart';
import 'package:home_app/screens/login_screen.dart';
import 'package:home_app/services/api/auth.dart';
import 'package:home_app/services/provider/user_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  static const String route = '/login';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthServices _authServices = AuthServices();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final userProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/back.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 60.0,
            left: 30.0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width * 0.25,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 15, left: 30.0, right: 30.0),
                            child: TextFormField(
                              controller: _name,
                              style: TextStyle(
                                fontSize: 22,
                                color: Color(0xFF242424),
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Your name',
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Please Enter Your name';
                                } else {
                                  return null;
                                }
                              },
                              // onSaved: (val) => _name = val,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 15, left: 30.0, right: 30.0),
                            child: TextFormField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                fontSize: 22,
                                color: Color(0xFF242424),
                                fontWeight: FontWeight.w400,
                              ),
                              validator: (email) {
                                bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
                                if (!emailValid) {
                                  return 'Please Enter  Valid Email';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'email',
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30.0),
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: _password,
                              obscureText: true,
                              style: TextStyle(
                                fontSize: 22,
                                color: Color(0xFF242424),
                                fontWeight: FontWeight.w400,
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Please Enter Your Password';
                                } else if (val.length < 6) {
                                  return 'password need to be least 6 character';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(hintText: 'Password'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => LoginPage())),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Color(0xFFD9A20B),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'Register',
                          style: TextStyle(
                            color: Color(0xFFD9A20B),
                            fontWeight: FontWeight.w600,
                            fontSize: 40,
                          ),
                        ),
                        LoginButton(
                          onPressed: signUp,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      showLoading();
      try {
        var user = await _authServices.createUserWithEmailAndPassword(
            _name.text, _email.text, _password.text);
        if (user != null) {
          Provider.of<UserProvider>(context).setUser(user);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Center(
              child: Text(
                'Error',
              ),
            ),
            content: Text('Oh no!????????????? can\'t Create account , please try again later'),
            contentTextStyle: TextStyle(color: Colors.black),
          ),
        );
      }
    }
  }



  
   showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      // useSafeArea: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).backgroundColor,
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          ),
        );
      },
    );
  }
}
