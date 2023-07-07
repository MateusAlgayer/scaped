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

  factory Post.fromMap(Map<String, dynamic> e) {
    return Post(
      id: e['id'],
      createdAt: DateTime.tryParse(e['created_at']) ?? DateTime(1899, 01, 01),
      title: e['title'],
      issue: e['issue'],
      author: User.fromMap(e['profiles']),
    );
  }
}
