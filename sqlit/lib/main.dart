////not working


import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlit/model/user.dart';
import 'package:sqlit/utils/database_helper.dart';

List myUser;

void main()async{
  var db = new DatabaseHelper();
  int userSaved = await db.saveUser(new User('ahmedd', '155522', 22));
  print('saved user : $userSaved');
  myUser= await db.getAllUsers();
  for(int i=0;i<myUser.length;i++){
    User user =User.map(myUser[i]);
    print('username: ${user.username}');
  }
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: ThemeData.dark(),
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SQLITE APP',style: TextStyle(
          color: Colors.red,
          letterSpacing:10,
          fontSize: 25,
          fontWeight: FontWeight.w900,
        ),),
      ),
    );
  }
}









/*this for local path file write and read*/
//import 'dart:io';
//import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
//
//void main() async{
//
//  var dataStore= await  readData();
//  if(dataStore!=null){
//    debugPrint(dataStore);
//  }
//  runApp(
//  MaterialApp(
//    theme: ThemeData.dark(),
//    home: Home(),
//    debugShowCheckedModeBanner: false,
//  )
//);
//}
//class Home extends StatefulWidget {
//  @override
//  _HomeState createState() => _HomeState();
//}
//
//class _HomeState extends State<Home> {
//  TextEditingController _textEditingController= new TextEditingController();
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar:AppBar(
//        centerTitle: true,
//        title: Text('sqlit',style: TextStyle(
//          color: Colors.redAccent,
//          fontWeight: FontWeight.bold,
//          fontSize: 26,
//          letterSpacing: 6,
//        ),),
//      ),
//      body: Container(
//        margin: EdgeInsets.only(top: 22,left: 10),
//        child: Column(
//          children: <Widget>[
//            TextField(
//              controller:_textEditingController ,
//              decoration: InputDecoration(
//                labelText: 'enter',
//                icon: Icon(
//                  Icons.storage,
//                  color: Colors.red,
//                  size: 30,
//                ),
//              ),
//            ),
//            SizedBox(height: 22,),
//            RaisedButton(
//              onPressed: (){
//                writeData(_textEditingController.text);
//                debugPrint('saved :${_textEditingController.text}');
//              },
//              color: Colors.black38,
//              child: Row(
//                mainAxisSize:MainAxisSize.min,
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Icon(
//                    Icons.save_alt,
//                    size: 30,
//                    color: Colors.orange,
//                  ),
//                  SizedBox(width: 10,),
//                  Text('Save',style: TextStyle(
//                    fontSize: 30,
//                    fontWeight: FontWeight.bold,
//                    color: Colors.orange
//                  ),),
//                ],
//              ),
//            ),
//            Padding(padding: EdgeInsets.all(22)),
//            FutureBuilder(
//                future:readData() ,
//                builder: (context,data){
//             if(data.hasData!=null){
//               return Text('${data.data.toString()}',style: TextStyle(color: Colors.white70,fontSize: 22),);
//             }else{
//               return Text('no data saved',style: TextStyle(color: Colors.white70,fontSize: 22),);
//             }
//            }
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//
////to get path
//Future<String> get localPath async{
//  final path = await getApplicationDocumentsDirectory();
//  debugPrint('path : ${path.path}');
//  return path.path;
//}
////to get file directory and the name of file
//Future<File> get localFile async{
//  final file = await localPath;
//  debugPrint('file : $file');
//  return File('$file/data.txt');
//}
////to write in the file
//Future<File> writeData(String value) async{
//  final file = await localFile;
//  debugPrint('file : ${file.path}');
//  return file.writeAsString(value);
//}
////read data
//Future<String>  readData() async{
//  try{
//    final file =await localFile;
//    debugPrint('file : ${file.path}');
//    String data = await file .readAsString();
//    return data;
//  }catch(e){
//    return'embety file';
//  }
//}
//
//
