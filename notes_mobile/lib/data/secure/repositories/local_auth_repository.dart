import 'package:notes_mobile/data/models/auth/response_token.dart';
import 'package:notes_mobile/data/secure/providers/local_auth.dart';

class LocalAuthRepository {
  final _localAuth = LocalAuth();

  Future<void> setToken(ResponseToken token) async =>
      await _localAuth.setToken(token);

  Future<void> clearToken() async => await _localAuth.clearToken();

  Future<ResponseToken?> get session async => await _localAuth.getToken();
}
