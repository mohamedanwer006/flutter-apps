import 'dart:io';
import 'package:comics_app/models/user.dart';
import 'package:comics_app/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UploadPhotoScreen extends StatefulWidget {
 final File image;
  UploadPhotoScreen({this.image});
  @override
  _UploadPhotoScreenState createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {

FirebaseServices _firebaseServices = FirebaseServices();
FirebaseUser _user;
bool loading=false;
bool errorVisible=false;
TextEditingController textEditingController = TextEditingController();
Future<void> getUserData() async {
  FirebaseUser currentUser = await _firebaseServices.getCurrentUser();
  User user = await _firebaseServices.retrieveUserDetails(currentUser);
  print("test for uolisa::"+user.displayName);
  setState(() {
    _user = currentUser;
  });
}
  uploadPhotoToDB()async{
  setState(() {
    loading=true;
  });
  if(textEditingController.text.isNotEmpty){
    print('mohamed test122233##'+ textEditingController.text.isEmpty.toString());
      await _firebaseServices.addPhotoToStorage(widget.image)
        .then((imageUrl)async{
       await _firebaseServices.addPostUrlToDB(_user, imageUrl, textEditingController.text)
          .then((val){
         Navigator.pop(context);
       })
          .catchError((e){});
    }).catchError((e){print(e);});}
    else{
      setState(() {
       loading=false;
       errorVisible=true;
      });

    }
  }


@override
  void initState() {
    super.initState();
    getUserData();
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      title: Text('new post',style: TextStyle(color: Colors.white),),
      centerTitle: true,
      elevation: 0,
    ),
    body:Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Visibility(
            child: LinearProgressIndicator(
              backgroundColor: Colors.black,
            ),
            visible: loading,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(image: FileImage(widget.image),fit: BoxFit.fill)
                ),
              ),
              Expanded(
                child: Container(
                child: TextField(
                style: TextStyle(fontSize: 28),
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'Enter tag for photo'
                ),
                autofocus: true,)))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8,left: 22,right: 22),
            child: MaterialButton(
              onPressed: uploadPhotoToDB,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ) ,
              color: Colors.white30,
              height: 35,
              minWidth: 66,
              elevation: 1,
              child: Row(
                children: <Widget>[
                  Icon(Icons.cloud_upload),
                  SizedBox(width: 10,),
                  Text('up Load'),
                ],
              ),
            ),
          ),
          Visibility(
            visible: errorVisible,
            child: Container(
              margin: EdgeInsets.all(22),
              color: Colors.red,
            child: Center(
              child: Text('please Enter tag ',style: TextStyle(fontSize: 22),),
            ),
          ),),
        ],
      ),
    ) ,
  );
}
}


