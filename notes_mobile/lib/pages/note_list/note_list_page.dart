import 'package:flutter/material.dart';
import 'package:notes_mobile/globals/widgets/default_scaffold.dart';

class NoteListPage extends StatelessWidget {
  const NoteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultScaffold(
      backgroundColor: Color.fromARGB(255, 160, 160, 160),
      body: Center(
        child: Text('NoteListPage'),
      ),
    );
  }
}
