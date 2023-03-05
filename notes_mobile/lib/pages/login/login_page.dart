import 'package:flutter/material.dart';
import 'package:notes_mobile/globals/widgets/default_circular_progress_indicator.dart';
import 'package:notes_mobile/globals/widgets/default_scaffold.dart';
import 'package:notes_mobile/pages/login/controllers/login_page_controller.dart';
import 'package:notes_mobile/pages/login/local_widgets/auth_text_field.dart';
import 'package:notes_mobile/pages/login/local_widgets/auth_title.dart';
import 'package:notes_mobile/pages/login/local_widgets/default_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginPageController controller;

  final divider = const SizedBox(
    height: 30,
  );
  bool get isLoading => controller.isLoading;
  @override
  void initState() {
    controller = LoginPageController(context: context)..setCredentials();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      bodyPadding: const EdgeInsets.all(15.0),
      body: Form(
        key: controller.loginFormKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const AuthTitle(
            title: 'Login',
          ),
          divider,
          DefaultCircularProgressIndicator(
            divider: divider,
            isBig: isLoading,
          ),
          AuthTextField(
            hintText: 'email@email.com',
            suffix: const Icon(
              Icons.alternate_email_rounded,
              color: Colors.blue,
            ),
            label: 'Email',
            enabled: !isLoading,
            textInputType: TextInputType.emailAddress,
            validator: controller.emailValidator,
            onFieldSubmitted: (_) async =>
                await controller.onLoginButtonPressed(setState),
            controller: controller.emailTextEditingController,
          ),
          divider,
          AuthTextField(
            hintText: 'senha',
            suffix: const Icon(
              Icons.password,
              color: Colors.blue,
            ),
            isTextObscure: true,
            label: 'Senha',
            enabled: !isLoading,
            textInputType: TextInputType.visiblePassword,
            validator: controller.passwordValidator,
            onFieldSubmitted: (_) async =>
                await controller.onLoginButtonPressed(setState),
            controller: controller.passwordTextEditingController,
          ),
          divider,
          Align(
              alignment: Alignment.center,
              child: DefaultButton(
                onTap: !isLoading
                    ? () => controller.onLoginButtonPressed(setState)
                    : null,
                title: 'Login',
              ))
        ]),
      ),
    );
  }
}
