import 'package:notes_mobile/data/hive/hive_repository.dart';

class CredentialsRepository extends HiveRepository<String> {
  @override
  String? get boxName => 'credentials';

  final String emailKey = 'email';
  final String passwordKey = 'username';

  String? getUsername() {
    return box!.get(emailKey);
  }

  String? getPassword() {
    return box!.get(passwordKey);
  }

  Future<void> setUsername(String value) async {
    return await box!.put(emailKey, value);
  }

  Future<void> setPassword(String value) async {
    return await box!.put(passwordKey, value);
  }

  Future<void> clearCredentials() async {
    await box!.clear();
  }
}
