import 'package:hive/hive.dart';
import 'package:notes_mobile/data/hive/hive_repository.dart';
import 'package:notes_mobile/data/models/note.dart';

class LocalNotesRepository extends HiveRepository<Note> {
  @override
  String? get boxName => 'notes';
  Future<void> add(Note note) async {
    try {
      await box.add(note);
    } on HiveError {
      rethrow;
    }
  }

  Future<List<Note>> getAllNotes() async {
    try {
      return box.values.toList();
    } on HiveError {
      rethrow;
    }
  }

  Future<void> remove(Note note) async {
    await note.delete();
  }
}
