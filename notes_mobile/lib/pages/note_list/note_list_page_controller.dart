import 'package:flutter/widgets.dart';
import 'package:notes_mobile/data/models/note.dart';
import 'package:notes_mobile/globals/pages/default%20_message/navigation_hepers/arguments/default_message_arguments.dart';
import 'package:notes_mobile/globals/pages/default%20_message/navigation_hepers/default_message_navigator_helper.dart';

class NoteListPageController {
  final noteList = <Note>[];

  Future<void> onPlusButtonPressed(NavigatorState navigatorState) async {}

  Future<void> onAddButtonPressed(NavigatorState navigatorState) async {}

  Future<void> _navigateToNotLoggedMessage(
      NavigatorState navigatorState) async {
    final model = DefaultMessageArguments(
        assetImage: '',
        message: 'Ola mundo',
        confirmButtonCallback: () => print('confirm'));
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
}
