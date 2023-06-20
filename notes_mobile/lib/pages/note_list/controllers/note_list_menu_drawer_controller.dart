import 'package:flutter/material.dart';
import 'package:notes_mobile/data/repositories/auth_repository.dart';
import 'package:notes_mobile/globals/pages/default_message/navigation_hepers/arguments/default_message_arguments.dart';
import 'package:notes_mobile/globals/pages/default_message/navigation_hepers/default_message_navigator_helper.dart';
import 'package:notes_mobile/routes/main/main_paths.dart';

class NoteListMenuDrawerController {
  final _authRepository = AuthRepository();
  Future<void> logout({required NavigatorState navigatorState}) async {
    if (await _authRepository.logout()) {
      final arguments = DefaultMessageArguments(
        assetImage: 'assets/icons/user-slash.png',
        message: 'Logout concluído com sucesso!',
        iconColor: Colors.red,
        pageCallback: () {
          Future.delayed(const Duration(seconds: 1),
              () => navigatorState.popAndPushNamed(MainPaths.login));
        },
      );
      await DefaultMessageNavigatorHelper.navigate(
          navigatorState: navigatorState, model: arguments);
    }
  }
}
