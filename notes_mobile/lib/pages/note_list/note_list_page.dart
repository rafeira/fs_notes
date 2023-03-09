import 'package:flutter/material.dart';
import 'package:notes_mobile/globals/widgets/default_app_bar.dart';
import 'package:notes_mobile/globals/widgets/default_scaffold.dart';
import 'package:notes_mobile/globals/widgets/default_title.dart';
import 'package:notes_mobile/pages/login/local_widgets/default_button.dart';
import 'package:notes_mobile/pages/note_list/local_widgets/note_list_item.dart';
import 'package:notes_mobile/pages/note_list/note_list_page_controller.dart';

class NoteListPage extends StatelessWidget {
  NoteListPage({super.key});
  final divider = const SizedBox(
    height: 10,
  );
  final controller = NoteListPageController();
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
          Align(
            alignment: Alignment.centerLeft,
            child: DefaultButton(
              onTap: () => controller.navigateToLogin(context),
              title: 'Adicionar',
            ),
          ),
          divider,
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => Dismissible(
                direction: DismissDirection.startToEnd,
                key: Key(index.toString()),
                child: NoteListItem(
                  key: Key(index.toString()),
                ),
              ),
            ),
          ),
          divider,
          DefaultButton(
            onTap: () => controller.navigateToLogin(context),
            title: '+',
          )
        ],
      ),
    );
  }
}
