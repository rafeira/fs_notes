import 'package:notes_mobile/data/models/auth/current_user.dart';
import 'package:notes_mobile/data/models/auth/response_token.dart';
import 'package:notes_mobile/data/models/user.dart';
import 'package:notes_mobile/data/secure/providers/local_auth.dart';

class LocalAuthRepository {
  final _localAuth = LocalAuth();

  Future<void> setCurrentUser(
      {required Map<String, dynamic> userMap,
      required String? authorizationHeader}) async {
    if (authorizationHeader == null) throw 'Absence of authorization header';
    final currentUser = CurrentUser(
        user: User.fromJson(userMap)!,
        token: ResponseToken.fromHeaderValue(authorizationHeader));
    await _localAuth.setCurrentUser(currentUser);
  }

  Future<void> clearCurrentUser() async => await _localAuth.clearCurrentUser();

  Future<CurrentUser?> get currentUser async => await _localAuth.getCurrentUser();
}
