import 'package:flutter/material.dart';
import 'package:notes_mobile/globals/widgets/drawers/default_drawer.dart';
import 'package:notes_mobile/globals/widgets/drawers/default_drawer_item.dart';
import 'package:notes_mobile/pages/note_list/controllers/note_list_menu_drawer_controller.dart';

class NoteListMenuDrawer extends StatelessWidget {
  NoteListMenuDrawer({super.key});
  final controller = NoteListMenuDrawerController();
  @override
  Widget build(BuildContext context) {
    return DefaultDrawer(
      list: [
        DefaultDrawerItem(
          title: 'Sair',
          titleColor: const Color.fromARGB(255, 48, 48, 48),
          buttonColor: const Color.fromARGB(255, 242, 170, 165),
          splashColor: Colors.red,
          onTap: controller.logout,
        )
      ],
    );
  }
}
