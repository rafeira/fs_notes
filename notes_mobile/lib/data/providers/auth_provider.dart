import 'package:notes_mobile/data/providers/api_provider.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ApiProvider {
  Future<http.Response> signIn(
      {required String email, required String password}) async {
    return await http.post(uri('/users/sign_in'), body: {
      'user': {'email': email, 'password': password}
    });
  }
}
