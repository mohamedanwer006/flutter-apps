import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double playerdx = -0.9;
  double playerdy = 1;
  double opsticaldx = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(playerdx, playerdy),
                    child: Container(
                      height: 100,
                      width: 80,
                      child: MyHero(),
                    ),
                  ),
                  Align(
                    alignment: Alignment(opsticaldx, 1),
                    child: Opstical(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.white,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_circle_up,
                          size: 40,
                        ),
                        onPressed: jumpUp,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 40,
                            ),
                            onPressed: jumpUp,
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 40,
                            ),
                            onPressed: startGame,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void jumpUp() {
    double t = 0;
    Timer.periodic(Duration(milliseconds: 25), (timer) {
      t += 0.05;
      var h = -(0.5 * 2) * t * t + 1.2 * t;
      // print(h);
      setState(() {
        playerdy = -h;
        // print(playerdy);
      });
      if (playerdy > 0.9) {
        timer.cancel();
      }
    });
  }

  void startGame() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      // print(h);
      setState(() {
        ///control speed
        opsticaldx -= 0.03;

        // print(opsticaldx);
      });
      //check if barier go to the left side
      if (opsticaldx < -1.5) {
        //start for right side
        opsticaldx = 1;
      }
    });
  }
}

class MyHero extends StatelessWidget {
  const MyHero({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/hero.png'),
    );
  }
}

class Opstical extends StatelessWidget {
  const Opstical({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 50,
      color: Colors.green,
    );
  }
}
