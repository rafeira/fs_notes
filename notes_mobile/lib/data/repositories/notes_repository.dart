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

  Iterable _decodedIterableBody(String body) {
    return json.decode(body);
  }
}
