import 'package:scaped/src/data/datasource/remote/dao/interfaces/i_crud.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../domain/models/post.dart';

class PostDAO implements ICRUD<Post> {
  PostDAO();

  @override
  Future<bool> delete(Post data) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getAll() async {
    List<Map<String, dynamic>> res = await Supabase.instance.client.from('posts').select<List<Map<String, dynamic>>>('*, profiles(*)');
    return res.map((e) => Post.fromMap(e)).toList();
  }

  @override
  Future<bool> insert(Post data) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Post data) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
