import 'package:comics_app/edit_image/models/basic.dart';
import 'package:comics_app/edit_image/models/image_data.dart';
import 'package:comics_app/edit_image/screen/show_screen.dart';
import 'package:comics_app/edit_image/widgets/smiley_add_widget.dart';
import 'package:comics_app/edit_image/widgets/story_create_widget.dart';
import 'package:comics_app/edit_image/widgets/text_add_widget.dart';
import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
class StoryCreateScreen extends StatefulWidget {
  final String imagePath;

  const StoryCreateScreen({Key key, @required this.imagePath})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _StoryCreateScreenState();
}

class _StoryCreateScreenState extends State<StoryCreateScreen> {
  List<Basic> children = [];
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  List<Widget> stackChildren = [];
  StoryCreateController controller;

  @override
  void initState() {
    super.initState();
    children.add(ImageData(imagePath: widget.imagePath));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      offset = Offset(MediaQuery.of(context).size.width / 2 - 32.0,
          MediaQuery.of(context).size.height - 75.0);
      setState(() {
        stackChildren.add(
          StoryCreateWidget(
            children: children,
            deleteOffset: offset,
            onCompleted: (controller) {
              this.controller = controller;
            },
          ),
        );
        stackChildren.add(buildOptionsScreen());
      });
    });
  }

  Offset offset;
  bool adding = false;
  @override
  Widget build(BuildContext context) {
    print("Children baby ${children.length}");
    List<Widget> widgets = [];
    widgets.addAll(stackChildren);
//    if(!adding)
//      widgets.add(Positioned(
//          top: offset.dy,
//          left: offset.dx,
//          child: FloatingActionButton(
//            onPressed: () {},
//            child: Icon(
//              Icons.delete_forever,
//              color: Colors.black,
//            ),
//            backgroundColor: Colors.white,
//          )));
    return Scaffold(
      key: key,
      body: SafeArea(
        child: Stack(
          children: widgets,
        ),
      ),
    );
  }

  Widget buildButton(IconData iconData, Function onPressed) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: IconButton(
        onPressed: onPressed,
        color: Colors.black26,
        icon: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildOptionsScreen() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      buildButton(Icons.text_fields, () {
                        setState(() {
                          adding = true;
                          stackChildren.removeLast();
                          stackChildren.add(TextAddWidget(
                            onSelected: onSelected,
                          ));
                        });
                      }),
                      buildButton(Icons.tag_faces, () {
                        setState(() {
                          adding = true;
                          stackChildren.removeLast();
                          stackChildren.add(SmileyAddWidget(
                            onSelected: onSelected,
                          ));
                        });
                      }),
                    ],
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.save_alt,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "save",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      RaisedButton(
                        padding: EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        onPressed: () {
                          if (controller != null) {
                            showLoadingDialog();
                            controller.createStory().then((val) {
                              print(val.runtimeType);
                              if (val != null) {
                                print('tmam u abo 3amo');
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Show(val)));
                              } else {
                                key.currentState.showSnackBar(SnackBar(
                                    content:
                                        Text("Something not working happened")));
                              }
                            });
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                "Share",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Icon(Icons.send)
                          ],
                        ),
                        color: Colors.white,
                      ),
                    ],
                  ))
            ]));
  }

  void showLoadingDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 75.0,
              child: Row(
                children: <Widget>[
                  CircularProgressIndicator(),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("This may take some time"),
                  ))
                ],
              ),
            ),
          );
        },
        barrierDismissible: false);
  }

  void onSelected(Basic basic) {
    setState(() {
      adding = false;
      if (basic != null) children.add(basic);
      stackChildren.clear();
      stackChildren.add(
        StoryCreateWidget(
          children: children,
          deleteOffset: offset,
          onCompleted: (controller) {
            this.controller = controller;
          },
        ),
      );
      stackChildren.add(buildOptionsScreen());
    });
  }
}
