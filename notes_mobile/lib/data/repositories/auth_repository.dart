import 'dart:convert';

import 'package:notes_mobile/data/providers/auth_provider.dart';

class AuthRepository {
  final _provider = AuthProvider();
  Future<void> signIn({required String email, required String password}) async {
    final response = await _provider.signIn(email: email, password: password);
    final jsonNotes = _decodedIterableBody(response.body);
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
