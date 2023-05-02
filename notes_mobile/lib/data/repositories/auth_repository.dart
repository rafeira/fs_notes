import 'dart:convert';

import 'package:notes_mobile/data/models/response_token.dart';
import 'package:notes_mobile/data/providers/auth_provider.dart';
import 'package:notes_mobile/data/secure/repositories/local_auth_repository.dart';

class AuthRepository {
  final _provider = AuthProvider();
  final _locaAuthRepository = LocalAuthRepository();
  Future<void> signIn({required String email, required String password}) async {
    final response = await _provider.signIn(email: email, password: password);
    final userMap = _decodedIterableBody(response.body);
    await _locaAuthRepository.setToken(getTokenFromHeader(response.headers));
  }

  Iterable _decodedIterableBody(String body) {
    return json.decode(body);
  }

  ResponseToken getTokenFromHeader(Map<String, String> headers) {
    final authorizationHeader = headers['Authorization'];
    if (authorizationHeader != null) {
      return ResponseToken.fromHeader(authorizationHeader);
    }
    throw 'Absence of authorization header';
  }
}
