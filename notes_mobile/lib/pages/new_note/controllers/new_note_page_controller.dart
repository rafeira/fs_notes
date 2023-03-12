import 'package:flutter/material.dart';
import 'package:notes_mobile/data/models/note.dart';

class NewNotePageController {
  final formKey = GlobalKey<FormState>();
  final titleEditingController = TextEditingController();
  final contentEditingController = TextEditingController();
  Note? note;
}
