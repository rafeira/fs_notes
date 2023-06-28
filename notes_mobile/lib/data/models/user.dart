import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String email;
  @HiveField(2)
  String? firstName;
  @HiveField(3)
  String? lastName;
  @HiveField(4)
  String? status;

  String get fullName => "$firstName $lastName";

  User(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.status,
      required this.lastName});

  static User? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return User(
        id: json['id'],
        email: json['email'],
        status: json['status'],
        firstName: json['first_name'],
        lastName: json['last_name']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'first_name': firstName,
        'status': status,
        'last_name': lastName
      };
}
