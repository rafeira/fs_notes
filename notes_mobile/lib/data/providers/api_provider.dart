import 'package:notes_mobile/constants/apis/api_urls.dart';

abstract class ApiProvider {
  final domain = ApiUrls.developmentUrl;
  final version = ApiUrls.v1Version;
  final defaultHeaders = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/json',
  };
  Uri uri([String route = '']) => Uri.http(domain, version + route);
}
