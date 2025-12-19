
// user_model.dart
class User {
  final int id;
  final String username;
  final String name;
  final int notesCount;
  final String token;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.notesCount,
    required this.token,
  });

  User copyWith({
    int? id,
    String? username,
    String? name,
    int? notesCount,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      name: name ?? this.name,
      notesCount: notesCount ?? this.notesCount,
      token: token ?? this.token,
    );
  }
}