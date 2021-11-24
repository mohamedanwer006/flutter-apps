class Note {

  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Note(this._title, this._date, this._priority, [this._description]);
  Note.withId(this._id, this._title, this._date, this._priority,
      [this._description]);

  int get id => _id;
  String get title => _title;
  int get priority => _priority;
  String get description => _description;
  String get date => _date;


  set priority(int value) {
    if (value >= 1 && value <= 2) _priority = value;
  }

  set date(String value) {
    _date = value;
  }

  set description(String value) {
    if (value.length <= 255) _description = value;
  }

  set title(String value) {
    if (value.length <= 255) _title = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;
    map['priority'] = _priority;
    return map;
  }

  Note.fromMap(Map<String,dynamic> map){
    this._id=map['id'];
    this._title=map['title'];
    this._description=map['description'];
    this._priority=map['priority'];
    this._date=map['date'];
  }

}
