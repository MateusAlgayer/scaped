import 'dao/post_dao.dart';
import 'db.dart';

class AppDatabase {
  AppDatabase() {
    DB.init();
  }
  PostDAO? _postDAO;

  PostDAO get postDao {
    return _postDAO ??= PostDAO();
  }
}
