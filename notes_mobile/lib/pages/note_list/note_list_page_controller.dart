import 'package:flutter/widgets.dart';
import 'package:notes_mobile/data/models/note.dart';
import 'package:notes_mobile/globals/pages/default_message/navigation_hepers/arguments/default_message_arguments.dart';
import 'package:notes_mobile/globals/pages/default_message/navigation_hepers/default_message_navigator_helper.dart';
import 'package:notes_mobile/routes/main/main_paths.dart';

class NoteListPageController {
  final noteList = <Note>[];

  Future<void> onPlusButtonPressed(NavigatorState navigatorState,
      void Function(void Function()) setState) async {
    final note = await _navigateToNewNotePage(navigatorState);
    if (note != null) {
      setState(() => noteList.add(note));
    }
  }

  Future<void> onAddButtonPressed(NavigatorState navigatorState,
      void Function(void Function()) setState) async {
    final note = await _navigateToNewNotePage(navigatorState);
    if (note != null) {
      setState(() => noteList.add(note));
    }
  }

  Future<void> _navigateToNotLoggedMessage(
      NavigatorState navigatorState) async {
    final model = DefaultMessageArguments(
        assetImage: '',
        message: 'Ola mundo',
        confirmButtonCallback: () => debugPrint('ok'));
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
