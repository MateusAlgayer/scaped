import 'package:scaped/src/data/datasource/remote/dao/post_dao_mock.dart';

import 'db.dart';

class AppDatabase {
  AppDatabase() {
    DB.init();
  }
  PostDAOMock? _postDAO;

  PostDAOMock get postDao {
    return _postDAO ??= PostDAOMock();
  }
}
