import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserImagesCard extends StatefulWidget {
  final VoidCallback onEditPress;
  final File image;
  final String imgUrl;
  UserImagesCard({this.onEditPress, this.image, this.imgUrl});
  @override
  _UserImagesCardState createState() => _UserImagesCardState();
}

class _UserImagesCardState extends State<UserImagesCard> {
  double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.40,
      width: width,
      child: Stack(
        children: <Widget>[
          Container(
            height: height * 0.32,
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Material(
                elevation: 10,
                shadowColor: Colors.redAccent,
                child: Image.asset(
                  'images/img1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.28,
            left: width * 0.65,
            child: IconButton(
              tooltip: 'Edit Photo',
              iconSize: 30,
              splashColor: Colors.white,
              icon: Icon(Icons.edit),
              onPressed: widget.onEditPress,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 125,
              height: 125,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.black, width: 6),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: widget.image != null
                    ? Image.file(
                        widget.image,
                        fit: BoxFit.cover,
                      )
                    : widget.imgUrl != null
                        ? getImage(context, widget.imgUrl)
                        : Image.asset(
                            'images/avatar.png',
                            fit: BoxFit.cover,
                          ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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
}
