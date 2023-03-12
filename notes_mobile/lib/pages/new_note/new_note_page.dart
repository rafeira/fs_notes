import 'package:flutter/material.dart';
import 'package:notes_mobile/globals/widgets/default_app_bar.dart';
import 'package:notes_mobile/globals/widgets/default_scaffold.dart';
import 'package:notes_mobile/globals/widgets/default_title.dart';
import 'package:notes_mobile/pages/new_note/controllers/new_note_page_controller.dart';

class NewNotePage extends StatelessWidget {
  NewNotePage({super.key});
  final controller = NewNotePageController();
  GlobalKey<FormState> get formKey => controller.formKey;
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
            children: const [
              Align(child: DefaultTitle(text: 'Crie sua anotação')),
              TitleFormField(),
              TitleFormField()
            ],
          ),
        ));
  }
}

class TitleFormField extends StatelessWidget {
  const TitleFormField({super.key});
  final border = const OutlineInputBorder(
      borderSide: BorderSide(width: .8, color: Colors.black));
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          focusColor: Colors.amber,
          hoverColor: Colors.amber,
          enabledBorder: border,
          focusedBorder: border,
          border: border),
    );
  }
}
