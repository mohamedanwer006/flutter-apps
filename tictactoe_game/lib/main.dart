import 'package:flutter/material.dart';
import 'package:tictactoe_game/widgets/button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac toe',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> buttons = ['', '', '', '', '', '', '', '', ''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        color: Colors.grey[900],
        child: Board(
          boardList: buttons,
        ),
      ),
    );
  }
}

class Board extends StatefulWidget {
  final List<String> boardList;

  const Board({Key key, this.boardList}) : super(key: key);
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
//      itemCount: widget.boardList.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//      itemBuilder: (context, index) {
//        return GestureDetector(
//          onTap: () {
//            _ontap(index);
//          },
//          child: Container(
//            decoration: BoxDecoration(
//              color: Colors.grey[900],
//              border: Border.all(
//                width: 0.9,
//                color: Colors.grey[700],
//              ),
//            ),
//            child: Center(
//              child: Text(
//                widget.boardList[index],
//                style: TextStyle(color: Colors.white, fontSize: 45),
//              ),
//            ),
//          ),
//        );
//      },
    );
  }

  void _ontap(int index) {
    setState(() {
      widget.boardList[index] = 'o';
    });
  }
}
