import 'package:flutter/material.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key, required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color.fromARGB(255, 191, 189, 189),
        child: Column(children: children),
      ),
    );
  }
}
