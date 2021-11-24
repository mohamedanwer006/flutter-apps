import 'dart:io';
import 'package:flutter/material.dart';
import 'package:home_app/models/collections.dart';
import 'package:home_app/services/api/collection.dart';
import 'package:home_app/services/api/uploadfiles.dart';
import 'package:home_app/services/provider/collection_provider.dart';
import 'package:home_app/theme/theme_changer.dart';
import 'package:home_app/utils/utilities.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddRoomPage extends StatefulWidget {
  static const String route = '/addroom';
  @override
  _AddRoomPageState createState() => _AddRoomPageState();
}

class _AddRoomPageState extends State<AddRoomPage> {
  final _formKey = GlobalKey<FormState>();
  File _image;
  TextEditingController nameController = TextEditingController();
  UploadServices _uploadServices = UploadServices();
  CollectionServices _collectionServices = CollectionServices();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              _addRoom();
            },
          ),
        ],
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              Navigator.of(context).pop();
            }),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Add room',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Consumer<ThemeChanger>(
        builder: (context, theme, child) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.40,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(25),
                      color: theme.darkTheme
                          ? Theme.of(context).backgroundColor
                          : Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                            color: theme.darkTheme
                                ? Colors.grey[900]
                                : Colors.grey[300],
                            blurRadius: theme.darkTheme ? 1 : 5,
                            spreadRadius: 1,
                            offset:
                                theme.darkTheme ? Offset(1, 1) : Offset(4, 4)),
                        BoxShadow(
                            color: theme.darkTheme
                                ? Colors.grey[800]
                                : Colors.white,
                            blurRadius: theme.darkTheme ? 1 : 5,
                            spreadRadius: 1,
                            offset: theme.darkTheme
                                ? Offset(-1, -1)
                                : Offset(-4, -4)),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 18.0, left: 14),
                                  child: GestureDetector(
                                    onTap: _selectImage,
                                    child: Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: theme.darkTheme
                                                  ? Colors.grey[900]
                                                  : Colors.grey[300],
                                              blurRadius:
                                                  theme.darkTheme ? 1 : 1,
                                              spreadRadius: 1,
                                              offset: theme.darkTheme
                                                  ? Offset(1, 1)
                                                  : Offset(4, 4)),
                                          BoxShadow(
                                              color: theme.darkTheme
                                                  ? Colors.grey[800]
                                                  : Colors.white,
                                              blurRadius:
                                                  theme.darkTheme ? 1 : 1,
                                              spreadRadius: 1,
                                              offset: theme.darkTheme
                                                  ? Offset(-1, -1)
                                                  : Offset(-4, -4)),
                                        ],
                                        color: theme.darkTheme
                                            ? Theme.of(context).backgroundColor
                                            : Colors.grey[200],
                                        shape: BoxShape.circle,
                                        image: _image == null
                                            ? null
                                            : DecorationImage(
                                                image: FileImage(_image),
                                                fit: BoxFit.fill,
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 15, left: 18),
                                  child: GestureDetector(
                                    onTap: _selectImage,
                                    child: Text('select image'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 0, left: 20.0, right: 20),
                                child: Container(
                                  color: Colors.grey[800],
                                  width: MediaQuery.of(context).size.width,
                                  height: 0.5,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20),
                                child: Form(
                                  key: _formKey,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'name can\'t be null';
                                      } else {
                                        return null;
                                      }
                                    },
                                    textInputAction: TextInputAction.done,
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      enabledBorder: InputBorder.none,
                                      // disabledBorder: InputBorder.none,
                                      border: InputBorder.none,

                                      contentPadding: EdgeInsets.only(top: 20),
                                      hintText: 'Enter room name',
                                      hintStyle:
                                          Theme.of(context).textTheme.bodyText1,
                                      // border: InputBorder.none
                                    ),
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       left: 20.0, right: 20),
                              //   child: Container(
                              //     color: Colors.grey[800],
                              //     width: MediaQuery.of(context).size.width,
                              //     height: 0.5,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void _selectImage() {
    getImage();
  }

  void _addRoom() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        print(nameController.text);
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              // backgroundColor: Colors.transparent,
              content: Container(
                height: 100,
                width: 100,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).backgroundColor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor),
                  ),
                ),
              ),
            );
          },
        );
        if (_image != null) {
          String picUrl = await _uploadServices.uploadImage(_image);
          Collection _collection =
              Collection(name: nameController.text, picture: picUrl);
          var res = await _collectionServices.createCollection(_collection);
          if (res != null) {
            Provider.of<CollectionProvider>(context)
                .setCollections(_collectionServices.getCollections());
          }
          Navigator.pop(context);
          Navigator.pop(context);
        } else {
          Collection _collection = Collection(name: nameController.text);
          var res = await _collectionServices.createCollection(_collection);
          if (res != null) {
            Provider.of<CollectionProvider>(context)
                .setCollections(_collectionServices.getCollections());
            // Provider.of<CollectionProvider>(context).collections.add(res);
          }
          Navigator.pop(context);
          Navigator.pop(context);
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
            content:
                Text('Oh no!🤦‍♂️ can\'t Create Room , please try again late'),
            contentTextStyle: TextStyle(color: Colors.black),
          ),
        );
      }
    }
  }
}
