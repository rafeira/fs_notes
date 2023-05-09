import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notes_mobile/data/hive/credentials_repository.dart';
import 'package:notes_mobile/data/repositories/auth_repository.dart';
import 'package:notes_mobile/globals/pages/default_message/navigation_hepers/arguments/default_message_arguments.dart';
import 'package:notes_mobile/routes/main/main_paths.dart';
import 'package:notes_mobile/utils/validation_helper.dart';

class LoginPageController {
  final loginFormKey = GlobalKey<FormState>();

  final emailTextEditingController = TextEditingController();
  String get email => emailTextEditingController.text;

  final passwordTextEditingController = TextEditingController();
  String get password => passwordTextEditingController.text;

  final _credentialsRepository = CredentialsRepository();

  final _authRepository = AuthRepository();

  var isRememberActive = true;

  var isPasswordVisible = false;

  var hasServerError = false;

  final BuildContext context;
  bool isLoading = false;

  LoginPageController({required this.context});
  Future<void> onLoginButtonPressed(
      StateSetter setState, NavigatorState navigatorState) async {
    if (loginFormKey.currentState!.validate()) {
      setState(loadPage);
      final isSignedUp = await _auth();
      if (isSignedUp == null) {
        await navigatorState.pushNamed(MainPaths.defaultMessage,
            arguments: _authErrorNavigationArguments(navigatorState));
      } else if (isSignedUp) {
        await _saveCredentials();
        await _navigate(MainPaths.noteList);
      }
      setState(stopLoadPage);
    }
  }

  DefaultMessageArguments _authErrorNavigationArguments(
      NavigatorState navigatorState) {
    return DefaultMessageArguments(
        message:
            'Você está com problemas de conexão! Tente novamente mais tarde!',
        textMessageAlignment: TextAlign.center,
        declineButtonCallback: navigatorState.pop,
        assetImage: 'assets/icons/server-error.png');
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

  Future<bool?> _auth() async {
    try {
      return await _authRepository.signIn(email: email, password: password);
    } on SocketException {
      return null;
    }
  }

  Future<void> _navigate(String route) async {
    await Navigator.of(context).pushReplacementNamed(route);
  }
}
