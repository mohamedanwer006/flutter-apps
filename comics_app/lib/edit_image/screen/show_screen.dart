import 'dart:typed_data';
import 'package:flutter/material.dart';

class Show extends StatefulWidget {
  // final File file;
 final Uint8List  file;
  Show(this.file);
  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Image.memory(
            widget.file,
            fit: BoxFit.fitWidth,
          ),
          // child: Image.file(widget.file, fit: BoxFit.fitWidth,),
        ),
      ),
    );
  }
}
