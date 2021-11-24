import 'package:comics_app/screens/sign_in_screen.dart';
import 'package:comics_app/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:undraw/undraw.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FirebaseServices _firebaseServices = FirebaseServices();
bool isLoading=false;
  bool passSecure = true;
  String _name, _email, _password;
  double height, width;

  TextStyle _textStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );
Widget background(){
  return UnDraw(
  alignment: Alignment.topCenter,
  illustration: UnDrawIllustration.login,
  color: Colors.grey[700],
  placeholder: Container(),
    );
}
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                  padding: const EdgeInsets.only(top: 1.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.close,size: 35,),
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
                                      hintText: 'Your name',
                                      hintStyle: TextStyle(color: Colors.white),
                                      prefixIcon: Icon(Icons.person),
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
                                      return 'Please Enter Your name';
                                    }else{return null;}
                                  },
                                  onSaved: (val) => _name = val,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
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
                                    }else{return null;}
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
                                    }else{return null;}
                                  },
                                  onSaved: (val) => _password = val,
                                ),
                              ),
                              SizedBox(
                                height: 45,
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
                                    child: Text('Sign Up'),
                                  ),
                                  onPressed: () {
                                    signUp();
                                  },
                                ),
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
                          'Sign In',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () => Navigator.pop(context),
                      )),
                ),
              ),
              Center(
                child: Visibility(
                  visible: isLoading,
                  child: CircularProgressIndicator(
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      setState(() {
         isLoading = true;
      });
      _firebaseServices
          .signUp(_name, _email, _password)
          .then((user) {
            _firebaseServices.userToDB(user)
                .then((val){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => SignInScreen()
              ));
            }).catchError((e)=>print(e));
      })
          .catchError((e) {
        print(e);
      });
    }
  }
}
