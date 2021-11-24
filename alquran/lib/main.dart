import 'package:alquran/models/surahs.dart';
import 'package:alquran/services/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alquran',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Services _services=Services();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:FutureBuilder(
        future: _services.fetchSurahs(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<Surahs> surahs=snapshot.data;
            return ListView.builder(
              itemCount: surahs.length,
              scrollDirection: Axis.vertical,
              itemBuilder:(context, index) => ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SurahPage(surahs: surahs[index],),));
                },
                title: Text('${surahs[index].name}',textDirection: TextDirection.rtl,),
              ), 
            );
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },

      ),
    );
  }
}

class SurahPage extends StatelessWidget {
  final Surahs surahs;
  const SurahPage({Key key, this.surahs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: ListView.builder(
         itemCount: surahs.ayahs.length,
         itemBuilder: (context, index) => Text('${surahs.ayahs[index].text}',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 40),),),
    );
  }
}