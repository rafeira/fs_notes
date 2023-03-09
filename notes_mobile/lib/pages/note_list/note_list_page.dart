import 'package:flutter/material.dart';
import 'package:notes_mobile/globals/widgets/default_app_bar.dart';
import 'package:notes_mobile/globals/widgets/default_scaffold.dart';
import 'package:notes_mobile/pages/note_list/local_widgets/note_list_item.dart';

class NoteListPage extends StatelessWidget {
  const NoteListPage({super.key});
  final divider = const SizedBox(
    height: 10,
  );
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: const DefaultAppBar(),
      backgroundColor: const Color.fromARGB(255, 160, 160, 160),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) => const NoteListItem(),
      ),
    );
  }
}
