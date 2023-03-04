import 'package:flutter/material.dart';
import 'package:notes_mobile/globals/widgets/default_scaffold.dart';
import 'package:notes_mobile/pages/login/controllers/login_page_controller.dart';
import 'package:notes_mobile/pages/login/local_widgets/auth_text_field.dart';
import 'package:notes_mobile/pages/login/local_widgets/auth_title.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final controller = LoginPageController();
  final divider = const SizedBox(
    height: 30,
  );
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
          AuthTextField(
            hintText: 'email@email.com',
            suffix: const Icon(
              Icons.alternate_email_rounded,
              color: Colors.blue,
            ),
            label: 'Email',
            textInputType: TextInputType.emailAddress,
            validator: controller.emailValidator,
            onFieldSubmitted: (_) async =>
                await controller.onLoginButtonPressed(),
            controller: controller.emailTextEditingController,
          ),
        ]),
      ),
    );
  }
}
