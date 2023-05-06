import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:notes_mobile/data/models/auth/current_user.dart';

class LocalAuth {
  static const key = "session";
  final _storage = const FlutterSecureStorage();

  Future<void> setCurrentUser(CurrentUser currentUser) async {
    await _storage.write(key: key, value: jsonEncode(currentUser.toJson()));
  }

  Future<void> clearCurrentUser() async {
    await _storage.delete(key: key);
  }

  Future<void> clearToken() async {
    final currentUser = await getCurrentUser();
    if (currentUser != null) {
      currentUser.token = null;
      await setCurrentUser(currentUser);
    }
  }

  Future<CurrentUser?> getCurrentUser() async {
    final data = await _storage.read(key: key);
    if (data != null) return CurrentUser.fromJson(jsonDecode(data));
    return null;
  }
}
