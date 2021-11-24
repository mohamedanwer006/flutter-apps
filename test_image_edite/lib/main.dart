import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_image_edite/screens/story_create_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imagePath;
  String path;

  Future<String>getImage()async{
    File file=await ImagePicker.pickImage(source: ImageSource.gallery);
    var path=file.path;
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('get image'),
            onPressed: (){
              getImage().then((val){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>StoryCreateScreen(imagePath:val ,)
                ));
              });

            },
          ),
        ),
      ),
    );
  }
}

