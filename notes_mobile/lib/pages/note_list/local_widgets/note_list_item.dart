import 'package:flutter/material.dart';
import 'package:notes_mobile/globals/widgets/default_card.dart';

class NoteListItem extends StatelessWidget {
  const NoteListItem({super.key, required this.title, required this.content});
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return DefaultCard(
        cardColor: const Color.fromARGB(255, 30, 41, 30),
        child: ListTile(
          title: Text(title),
          subtitle: Text(content),
        ));
  }
}
