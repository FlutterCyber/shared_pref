class News {
  int? userId;
  int? id;
  String? title;
  String? body;

  News({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  News.fromJson(Map<String, dynamic> map)
      : userId = map['userId'],
        id = map['id'],
        title = map['title'],
        body = map['body'];

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
