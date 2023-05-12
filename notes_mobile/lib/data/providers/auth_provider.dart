import 'dart:convert';

import 'package:notes_mobile/data/models/auth/response_token.dart';
import 'package:notes_mobile/data/providers/api_provider.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ApiProvider {
  Future<http.Response> signIn(
      {required String email, required String password}) async {
    final encodedBody = jsonEncode({
      'user': {'email': email, 'password': password}
    });
    return await http.post(uri('/users/sign_in'),
        headers: defaultHeaders, body: encodedBody);
  }

  Future<http.Response> logout(ResponseToken token) async {
    return await http.delete(uri('/users/sign_out'), headers: defaultHeaders);
  }
}
