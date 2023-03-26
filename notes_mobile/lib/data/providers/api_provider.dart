import 'package:notes_mobile/constants/apis/api_urls.dart';

abstract class ApiProvider {
  final domain = ApiUrls.developmentUrl;
  final version = ApiUrls.v1Version;
  Uri uri([String route = '']) => Uri.http(domain, version + route);
}
