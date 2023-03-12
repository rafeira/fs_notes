import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_mobile/globals/pages/default%20_message/navigation_hepers/arguments/default_message_arguments.dart';
import 'package:notes_mobile/globals/widgets/default_scaffold.dart';

class DefaultMessagePage extends StatelessWidget {
  DefaultMessagePage({super.key});
  DefaultMessageArguments? arguments;
  void _setArguments(BuildContext context) {
    arguments ??=
        ModalRoute.of(context)!.settings.arguments as DefaultMessageArguments;
    print('ok');
  }

  @override
  Widget build(BuildContext context) {
    _setArguments(context);
    return DefaultScaffold(
        body: Column(
      children: [Text(arguments!.message)],
    ));
  }
}
