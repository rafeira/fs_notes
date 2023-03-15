import 'package:flutter/material.dart';
import 'package:notes_mobile/globals/widgets/default_card.dart';

class NoteListItem extends StatelessWidget {
  const NoteListItem({super.key, required this.title, required this.content});
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return DefaultCard(
        elevation: 10.0,
        cardColor: const Color.fromARGB(255, 21, 114, 109),
        child: ListTile(
          title: Text(
            "$title $key",
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            content,
            style: const TextStyle(color: Color.fromARGB(255, 131, 131, 131)),
          ),
        ));
  }
}
