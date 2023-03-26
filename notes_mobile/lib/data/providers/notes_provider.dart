import 'package:http/http.dart' as http;
import 'package:notes_mobile/data/providers/api_provider.dart';

class NotesProvider extends ApiProvider {
  Future<http.Response> getAll() async {
    return await http.get(uri('/notes'));
  }
}
