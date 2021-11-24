class User {
  String username;
  String password;
  int age;
  int id;

  User(this.username, this.password, this.age);
  User.map(dynamic obj) {
    this.username = obj['username'];
    this.password = obj['password'];
    this.age = obj['age'];
    this.id = obj['id'];
  }

  String get _username=>username;
  String get _password=>password;
  int get _age=>age;
  int get _id=>id;

  Map<String,dynamic> toMap(){
    var map =new Map<String,dynamic>();
    map['username']=_username;
    map['password']=_password;
    map['age']=_age;
    if(id != null){
      map['id']=_id;
    }
    return map;
  }

  User.fromMap(Map<String,dynamic> map){
    this.username = map['username'];
    this.password = map['password'];
    this.age = map['age'];
    this.id = map['id'];
  }

}
