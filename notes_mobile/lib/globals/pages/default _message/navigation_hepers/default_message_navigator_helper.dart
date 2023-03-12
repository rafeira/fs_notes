import 'package:flutter/widgets.dart';
import 'package:notes_mobile/globals/pages/default%20_message/navigation_hepers/arguments/default_message_arguments.dart';
import 'package:notes_mobile/routes/main/main_paths.dart';

class DefaultMessageNavigatorHelper {
  static Future<void> navigate(
      {required NavigatorState navigatorState,
      required DefaultMessageArguments model}) async {
    await navigatorState.pushNamed(MainPaths.defaultMessage, arguments: model);
  }
}
