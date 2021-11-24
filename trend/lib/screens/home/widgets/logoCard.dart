import 'package:flutter/material.dart';

class LogoCard extends StatelessWidget {
  final Color backgroundColor;
  const LogoCard({Key key, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3, //372.00,
      width: MediaQuery.of(context).size.width * 0.4, //211.00,
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
                    'Flutter Logo',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
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
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.3,
                child: InteractiveViewer(
                    boundaryMargin: EdgeInsets.all(50),
                    minScale: 0.8,
                    maxScale: 1.4,
                    child: FlutterLogo()),
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
