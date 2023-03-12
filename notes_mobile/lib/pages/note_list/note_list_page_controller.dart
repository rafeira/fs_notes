import 'package:flutter/widgets.dart';
import 'package:notes_mobile/data/models/note.dart';
import 'package:notes_mobile/globals/pages/default_message/navigation_hepers/arguments/default_message_arguments.dart';
import 'package:notes_mobile/globals/pages/default_message/navigation_hepers/default_message_navigator_helper.dart';
import 'package:notes_mobile/routes/main/main_paths.dart';

class NoteListPageController {
  final noteList = <Note>[];

  Future<void> onPlusButtonPressed(NavigatorState navigatorState) async {
    await _navigateToNewNotePage(navigatorState);
  }

  Future<void> onAddButtonPressed(NavigatorState navigatorState) async {
    await _navigateToNewNotePage(navigatorState);
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

  Future<void> _navigateToNewNotePage(NavigatorState navigatorState) async {
    await navigatorState.pushNamed(MainPaths.newNote);
  }
}
