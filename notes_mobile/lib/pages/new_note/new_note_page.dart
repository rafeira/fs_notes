import 'package:flutter/material.dart';
import 'package:notes_mobile/globals/widgets/default_app_bar.dart';
import 'package:notes_mobile/globals/widgets/default_scaffold.dart';
import 'package:notes_mobile/globals/widgets/default_title.dart';
import 'package:notes_mobile/pages/new_note/controllers/new_note_page_controller.dart';
import 'package:notes_mobile/pages/new_note/local_widges/note_form_field.dart';

class NewNotePage extends StatelessWidget {
  NewNotePage({super.key});
  final controller = NewNotePageController();
  GlobalKey<FormState> get formKey => controller.formKey;
  final _divider = const SizedBox(
    height: 9.0,
  );
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        appBar: const DefaultAppBar(),
        backgroundColor: const Color.fromARGB(255, 160, 160, 160),
        body: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Align(child: DefaultTitle(text: 'Crie sua anotação')),
              _divider,
              const NoteFormField(
                label: 'Título',
              ),
              _divider,
              const NoteFormField(
                maxLines: 5,
                label: 'Conteúdo',
              )
            ],
          ),
        ));
  }
}
