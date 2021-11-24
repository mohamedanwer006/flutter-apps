import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProCard extends StatelessWidget {
  final Color backgroundColor;
  const ProCard({Key key, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50, //372.00,
      width: MediaQuery.of(context).size.width * 0.48, //211.00,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(31.00),
      ),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
              child: Column(
                children: [
                  Text(
                    'Doctor App',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.bold, letterSpacing: 1),
                  ),
                  Text(
                    'UI & UX 2020',
                    style: Theme.of(context).textTheme.overline.copyWith(),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width * 0.40,
                child: InteractiveViewer(
                  boundaryMargin: EdgeInsets.all(50),
                  minScale: 0.8,
                  maxScale: 1.4,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://i0.wp.com/mockuppsd.com/wp-content/uploads/2017/10/Free-iPhone-X-mockup-psd.png',
                    fit: BoxFit.cover,
                    // placeholder: (context, url) => Shimmer(
                    //   child: Container(),
                    //   gradient: LinearGradient(
                    //     colors: [
                    //       Colors.grey,
                    //       Colors.blueGrey,
                    //     ],
                    //     stops: [
                    //       0.5,
                    //       1,
                    //     ],
                    //   ),
                    // ),
                  ),
                ),
              ),
            ),
          ),
          // Positioned(
          //   child: null,
          // ),
        ],
      ),
    );
  }
}
