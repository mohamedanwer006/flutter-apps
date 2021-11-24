
import 'package:comics_app/screens/sign_in_screen.dart';
import 'package:comics_app/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:undraw/undraw.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPassScreen extends StatefulWidget {
  @override
  _ResetPassScreenState createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FirebaseServices _firebaseServices = FirebaseServices();

  bool isLoading = false;

  bool passSecure = true;

  String _email;

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
                              SizedBox(
                                height: 1,
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
                                      child: Text('Reset pass'),
                                    ),
                                    onPressed: () => resetPass()),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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

  Future<void> resetPass() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      setState(() {
        isLoading = true;
      });
      _firebaseServices.sendPassReset(_email).then((val) {
        if (val == null) {
          Fluttertoast.showToast(
            backgroundColor: Colors.blueGrey,
            msg: 'check your Email',
            gravity: ToastGravity.CENTER,
          );
           setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignInScreen()));
        } else {
          Fluttertoast.showToast(
            backgroundColor: Colors.blueGrey,
            msg: val.message.toString().toLowerCase(),
            gravity: ToastGravity.CENTER,
          );
           setState(() {
        isLoading = false;
      });
        }
      }).catchError((onError) {});
    }
  }
}
