class RequestBody {
  int? userId;
  int? id;
  String? title;
  String? body;

  RequestBody({this.userId, this.id, this.title, this.body});

  @override
  String toString() {
    return 'RequestBody(userId: $userId, id: $id, title: $title, body: $body)';
  }

  factory RequestBody.fromJson(Map<String, dynamic> json) => RequestBody(
        userId: json['userId'] as int?,
        id: json['id'] as int?,
        title: json['title'] as String?,
        body: json['body'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}
