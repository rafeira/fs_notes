import 'package:flutter/material.dart';
import 'package:notes_mobile/data/hive/credentials_repository.dart';
import 'package:notes_mobile/routes/main/main_paths.dart';
import 'package:notes_mobile/utils/validation_helper.dart';

class LoginPageController {
  final loginFormKey = GlobalKey<FormState>();
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  String get email => emailTextEditingController.text;
  String get password => passwordTextEditingController.text;

  final _credentialsRepository = CredentialsRepository();

  final BuildContext context;
  bool isLoading = false;

  LoginPageController({required this.context});
  Future<void> onLoginButtonPressed(
      void Function(void Function() fn) setState) async {
    if (loginFormKey.currentState!.validate()) {
      setState(loadPage);
      if (await _auth()) {
        await _navigate(MainPaths.noteList);
      }
      setState(stopLoadPage);
    }
  }

  Future<void> onEmailFieldSubmitted() async {
    // await onLoginButtonPressed();
  }

  Future<void> onPasswordFieldSubmitted() async {
    // await onLoginButtonPressed();
  }

  void loadPage() {
    isLoading = true;
  }

  void stopLoadPage() {
    isLoading = false;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'Email inválido!';
    if (ValidationHelper.isEmailValid(value)) return null;
    return 'Email inválido';
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Senha inválida!';
    if (value.length < 6) return 'Quantidade mínima de caracteres (6)!';
    return null;
  }
}
