import 'package:flutter/material.dart';
import 'package:notes_mobile/data/hive/credentials_repository.dart';
import 'package:notes_mobile/routes/main/main_paths.dart';
import 'package:notes_mobile/utils/validation_helper.dart';

class LoginPageController {
  final loginFormKey = GlobalKey<FormState>();

  final emailTextEditingController = TextEditingController();
  String get email => emailTextEditingController.text;

  final passwordTextEditingController = TextEditingController();
  String get password => passwordTextEditingController.text;

  final _credentialsRepository = CredentialsRepository();

  var isRememberActive = true;

  var isPasswordVisible = false;

  final BuildContext context;
  bool isLoading = false;

  LoginPageController({required this.context});
  Future<void> onLoginButtonPressed(
      void Function(void Function() fn) setState) async {
    if (loginFormKey.currentState!.validate()) {
      setState(loadPage);
      if (await _auth()) {
        await _saveCredentials();
        await _navigate(MainPaths.noteList);
      }
      setState(stopLoadPage);
    }
  }

  setCredentials() async {
    await _credentialsRepository.openBox();
    final username = _credentialsRepository.getUsername();
    final password = _credentialsRepository.getPassword();
    if (username != null && password != null) {
      emailTextEditingController.text = username;
      passwordTextEditingController.text = password;
    }
  }

  Future<void> _saveCredentials() async {
    if (isRememberActive) {
      await _credentialsRepository.setUsername(email);
      await _credentialsRepository.setPassword(password);
    } else {
      await _credentialsRepository.clearCredentials();
    }
  }

  Future<void> onEmailFieldSubmitted() async {
    // await onLoginButtonPressed();
  }

  Future<void> onPasswordFieldSubmitted() async {
    // await onLoginButtonPressed();
  }

  void onRememberCheckboxChanged(bool? value) {
    isRememberActive = value ?? false;
  }

  void onPasswordVisibilityButtonPressed(
      void Function(void Function() fn) setState) {
    setState(() => isPasswordVisible = !isPasswordVisible);
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

  Future<bool> _auth() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<void> _navigate(String route) async {
    await Navigator.of(context).pushNamed(route);
  }
}
