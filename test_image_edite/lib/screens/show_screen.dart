import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:test_image_edite/controllers/image_compresser.dart';

class Show extends StatefulWidget {
  final Uint8List file;

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
            child: Image.memory(widget.file,fit: BoxFit.fitWidth,),
        ),
      ),
    );
  }
}
