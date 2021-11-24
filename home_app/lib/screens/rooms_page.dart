import 'package:flutter/material.dart';
import 'package:home_app/components/list_collection_card.dart';
import 'package:home_app/models/collections.dart';
import 'package:home_app/services/api/collection.dart';
import 'package:home_app/services/provider/collection_provider.dart';
import 'package:home_app/theme/theme_changer.dart';
import 'package:home_app/utils/utilities.dart';
import 'package:provider/provider.dart';

class RoomsPage extends StatefulWidget {
  static const route = '/rooms';
  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  CollectionServices _collectionServices = CollectionServices();
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              Navigator.of(context).pop();
            }),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Rooms',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Consumer<ThemeChanger>(
        builder: (context, theme, child) => Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: Provider.of<CollectionProvider>(context).collections,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Collection> collections = snapshot.data;
                      return ListView.builder(
                        shrinkWrap: false,
                        scrollDirection: Axis.vertical,
                        itemCount: collections.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: Key(collections[index].id),
                            onDismissed: (direction) async {
                              try {
                                showLoading();
                                var res = await _collectionServices
                                    .deleteCollection(collections[index].id);
                                collections.removeAt(index);   
                                if (res) {
                                  Future<List<Collection>> colls() async {
                                    var colls = collections;
                                    return colls;
                                  }
                                  Provider.of<CollectionProvider>(context)
                                      .setCollections(colls());
                                  Navigator.pop(context);
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            direction: DismissDirection.startToEnd,
                            background: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 40),
                                // margin: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  color: Colors.white,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(
                                    screenWidth(context, 15),
                                  ),
                                ),
                              ),
                            ),
                            child: ListCollectionCard(
                              image: collections[index].picture,
                              title: collections[index].name ?? 'No name',
                              onTap: () {
                                print("${collections[index].id}");
                              },
                            ),
                          );
                        },
                      );
                    } else
                      return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addSelectetdRooms() {}
  showWarningDialog(String name) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(child: Text('Warning⚠⚠')),
        content: Text('Are you sure,want to remove $name room'),
        actions: [
          RaisedButton(
            child: Text('yes'),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      // useSafeArea: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).backgroundColor,
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          ),
        );
      },
    );
  }
}
