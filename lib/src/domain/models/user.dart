class User {
  String uuid;
  String name;
  String lastName;
  String avatar;

  User({
    required this.uuid,
    required this.name,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromMap(Map<String, dynamic> e) {
    return User(
      uuid: e['id'],
      name: e['name'],
      lastName: e['last_name'],
      avatar: e['avatar'] ?? '',
    );
  }
}
