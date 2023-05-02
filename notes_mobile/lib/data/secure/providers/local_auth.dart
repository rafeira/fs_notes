import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:notes_mobile/data/models/response_token.dart';

class LocalAuth {
  static const key = "session";
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> setToken(ResponseToken token) async {
    await _storage.write(key: key, value: jsonEncode(token.toJson()));
  }

  Future<void> clearToken() async {
    await _storage.delete(key: key);
  }

  Future<ResponseToken?> getToken() async {
    final data = await _storage.read(key: key);
    if (data != null) return ResponseToken.fromJson(jsonDecode(data));
    return null;
  }
}
