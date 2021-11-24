import 'dart:io';
import 'package:flutter/material.dart';
import 'package:home_app/models/device_model.dart';
import 'package:home_app/components/list_device_card.dart';
import 'package:home_app/services/api/uploadfiles.dart';
import 'package:home_app/services/api/user.dart';
import 'package:home_app/services/provider/devices_provider.dart';
import 'package:home_app/services/provider/user_provider.dart';
import 'package:home_app/theme/theme_changer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileEditPage extends StatefulWidget {
   static const String route = '/profileEdit';
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  String _name = '';
  File _image;
  TextEditingController _editingController;
  UploadServices _uploadServices = UploadServices();
  UserServices _userServices = UserServices();
  GlobalKey key = GlobalKey();
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              _updateUserDetails();
              // Navigator.of(context).pop();
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
          'Edit',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Consumer<ThemeChanger>(
        builder: (context, theme, child) => Column(
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
                      color:Theme.of(context).cardColor,
                      // boxShadow: [
                      //   BoxShadow(
                      //       color: theme.darkTheme
                      //           ? Colors.grey[900]
                      //           : Colors.grey[300],
                      //       blurRadius: theme.darkTheme ? 1 : 5,
                      //       spreadRadius: 1,
                      //       offset:
                      //           theme.darkTheme ? Offset(1, 1) : Offset(4, 4)),
                      //   BoxShadow(
                      //       color: theme.darkTheme
                      //           ? Colors.grey[800]
                      //           : Colors.white,
                      //       blurRadius: theme.darkTheme ? 1 : 5,
                      //       spreadRadius: 1,
                      //       offset: theme.darkTheme
                      //           ? Offset(-1, -1)
                      //           : Offset(-4, -4)),
                      // ],
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
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       color: theme.darkTheme
                                        //           ? Colors.grey[900]
                                        //           : Colors.grey[300],
                                        //       blurRadius:
                                        //           theme.darkTheme ? 1 : 1,
                                        //       spreadRadius: 1,
                                        //       offset: theme.darkTheme
                                        //           ? Offset(1, 1)
                                        //           : Offset(4, 4)),
                                        //   BoxShadow(
                                        //       color: theme.darkTheme
                                        //           ? Colors.grey[800]
                                        //           : Colors.white,
                                        //       blurRadius:
                                        //           theme.darkTheme ? 1 : 1,
                                        //       spreadRadius: 1,
                                        //       offset: theme.darkTheme
                                        //           ? Offset(-1, -1)
                                        //           : Offset(-4, -4)),
                                        // ],
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
                                    child: Text('Edit'),
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
                                child: TextField(
                                  maxLength: 14,
                                  controller: _editingController,
                                  onChanged: (val) {
                                    setState(() {
                                      _name = val;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(top: 20),
                                      hintText: 'type name',
                                      // counterText: '',
                                      counter: Text(
                                        '${_name.length}',
                                      ),
                                      hintStyle:
                                          Theme.of(context).textTheme.bodyText1,
                                      // counter: Text("${_name.length}"),
                                      border: InputBorder.none),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20),
                                child: Container(
                                  color: Colors.grey[800],
                                  width: MediaQuery.of(context).size.width,
                                  height: 0.5,
                                ),
                              ),
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
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: Provider.of<DeviceProvider>(context).devices,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Device> devices = snapshot.data;

                      return ListView.builder(
                        // shrinkWrap: false,
                        scrollDirection: Axis.vertical,
                        itemCount: devices.length,
                        itemBuilder: (context, index) => Dismissible(
                          direction: DismissDirection.startToEnd,
                          onDismissed: (direction) {
                            //Todo: Dismiss func
                          },
                          background: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 40),
                              // margin: EdgeInsets.only(left: 10),
                              child: Icon(Icons.remove_circle_outline,color: Colors.white,),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(
                                  15
                                ),
                              ),
                            ),
                          ),
                          key: Key(devices[index].id),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 1),
                              child: ListDeviceCard(
                                image: 'assets/images/idea.png',
                                title: devices[index].name ?? 'No name',
                                onTap: () {
                                  print('${devices[index].id}');
                                },
                              )),
                        ),
                      );
                    } else
                      return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectImage() {
    getImage();
  }

  void _updateUserDetails() async {
    var user = Provider.of<UserProvider>(context).user;
    if (_image != null && _name.length > 0) {
      showLoading();
      String _picUrl = await _uploadServices.uploadImage(_image);
      Map data = {
        "picture": _picUrl,
        "name": _name,
      };
      var res = await _userServices.updateUser(user.id, data );
      if ( res!=null) {
        Provider.of<UserProvider>(context)
            .setUser(res);
        stopLoading();
        print('complet update user info');
      } else {
        stopLoading();
        print('error');
      }
    } else if (_image != null && _name.length == 0) {
      showLoading();
      String _picUrl = await _uploadServices.uploadImage(_image);
      Map data = {
        "picture": _picUrl,
      };
      var res = await _userServices.updateUser(user.id, data);
      if (res !=null) {
        Provider.of<UserProvider>(context)
            .setUser(res);
        stopLoading();
        print('complet update device info');
      } else {
        stopLoading();
        print('error');
      }
    } else if (_image == null && _name.length > 0) {
      showLoading();
      Map data = {
        "name": _name,
      };
      var res= await _userServices.updateUser(user.id, data);
      if ( res!= null) {
        Provider.of<UserProvider>(context)
            .setUser(res);
        stopLoading();
        print('complet update device info');
      } else {
        stopLoading();
        print('error');
      }
    } else if (_image == null && _name.length == 0) {
      //Nothing
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              child: Text(
                'no changes to update 🙄',
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        },
      );
    } else {}
  }

  stopLoading() {
    Navigator.pop(context);
    Navigator.pop(context);
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

editCard() {
  return new Container(
    height: 221.00,
    width: 400.00,
    decoration: BoxDecoration(
      color: Color(0xff2a2a2a),
      borderRadius: BorderRadius.circular(12.00),
    ),
  );
}
