import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audioPlayer = AudioPlayer();
  // var audioFile = 'assets/audio.mp3';
  var online =
      'http://docs.google.com/uc?export=open&id=1HRgWdsfYDxZpLHZG7-PFr__5CMEZNjDo';

  playLocal() async {
    int result = await audioPlayer.play(online);
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    if (result == 1) {
      // success
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('something wrong happen'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      child: Scaffold(
        // backgroundColor: Color(0xFFEEF0F2),
        body: Stack(
          children: [
            Container(
              height: height,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: MaterialButton(
                          onPressed: playLocal,
                          color: Colors.red,
                          textColor: Colors.black,
                          child: Text(
                            'Don\'t press !!\n !! لا تضغط الزر ',
                            style: TextStyle(fontSize: 28),
                          ),
                          padding: EdgeInsets.all(20),
                          elevation: 20,
                          shape: CircleBorder(),
                          // minWidth: 150,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: width,
                    child: Center(
                        child: Text(
                      'made with ❤️ ',
                      style: TextStyle(color: Colors.black),
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
