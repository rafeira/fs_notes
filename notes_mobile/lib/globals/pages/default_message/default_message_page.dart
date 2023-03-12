import 'package:flutter/widgets.dart';
import 'package:notes_mobile/globals/pages/default_message/navigation_hepers/arguments/default_message_arguments.dart';
import 'package:notes_mobile/globals/widgets/default_app_bar.dart';
import 'package:notes_mobile/globals/widgets/default_scaffold.dart';

class DefaultMessagePage extends StatefulWidget {
  const DefaultMessagePage({super.key});

  @override
  State<DefaultMessagePage> createState() => _DefaultMessagePageState();
}

class _DefaultMessagePageState extends State<DefaultMessagePage> {
  DefaultMessageArguments? arguments;

  void _setArguments(BuildContext context) {
    arguments ??=
        ModalRoute.of(context)!.settings.arguments as DefaultMessageArguments;
  }

  @override
  Widget build(BuildContext context) {
    _setArguments(context);
    return DefaultScaffold(
        appBar: const DefaultAppBar(),
        body: Column(
          children: [Text(arguments!.message)],
        ));
  }
}
