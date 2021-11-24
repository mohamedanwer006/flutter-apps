import 'package:flutter/material.dart';
import 'package:noteapp/models/note.dart';
import 'package:noteapp/uitls/database_helper.dart';
import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget {

 final String appBarTitle;
 final Note note;

  NoteDetail(this.note,this.appBarTitle);

  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  static var _priorities = ['High', 'Low'];

  DatabaseHelper helper=DatabaseHelper();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

    titleController.text = widget.note.title;
    descriptionController.text = widget.note.description;

    return WillPopScope(
      onWillPop: (){
        moveToLastScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.appBarTitle,style: TextStyle(
            color: Colors.white,
            letterSpacing: 10,
            fontSize: 30
          ),),
          leading: IconButton(
            icon:Icon(Icons.home),
            onPressed:moveToLastScreen ,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: ListView(
            children: <Widget>[
              ListTile(
                 leading: Text('Priority',style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.w500
                 ),),
                title: DropdownButton(
                  items: _priorities.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  style: textStyle,
                  value: getPriorityAsString(widget.note.priority),
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      debugPrint('User selected $valueSelectedByUser');
                      updatePriorityAsInt(valueSelectedByUser);
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:15,bottom: 15),
                child:TextField(
                  controller:titleController ,
                  style: textStyle,
                  onChanged: (value){
                    debugPrint('Somthing change in Title Texy Field');
                    updateTitle();
                  },
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                ) ,
              ),
              Padding(
                padding: EdgeInsets.only(top:15,bottom: 15),
                child:TextField(
                  controller:descriptionController ,
                  style: textStyle,
                  onChanged: (value){
                    debugPrint('Somthing change in Description Texy Field');
                    updateDescription();
                  },
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                  ),
                ) ,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15,bottom: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child:RaisedButton(
                          // color: Theme.of(context).primaryColorDark,
                          // textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Save',
                            textScaleFactor: 1.5,
                          ),
                          onPressed:(){
                            setState(() {
                              debugPrint('Save button clicked');
                              _save();
                            });
                          },
                        ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child:RaisedButton(
                        // color: Theme.of(context).primaryColorDark,
                        // textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Delet',
                          textScaleFactor: 1.5,
                        ),
                        onPressed:(){
                          setState(() {
                            debugPrint('Delet button clicked');
                            _delete();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void  moveToLastScreen(){
    Navigator.pop(context,true);
  }
  //convert priority from String to int
void updatePriorityAsInt(String value){
    switch(value){
      case 'High':
        widget.note.priority=1;
        break;
      case'Low':
        widget.note.priority=2;
        break;
    }
}
//convert priority from int to String
  String getPriorityAsString(int value){
    String priority;
    switch(value){
      case 1:
        priority=_priorities[0];//High
        break;
      case 2:
        priority=_priorities[1] ;//Low
        break;
    }
    return priority;
  }
void updateTitle(){
    widget.note.title=titleController.text;
}
void updateDescription(){
    widget.note.description=descriptionController.text;
}
void _save()async{
    moveToLastScreen();
    widget.note.date=DateFormat.yMMMd().format(DateTime.now());
    int result;
    if(widget.note.id!=null){
      result=await helper.updateNote(widget.note);
    }else{
      result=await helper.insertNote(widget.note);
    }

    if(result!=0){
      _showAlertDialog('Status','Note Saved Successfully');
    }else{
      _showAlertDialog('Status','Proplem Saving Note');
    }
}

void _delete()async{
    moveToLastScreen();
    //case 1:
    if(widget.note.id==null){
      _showAlertDialog('Status', 'No Note was deleted');
      return;
    }
    //case 2:
 int result = await helper.deleteNote(widget.note.id);
    if(result!=0){
      _showAlertDialog('Status', 'Note Deleted Successfully');
    }else{
      _showAlertDialog('Status', 'Error Occured while Deleting Note');
    }

}

void _showAlertDialog(String title,String message){
   AlertDialog alertDialog = AlertDialog(
      title: Text(title),
     content: Text(message),
    );
   showDialog(
     context: context,
     builder: (_)=> alertDialog
   );
}


}
