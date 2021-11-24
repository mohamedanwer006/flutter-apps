import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:noteapp/models/note.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; //Singleton DatabaseHelper
  static Database _database; //singleton database
  
  //database table
  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance(); //Named constructor to create instance of DatabaseHelper
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper =
          DatabaseHelper._createInstance(); //This executed only once
    }
    return _databaseHelper;
  }

  Future<Database> get database async{
    if(_database==null){
      _database=await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT,'
        '$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)'); //sql statement
  }

//fetch operation :get all objects from db
 Future<List<Map<String,dynamic>>>getNoteMapList()async{
    Database db=await this.database;
//    var result=await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result=await db.query(noteTable,orderBy:' $colPriority ASC');
    return result;
 }
//insert obj
 Future<int> insertNote(Note note)async{
    Database db = await this.database;
    var result =await db.insert(noteTable,note.toMap() );
    return result;
}
//update obj
  Future<int> updateNote(Note note)async{
    Database db = await this.database;
    int result =await db.update(noteTable,note.toMap(),where: '$colId = ?',whereArgs: [note.id]);
    return result;
  }
//delete obj
  Future<int> deleteNote(id)async{
    Database db = await this.database;
//    int result =await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    int result =await db.delete(noteTable,where: '$colId = ?',whereArgs: [id]);
    return result;
  }
//get number of note
  Future<int> getCount()async{
    Database db = await this.database;
    List<Map<String,dynamic>>x =await db.rawQuery('SELET COUNT (*) FROM $noteTable');
    int result=Sqflite.firstIntValue(x);
    return result;
  }
//get List <Map> and convert it to List <Note>
Future<List<Note>> getNoteList()async{
 var noteMapList= await getNoteMapList();
 int count = noteMapList.length;
 List<Note> noteList =List<Note>();
 for(int i=0;i<count;i++){
   noteList.add(Note.fromMap(noteMapList[i]));
 }
 return noteList;
}
}
