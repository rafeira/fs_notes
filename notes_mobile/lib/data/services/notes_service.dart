import 'dart:async';

import 'package:notes_mobile/data/hive/notes/local_notes_repository.dart';
import 'package:notes_mobile/data/models/note.dart';
import 'package:notes_mobile/data/repositories/notes_repository.dart';
import 'package:notes_mobile/utils/logger_config.dart';

class NotesService {
  final _localNotesRepository = LocalNotesRepository();
  final _notesRepository = NotesRepository();

  Future<void> addInBox(Note note) async {
    try {
      await _localNotesRepository.openBox();
      await _localNotesRepository.add(note);
      await _localNotesRepository.closeBox();
    } on Exception catch (e) {
      LoggerConfig.logger.e(e);
    }
  }

  Future<List<Note>> getAllFromBox() async {
    List<Note> values;
    await _localNotesRepository.openBox();
    values = await _localNotesRepository.getAll();
    await _localNotesRepository.closeBox();
    return values;
  }

  Future<void> removeFromBox(Note note) async {
    await _localNotesRepository.openBox();
    await _localNotesRepository.remove(note);
    await _localNotesRepository.closeBox();
  }

  Future<void> addInApi(Note note) async {
    try {
      await _notesRepository.submit(note);
    } on Exception catch (_, st) {
      LoggerConfig.logger.e(st);
    }
  }

  Future<List<Note>> getAllFromApi() async => await _notesRepository.getAll();

  Future<void> removeFromApi(Note note) async {
    await _notesRepository.remove(note);
  }

  Future<void> syncronizeWithApi() async {
    final notes = await getAllFromBox();
    await _notesRepository.syncronizeWithApi(notes);
  }
}
