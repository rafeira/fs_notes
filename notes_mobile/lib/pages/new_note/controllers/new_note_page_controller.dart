import 'package:flutter/material.dart';
import 'package:notes_mobile/data/models/note.dart';

class NewNotePageController {
  final formKey = GlobalKey<FormState>();
  final titleEditingController = TextEditingController();
  final contentEditingController = TextEditingController();
  Note? note;
  String? titleValidator(String? value) {
    if (value == null || value.isEmpty) return 'Insira um título válido!';
    if (value.length > 40) {
      return 'Quantidade de caracteres deve ser menor do que 40!';
    }
    return null;
  }

  String? contentValidator(String? value) {
    if (value == null || value.isEmpty) return 'Insira um conteúdo válido!';
    if (value.length > 200) {
      return 'Quantidade de caracteres deve ser menor do que 100!';
    }
    return null;
  }

  Future<void> onCreateAnotationButtonPressed(
      NavigatorState navigatorState) async {
    if (formKey.currentState!.validate()) {
      note = Note(
          title: titleEditingController.text,
          content: contentEditingController.text);
      navigatorState.pop(note!);
    }
  }
}
