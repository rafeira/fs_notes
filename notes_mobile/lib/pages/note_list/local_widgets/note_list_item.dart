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
        cardColor: const Color.fromARGB(255, 93, 95, 95),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
            DefaultCard(
              elevation: 9.0,
              margin: EdgeInsets.zero,
              width: double.infinity,
              cardColor: const Color.fromARGB(255, 154, 156, 156),
              child: Text(
                content,
                style: const TextStyle(color: Color.fromARGB(255, 93, 95, 95)),
              ),
            ),
          ],
        ));
  }
}
