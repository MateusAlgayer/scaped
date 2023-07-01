import 'user.dart';

class Post {
  int id;
  DateTime createdAt;
  String title;
  String issue;
  User author;

  Post({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.issue,
    required this.author,
  });
}
