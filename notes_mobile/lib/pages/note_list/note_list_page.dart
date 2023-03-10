import 'package:flutter/material.dart';
import 'package:notes_mobile/data/models/note.dart';
import 'package:notes_mobile/globals/widgets/default_app_bar.dart';
import 'package:notes_mobile/globals/widgets/default_scaffold.dart';
import 'package:notes_mobile/globals/widgets/default_title.dart';
import 'package:notes_mobile/pages/login/local_widgets/default_button.dart';
import 'package:notes_mobile/pages/note_list/local_widgets/note_list_item.dart';
import 'package:notes_mobile/pages/note_list/note_list_page_controller.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  final divider = const SizedBox(
    height: 10,
  );

  final controller = NoteListPageController();

  List<Note> get noteList => controller.noteList;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: const DefaultAppBar(),
      backgroundColor: const Color.fromARGB(255, 160, 160, 160),
      body: Column(
        children: [
          const DefaultTitle(
            text: 'Minhas anotações',
            fontSize: 25,
          ),
          divider,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultButton(
                onTap: () => onAddButtonPressed(context),
                title: 'Adicionar',
              ),
              DefaultButton(
                onTap: () => onSyncButtonPressed(context),
                borderColor: const Color.fromARGB(255, 26, 117, 4),
                titleColor: const Color.fromARGB(255, 49, 107, 67),
                backgroundColor: Colors.grey,
                splashColor: const Color.fromARGB(255, 2, 59, 10),
                title: 'Sincronizar',
              ),
            ],
          ),
          divider,
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.noteList.length,
              physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast),
              itemBuilder: (_, i) {
                return Dismissible(
                  direction: DismissDirection.startToEnd,
                  onDismissed: (_) {
                    setState(() => controller.onNoteCardDismissed(noteList[i]));
                  },
                  key: UniqueKey(),
                  child: NoteListItem(
                    title: noteList[i].title,
                    content: noteList[i].content,
                  ),
                );
              },
            ),
          ),
          divider,
          if (noteList.isNotEmpty)
            DefaultButton(
              onTap: () => onPlusButtonPressed(context),
              title: '+',
            )
        ],
      ),
    );
  }

  Future<void> onPlusButtonPressed(BuildContext context) async {
    final navigatorState = Navigator.of(context);
    await controller.onPlusButtonPressed(navigatorState, setState);
  }

  Future<void> onAddButtonPressed(BuildContext context) async {
    final navigatorState = Navigator.of(context);
    await controller.onAddButtonPressed(navigatorState, setState);
  }

  void onSyncButtonPressed(BuildContext context) {
    final navigatorState = Navigator.of(context);
    controller.onSyncButtonPressed(navigatorState);
  }
}
