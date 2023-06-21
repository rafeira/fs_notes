import 'package:notes_mobile/constants/apis/api_urls.dart';
import 'package:notes_mobile/data/secure/repositories/local_auth_repository.dart';

abstract class ApiProvider {
  final _localAuthRepository = LocalAuthRepository();

  Future<String?> get token async =>
      (await _localAuthRepository.currentUser)?.token?.value;
  final domain = ApiUrls.developmentUrl;
  final version = ApiUrls.v1Version;
  Future<Map<String, String>> get defaultHeaders async {
    final tokenValue = await token;
    return {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/json',
      if (tokenValue != null) 'Authorization': 'Bearer ${await token}',
    };
  }

  Uri uri([String route = '']) => Uri.http(domain, version + route);
}
