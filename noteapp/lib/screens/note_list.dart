import 'package:flutter/material.dart';
import 'package:noteapp/screens/note-detail.dart';
import 'package:noteapp/uitls/theme.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:noteapp/models/note.dart';
import 'package:noteapp/uitls/database_helper.dart';
import 'package:provider/provider.dart';

class NoteList extends StatefulWidget {
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  List<Note> noteList;
  int count = 0;
  void changeTheme() async {}
  @override
  Widget build(BuildContext context) {
    ThemeChange _themeChange = Provider.of<ThemeChange>(context);
    if (noteList == null) {
      noteList = List<Note>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.lightbulb_outline,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                (_themeChange.getTheme() == myDark)
                    ? _themeChange.setTheme(ThemeData.light())
                    : _themeChange.setTheme(myDark);
              })
        ],
        centerTitle: true,
        title: Text('TODO'),
        textTheme: TextTheme(
            title: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.white,
                letterSpacing: 10)),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        onPressed: () {
          debugPrint('FAB clicked');
          navigate(Note('', '', 2), 'Add New');
        },
        tooltip: 'Add Note',
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          elevation: 2,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      getPriorityColor(this.noteList[position].priority),
                  child: getPriorityIcon(this.noteList[position].priority),
                ),
                title: Text(
                  this.noteList[position].title,
                  style: titleStyle,
                ),
                subtitle: Text(this.noteList[position].date),
                trailing: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.blueAccent,
                  ),
                  onTap: () {
                    _delete(context, noteList[position]);
                  },
                ),
                onTap: () {
                  debugPrint('ListTile Tapped');
                  navigate(this.noteList[position], 'Edit Note');
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25, left: 35),
                  child: Text(this.noteList[position].description??''),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  //return priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;
      default:
        return Colors.yellow;
    }
  }

  //return priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.label_important);
        break;
      case 2:
        return Icon(Icons.play_arrow);
        break;
      default:
        return Icon(Icons.play_arrow);
    }
  }

//for deleting note
  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigate(Note note, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note, title);
    }));
    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
