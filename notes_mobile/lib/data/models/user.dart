import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String email;

  User({required this.id, required this.email});
  static User? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return User(id: json['id'], email: json['email']);
  }
}
