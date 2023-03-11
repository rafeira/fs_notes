import 'package:flutter/widgets.dart';
import 'package:notes_mobile/data/models/note.dart';
import 'package:notes_mobile/routes/main/main_paths.dart';

class NoteListPageController {
  final noteList = <Note>[];

  Future<void> navigate(BuildContext context) async {
    await Navigator.pushNamed(context, MainPaths.newNote);
  }

  Future<void> onSyncButtonPressed(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    await _navigateToLogin(context);
  }
}
