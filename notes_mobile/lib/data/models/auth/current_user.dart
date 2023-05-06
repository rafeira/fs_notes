import 'package:notes_mobile/data/models/auth/response_token.dart';
import 'package:notes_mobile/data/models/user.dart';

class CurrentUser {
  User user;
  final ResponseToken? token;

  CurrentUser({required this.user, this.token});
  bool isLogged() => token != null;

  static CurrentUser? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final userJson = json['user'];
    if (userJson == null) throw 'User must not be null';

    return CurrentUser(user: userJson, token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {'user': user.toJson(), 'token': token?.toJson()};
  }
}
