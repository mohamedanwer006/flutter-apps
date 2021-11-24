import 'package:api_tester/pages/json_file_request.dart';
import 'package:api_tester/pages/multi_path_page.dart';
import 'package:api_tester/pages/single_requests_page.dart';
import 'package:api_tester/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var height = Utils.getHeight(context);
    var width = Utils.getWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('API TEST'),
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        children: [
          CardButton(
            onTap: () {
              Navigator.pushNamed(context, JsonFileRequestPage.routeName);
            },
            title: 'Json file',
            height: height,
            width: width,
          ),
          CardButton(
            onTap: () {
              Navigator.pushNamed(context, SingleRequestPage.routeName);
            },
            title: 'Single Request',
            height: height,
            width: width,
            colors: const [Colors.redAccent, Colors.orangeAccent],
          ),
          CardButton(
            onTap: () {
              Navigator.pushNamed(context, MultiPathPage.routeName);
            },
            title: 'Multi paths ',
            height: height,
            width: width,
            colors: [Colors.amberAccent, Colors.deepOrangeAccent],
          ),
          CardButton(
            onTap: () {
              showCustomAlertDialog();
            },
            title: 'Web Scocets',
            height: height,
            width: width,
            colors: const [Colors.cyan, Colors.greenAccent],
          ),
          CardButton(
            onTap: () {
              showCustomAlertDialog();
            },
            title: 'Mqtt Request',
            height: height,
            width: width,
            colors: const [Colors.pink, Colors.purpleAccent],
          ),
        ],
      ),
    );
  }

  void showCustomAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Icon(
          Icons.error_outline_rounded,
          color: Colors.yellowAccent,
          size: 35,
        ),
        content: const Center(
          child: Text('This feature will ba avalibale soon'),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text(
              'close',
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  const CardButton({
    Key? key,
    required this.height,
    required this.width,
    required this.title,
    this.colors = const [Colors.blue, Colors.tealAccent],
    required this.onTap,
  }) : super(key: key);

  final double height;
  final String title;
  final double width;
  final List<Color> colors;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height * 0.2,
          width: width * 0.9,
          child: Center(child: Text(title)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                colors: colors,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(5, -5),
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(5, 5),
                  spreadRadius: 1,
                )
              ]),
        ),
      ),
    );
  }
}
