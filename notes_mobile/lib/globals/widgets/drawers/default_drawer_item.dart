import 'package:flutter/material.dart';

class DefaultDrawerItem extends StatelessWidget {
  const DefaultDrawerItem({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(title ?? 'Clique'),
    );
  }
}
