import 'dart:convert';

import 'package:notes_mobile/data/providers/auth_provider.dart';
import 'package:notes_mobile/data/secure/repositories/local_auth_repository.dart';
import 'package:notes_mobile/utils/logger_config.dart';

class AuthRepository {
  final _provider = AuthProvider();
  final _localAuthRepository = LocalAuthRepository();
  Future<bool> signIn({required String email, required String password}) async {
    final response = await _provider.signIn(email: email, password: password);
    if (response.statusCode == 200) {
      final decodedResponseBody = _decodedBody(response.body);
      await _localAuthRepository.setCurrentUser(
          authorizationHeader: response.headers['authorization'],
          userMap: decodedResponseBody['user']);
      return true;
    }
    return false;
  }

  Future<bool> isSignedIn() async {
    return (await _localAuthRepository.currentUser) != null;
  }

  Map<String, dynamic> _decodedBody(String body) {
    return json.decode(body);
  }

  Future<bool> logout() async {
    final currentUser = await _localAuthRepository.currentUser;
    final token = currentUser?.token;
    if (token == null) {
      LoggerConfig.logger.e('Token null!');
      return false;
    }
    await _provider.logout(token);
    await _localAuthRepository.clearCurrentUser();
    return true;
  }
}
