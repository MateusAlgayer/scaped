import 'package:scaped/src/data/datasource/remote/dao/interfaces/i_crud.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../domain/models/post.dart';

class PostDAO implements ICRUD<Post> {
  PostDAO();

  @override
  Future<bool> delete(Post data) async {
    try {
      await Supabase.instance.client.from('posts').delete().eq('id', data.id);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Post>> getAll() async {
    return (await Supabase.instance.client
            .from('posts')
            .select<List<Map<String, dynamic>>>('*, profiles(*)')
            .order('updated_at, created_at'))
        .map((e) => Post.fromMap(e))
        .toList();
  }

  @override
  Future<bool> insert(Post data) async {
    try {
      await Supabase.instance.client.from('posts').insert({
        'title': data.title,
        'issue': data.issue,
        'user_uuid': Supabase.instance.client.auth.currentUser!.id,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> update(Post data) async {
    try {
      await Supabase.instance.client.from('posts').update({
        'title': data.title,
        'issue': data.issue,
        'updated_at': DateTime.now(),
        'user_uuid': Supabase.instance.client.auth.currentUser!.id,
      }).eq('id', data.id);
      return true;
    } catch (e) {
      return false;
    }
  }
}
