import 'package:comics_app/screens/home_screen.dart';
import 'package:comics_app/screens/resetpass_screen.dart';
import 'package:comics_app/screens/sign_up_screen.dart';
import 'package:comics_app/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:undraw/undraw.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FirebaseServices _firebaseServices = FirebaseServices();

  bool isLoading = false;

  bool passSecure = true;

  String _email, _password;

  var height, width;

  TextStyle _textStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  Widget background() {
    return UnDraw(
      alignment: Alignment.topCenter,
      illustration: UnDrawIllustration.login,
      color: Colors.blueGrey,
      placeholder: Container(),
    );
  }

  void signInWithGoogle() async {
    setState(() {
      isLoading = true;
    });
    var currentUser = await _firebaseServices.signInWithGoogle();
    Fluttertoast.showToast(
      msg: 'sign in sucsses',
      gravity: ToastGravity.CENTER,
    );
    var user = await _firebaseServices.retrieveUserDetails(currentUser);
    if (user != null) {
      print('testdsfsdass:user not null' + user.uid);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    } else {
      print('testdsfsdass:user null');
      await _firebaseServices.userToDB(currentUser);
      Navigator.of(context).pop(); 
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: height,
          width: width,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                child: Container(
                  height: height,
                  width: width,
                  child: background(),
                  // child: Image.asset(
                  //   'images/img1.jpg',
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              Positioned(
                top: height * 0.03,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    // color: Colors.lightBlue.withOpacity(0.4),
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 35,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.15,
                child: Container(
                    alignment: Alignment.center,
                    height: height * 0.1,
                    width: width,
                    child: Text(
                      'Welcome',
                      style: _textStyle,
                    )),
              ),
              Positioned(
                top: height * 0.25,
                child: Container(
                  height: height * 0.7,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: TextStyle(color: Colors.white),
                                      prefixIcon: Icon(Icons.email),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Colors.lightBlue,
                                              style: BorderStyle.solid)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please Enter Your Email';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) => _email = val,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: TextFormField(
                                  obscureText: passSecure,
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(color: Colors.white),
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.remove_red_eye),
                                        onPressed: () {
                                          setState(() {
                                            passSecure = !passSecure;
                                          });
                                        },
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Colors.lightBlue,
                                              style: BorderStyle.solid)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please Enter Your Password';
                                    } else if (val.length < 6) {
                                      return 'password need to be least 6 character';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) => _password = val,
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Container(
                                width: width,
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  highlightColor: Colors.lightBlue,
                                  child: Text(
                                    'Forget password ?',
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ResetPassScreen()));
                                  },
                                ),
                              ),
                              Container(
                                width: width,
                                alignment: Alignment.center,
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    color: Colors.lightBlue,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 45,
                                          right: 45,
                                          top: 10,
                                          bottom: 10),
                                      child: Text('Sign In'),
                                    ),
                                    onPressed: () => signIn()),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: height * 0.60,
                right: MediaQuery.of(context).size.width * 0.35,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                      width: width,
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        color: Colors.white,
                        child: Text(
                          'Google',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: signInWithGoogle,
                      )),
                ),
              ),
              Positioned(
                top: height * 0.85,
                right: 15,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                      width: width,
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        color: Colors.white,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUp()));
                        },
                      )),
                ),
              ),
              Center(
                child: Visibility(
                  visible: isLoading,
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      setState(() {
        isLoading = true;
      });
      _firebaseServices.signIn(_email, _password).then((currentUser) async {
        Fluttertoast.showToast(
          msg: 'sign in sucsses',
          gravity: ToastGravity.CENTER,
        );
        var user = await _firebaseServices.retrieveUserDetails(currentUser);
        if (user != null) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
        } else {
          _firebaseServices.userToDB(currentUser);
        }
      }).catchError((e) {
        print(e);
      });
    }
  }
}
