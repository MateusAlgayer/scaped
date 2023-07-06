import 'package:scaped/src/data/datasource/remote/dao/interfaces/i_crud.dart';
import 'package:scaped/src/domain/models/user.dart';

import '../../../../domain/models/post.dart';

class PostDAOMock implements ICRUD<Post> {
  final List<Post> lista = [
    Post(
      id: 123,
      createdAt: DateTime.now(),
      title: 'Post teste',
      issue: 'dsaudhsiufusdafhdhaufhsafsihufhsdaufusadifhusadfhusadifus',
      author: User(
        uuid: 3123123123123,
        name: 'MateusAlgayer',
        lastName: 'Algayer',
        avatar: 'avatar',
      ),
    ),
    Post(
      id: 123,
      createdAt: DateTime.now(),
      title: 'Post teste',
      issue: 'dsaudhsiufusdafhdhaufhsafsihufhsdaufusadifhusadfhusadifus',
      author: User(
        uuid: 3123123123123,
        name: 'MateusAlgayer',
        lastName: 'Algayer',
        avatar: 'avatar',
      ),
    ),
    Post(
      id: 123,
      createdAt: DateTime.now(),
      title: 'Post teste',
      issue: 'dsaudhsiufusdafhdhaufhsafsihufhsdaufusadifhusadfhusadifus',
      author: User(
        uuid: 3123123123123,
        name: 'MateusAlgayer',
        lastName: 'Algayer',
        avatar: 'avatar',
      ),
    ),
  ];

  @override
  Future<bool> delete(Post data) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getAll() async {
    // TODO: implement getAll
    return lista;
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
