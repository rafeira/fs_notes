import 'package:flutter/material.dart';
import 'package:notes_mobile/globals/widgets/drawers/default_drawer_item.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key, required this.list});
  final List<DefaultDrawerItem> list;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color.fromARGB(255, 191, 189, 189),
        child: Column(children: list),
      ),
    );
  }
}
