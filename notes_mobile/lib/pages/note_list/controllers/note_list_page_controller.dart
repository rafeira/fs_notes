import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_mobile/data/services/notes_service.dart';
import 'package:notes_mobile/data/models/note.dart';
import 'package:notes_mobile/data/repositories/auth_repository.dart';
import 'package:notes_mobile/globals/pages/default_message/navigation_hepers/arguments/default_message_arguments.dart';
import 'package:notes_mobile/globals/pages/default_message/navigation_hepers/default_message_navigator_helper.dart';
import 'package:notes_mobile/routes/main/main_paths.dart';

class NoteListPageController {
  final noteList = <Note>[];

  final _authRepository = AuthRepository();
  final _notesService = NotesService();
  Future<bool> get isLoggedIn async => await _authRepository.isSignedIn();

  Future<void> onPlusButtonPressed(
      NavigatorState navigatorState, StateSetter setState) async {
    final note = await _navigateToNewNotePage(navigatorState);
    if (note != null) {
      await _notesService.addInBox(note);
      setState(() => noteList.add(note));
    }
  }

  Future<List<Note>> _getNotes() async {
    return await isLoggedIn
        ? await _getNotesFromApi()
        : await _getNotesFromBox();
  }

  Future<List<Note>> _getNotesFromApi() async {
    return await _notesService.getAllFromApi();
  }

  Future<void> updateNoteList(StateSetter setter) async {
    final notes = await _getNotes();
    setter(() {
      noteList.clear();
      noteList.addAll(notes);
    });
  }

  Future<List<Note>> _getNotesFromBox() async {
    return await _notesService.getAllFromBox();
  }

  Future<void> onAddButtonPressed(
      NavigatorState navigatorState, StateSetter setState) async {
    final note = await _navigateToNewNotePage(navigatorState);
    if (note != null) {
      await _addNote(note);
      setState(() => noteList.add(note));
    }
  }

  Future<void> _navigateToNotLoggedMessage(
      NavigatorState navigatorState) async {
    final model = DefaultMessageArguments(
      assetImage: 'assets/icons/user-slash.png',
      message: 'Você não está logado!',
      iconColor: Colors.white,
      confirmButtonCallback: () =>
          navigatorState.popAndPushNamed(MainPaths.login),
      declineButtonCallback: navigatorState.pop,
    );
    await DefaultMessageNavigatorHelper.navigate(
        navigatorState: navigatorState, model: model);
  }

  Future<void> onSyncButtonPressed(NavigatorState navigatorState) async {
    if (await isLoggedIn) {
    } else {
      await _navigateToNotLoggedMessage(navigatorState);
    }
  }

  Future<Note?> _navigateToNewNotePage(NavigatorState navigatorState) async {
    final note = await navigatorState.pushNamed(MainPaths.newNote);
    if (note is Note) return note;
    return null;
  }

  Future<void> onNoteCardDismissed(Note note, StateSetter setState) async {
    await _removeNote(note);
    setState(() => {noteList.remove(note)});
  }

  Future<void> _addNote(Note note) async {
    if (await isLoggedIn) {
      await _notesService.addInApi(note);
      return;
    }
    await _notesService.addInBox(note);
  }

  Future<void> _removeNote(Note note) async {
    if (await isLoggedIn) {
      await _notesService.removeFromApi(note);
      return;
    }
    await _notesService.removeFromBox(note);
  }
}
