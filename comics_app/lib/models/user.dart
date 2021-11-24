class User {
  String displayName;
  String email;
  String uid;
  String photoUrl;

  User({this.displayName, this.email, this.uid, this.photoUrl});

  factory User.fromMap(Map<String, dynamic> map) => User(
        displayName: map['displayName'],
        email: map['email'],
        uid: map['uid'],
        photoUrl: map['photoUrl'],
      );

  Map<String, dynamic> toMap(User user) => {
        'displayName': user.displayName,
        'email': user.email,
        'uid': user.uid,
        'photoUrl': user.photoUrl
      };
}
