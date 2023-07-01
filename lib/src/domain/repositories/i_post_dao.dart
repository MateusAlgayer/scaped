import '../models/post.dart';

abstract interface class IPostDAO {
  Future<List<Post>> getPosts();
  Future<bool> insertPost(Post post);
  Future<bool> updatePost(Post post);
  Future<bool> deletePost(Post post);
}
