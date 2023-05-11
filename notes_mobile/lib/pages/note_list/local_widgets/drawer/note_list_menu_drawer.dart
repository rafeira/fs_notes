import 'package:flutter/material.dart';
import 'package:notes_mobile/globals/widgets/drawers/default_drawer.dart';
import 'package:notes_mobile/globals/widgets/drawers/default_drawer_item.dart';

class NoteListMenuDrawer extends StatelessWidget {
  const NoteListMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultDrawer(
      list: [
        DefaultDrawerItem(
          title: 'Sair',
          titleColor: Colors.red,
          onTap: () => false,
        )
      ],
    );
  }
}
