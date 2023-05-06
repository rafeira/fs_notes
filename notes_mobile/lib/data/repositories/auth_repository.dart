import 'dart:convert';

import 'package:notes_mobile/data/models/auth/response_token.dart';
import 'package:notes_mobile/data/providers/auth_provider.dart';
import 'package:notes_mobile/data/secure/repositories/local_auth_repository.dart';

class AuthRepository {
  final _provider = AuthProvider();
  final _locaAuthRepository = LocalAuthRepository();
  Future<bool> signIn({required String email, required String password}) async {
    final response = await _provider.signIn(email: email, password: password);
    if (response.statusCode == 200) {
      await _locaAuthRepository.setToken(getTokenFromHeader(response.headers));
      return true;
    }
    return false;
  }

  Map<String, dynamic> _decodedBody(String body) {
    return json.decode(body);
  }

  ResponseToken getTokenFromHeader(Map<String, String> headers) {
    final authorizationHeader = headers['authorization'];
    if (authorizationHeader != null) {
      return ResponseToken.fromHeader(authorizationHeader);
    }
    throw 'Absence of authorization header';
  }
}
