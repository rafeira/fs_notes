import 'package:flutter/material.dart';
import 'package:notes_mobile/globals/pages/default_message/navigation_hepers/arguments/default_message_arguments.dart';
import 'package:notes_mobile/globals/widgets/default_app_bar.dart';
import 'package:notes_mobile/globals/widgets/default_scaffold.dart';
import 'package:notes_mobile/pages/login/local_widgets/default_button.dart';

class DefaultMessagePage extends StatefulWidget {
  const DefaultMessagePage({super.key});

  @override
  State<DefaultMessagePage> createState() => _DefaultMessagePageState();
}

class _DefaultMessagePageState extends State<DefaultMessagePage> {
  DefaultMessageArguments _getArguments(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments is DefaultMessageArguments) {
      return ModalRoute.of(context)!.settings.arguments
          as DefaultMessageArguments;
    } else {
      throw 'Invalid argument format!';
    }
  }

  late DefaultMessageArguments arguments;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    arguments = _getArguments(context);
    _executeCallback();
    super.didChangeDependencies();
  }

  void _executeCallback() {
    arguments.pageCallback?.call();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        appBar: const DefaultAppBar(),
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (arguments.assetImage != null)
                Image(
                  image: AssetImage(arguments.assetImage!),
                  width: 120.0,
                  height: 120.0,
                  color: arguments.iconColor,
                ),
              Text(
                arguments.message,
                textAlign: arguments.textMessageAlignment,
                style: const TextStyle(fontSize: 25.0, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DefaultButton(
                    title: 'Voltar',
                    onTap: arguments.declineButtonCallback,
                    backgroundColor: Colors.blue,
                    borderColor: const Color.fromARGB(255, 86, 172, 241),
                  ),
                  if (arguments.confirmButtonCallback != null)
                    DefaultButton(
                      title: arguments.confirmButtonText ?? 'Fazer login',
                      onTap: arguments.confirmButtonCallback,
                    )
                ],
              )
            ],
          ),
        ));
  }
}
