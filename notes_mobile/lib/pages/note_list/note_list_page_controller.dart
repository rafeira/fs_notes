import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:notes_mobile/data/hive/notes/local_notes_repository.dart';
import 'package:notes_mobile/data/models/note.dart';
import 'package:notes_mobile/globals/pages/default_message/navigation_hepers/arguments/default_message_arguments.dart';
import 'package:notes_mobile/globals/pages/default_message/navigation_hepers/default_message_navigator_helper.dart';
import 'package:notes_mobile/routes/main/main_paths.dart';

class NoteListPageController {
  final noteList = <Note>[];
  final _localNotesRepository = LocalNotesRepository();
  Future<void> onPlusButtonPressed(
      NavigatorState navigatorState, StateSetter setState) async {
    final note = await _navigateToNewNotePage(navigatorState);
    if (note != null) {
      await _openNotesBox();
      await _localNotesRepository.add(note);
      setState(() => noteList.add(note));
    }
  }

  Future<void> getNotesFromBox() async {
    try {
      await _openNotesBox();
      final notes = await _localNotesRepository.getAllNotes();

      noteList.clear();
      noteList.addAll(notes);
    } on HiveError {
      rethrow;
    }
  }

  Future<void> _openNotesBox() async {
    final isBoxOpen = _localNotesRepository.isOpen();
    if (!isBoxOpen) {
      await _localNotesRepository.openBox();
    }
  }

  Future<void> onAddButtonPressed(
      NavigatorState navigatorState, StateSetter setState) async {
    final note = await _navigateToNewNotePage(navigatorState);
    if (note != null) {
      setState(() => noteList.add(note));
    }
  }

  Future<void> _navigateToNotLoggedMessage(
      NavigatorState navigatorState) async {
    final model = DefaultMessageArguments(
        assetImage: 'assets/icons/user-slash.png',
        message: 'Você não está logado!',
        confirmButtonCallback: () =>
            navigatorState.pushReplacementNamed(MainPaths.login),
        declineButtonCallback: () => navigatorState.pop());
    await DefaultMessageNavigatorHelper.navigate(
        navigatorState: navigatorState, model: model);
  }

  Future<void> onSyncButtonPressed(NavigatorState navigatorState) async {
    if (await _isLoggedIn()) {
    } else {
      await _navigateToNotLoggedMessage(navigatorState);
    }
  }

  Future<bool> _isLoggedIn() async {
    return false;
  }

  Future<Note?> _navigateToNewNotePage(NavigatorState navigatorState) async {
    final note = await navigatorState.pushNamed(MainPaths.newNote);
    if (note is Note) return note;
    return null;
  }

  void onNoteCardDismissed(Note note) {
    noteList.remove(note);
  }
}
