import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:notes_mobile/data/providers/api_provider.dart';

class NotesProvider extends ApiProvider {
  Future<http.Response> getAll() async {
    return await http.get(uri('/notes'), headers: await defaultHeaders);
  }

  Future<http.Response> submit(Map<String, dynamic> body) async {
    return await http.post(uri('/notes'),
        body: json.encode(body), headers: await defaultHeaders);
  }

  Future<void> delete(int noteId) async {
    await http.delete(uri("/notes/$noteId"), headers: await defaultHeaders);
  }

  Future<http.Response> firstSyncronization(Map<String, dynamic> notes) async {
    return await http.post(uri("/notes/first_sync"),
        body: json.encode(notes), headers: await defaultHeaders);
  }
}
