import 'package:flutter/material.dart';
import 'package:notes_mobile/globals/pages/default_message/navigation_hepers/arguments/default_message_arguments.dart';
import 'package:notes_mobile/globals/widgets/default_app_bar.dart';
import 'package:notes_mobile/globals/widgets/default_scaffold.dart';

class DefaultMessagePage extends StatelessWidget {
  const DefaultMessagePage({super.key});

  DefaultMessageArguments _getArguments(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments is DefaultMessageArguments) {
      return ModalRoute.of(context)!.settings.arguments
          as DefaultMessageArguments;
    } else {
      throw 'Invalid argument format!';
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = _getArguments(context);
    return DefaultScaffold(
        appBar: const DefaultAppBar(),
        body: Column(
          children: [Text(arguments.message)],
        ));
  }
}
