import 'dart:convert';

import 'package:notes_mobile/data/models/note.dart';
import 'package:notes_mobile/data/providers/notes_provider.dart';

class NotesRepository {
  final _provider = NotesProvider();
  Future<List<Note>> getAll() async {
    final response = await _provider.getAll();
    final jsonNotes = _decodedIterableBody(response.body);
    return jsonNotes.map((e) => Note.fromJson(e)).toList();
  }

  Future<Note> submit(Note note) async {
    final response = await _provider.submit({'note': note.toJson()});
    final jsonNote = _decodedBody(response.body);
    return Note.fromJson(jsonNote);
  }

  Future<bool> remove(Note note) async {
    if (note.id != null) {
      await _provider.delete(note.id!);
      return true;
    }
    return false;
  }

  Future<bool> syncronizeWithApi(List<Note> notes) async {
    final response = await _provider
        .firstSyncronization({'notes': notes.map((e) => e.toJson()).toList()});
    return response.statusCode == 201;
  }

  Iterable _decodedIterableBody(String body) {
    return json.decode(body);
  }

  Map<String, dynamic> _decodedBody(String body) {
    return json.decode(body);
  }
}
