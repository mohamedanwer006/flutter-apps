import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SeeAll extends StatefulWidget {
  final String title;
  final Future<List<DocumentSnapshot>> documentSnapshot;
  SeeAll({this.title,this.documentSnapshot});

  @override
  _SeeAllState createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  double width, height;
  TextStyle _appTitleStyle=TextStyle(
    fontSize: 22,
    color: Colors.deepPurpleAccent,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,

  );

Widget getImage(context, String url) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) {
        return Center(child: CircularProgressIndicator());
      },
      errorWidget: (context, url, error) {
        print(error.toString());
        return Icon(Icons.error);
      },
      fadeInDuration: Duration(seconds: 1),
      fadeOutDuration: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title:Text('${widget.title}',style: _appTitleStyle,) ,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: widget.documentSnapshot,
              builder: (context,snapshot){
                if(snapshot.hasData){
                return GridView.builder(
            itemCount: snapshot.data.length,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,),
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: height * 0.30,
                  width: width * 0.35,
                  color: Colors.blueGrey,
                  child: getImage(context,snapshot.data[(snapshot.data.length-1)-index]['imgUrl']),
                ),
              );
            }));
            }else return Container();
              },
      ),
    );
  }
}
