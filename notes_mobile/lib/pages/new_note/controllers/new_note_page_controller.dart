import 'package:flutter/material.dart';
import 'package:notes_mobile/data/models/note.dart';

class NewNotePageController {
  final formKey = GlobalKey<FormState>();
  final titleEditingController = TextEditingController();
  final contentEditingController = TextEditingController();
  Note? note;
  String? titleValidator(String? value) {
    if (value == null || value.isEmpty) return 'Insira um título válido!';
    return null;
  }

  String? contentValidator(String? value) {
    if (value == null || value.isEmpty) return 'Insira um conteúdo válido!';
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
