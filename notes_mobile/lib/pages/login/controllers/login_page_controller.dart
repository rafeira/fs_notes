import 'package:flutter/material.dart';
import 'package:notes_mobile/utils/validation_helper.dart';

class LoginPageController {
  final loginFormKey = GlobalKey<FormState>();
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  String get email => emailTextEditingController.text;
  String get password => passwordTextEditingController.text;

  bool isLoading = false;
  Future<void> onLoginButtonPressed() async {
    loginFormKey.currentState!.validate();
  }

  void loadPage() {
    isLoading = true;
  }

  void stopLoadPage() {
    isLoading = true;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'Email inválido!';
    if (ValidationHelper.isEmailValid(value)) return null;
    return 'Email inválido';
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Email inválido!';
    if (value.length < 6) return 'Quantidade mínima de caracteres (6)!';
    if (ValidationHelper.isEmailValid(value)) return null;
    return 'Email inválido';
  }
}
