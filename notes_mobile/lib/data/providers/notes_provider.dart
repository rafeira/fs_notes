import 'package:http/http.dart' as http;
import 'package:notes_mobile/data/providers/api_provider.dart';

class NotesProvider extends ApiProvider {
  Future<http.Response> getAll() async {
    return await http.get(uri('/notes'));
  }

  Future<http.Response> submit(Map<String, dynamic> body) async {
    return await http.post(uri('/notes'), body: body);
  }

  Future<void> delete(int noteId) async {
    await http.delete(uri("/notes/$noteId"));
  }
}
