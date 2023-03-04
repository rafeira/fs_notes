import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({super.key, required this.body, this.bodyPadding});
  final Widget body;
  final EdgeInsetsGeometry? bodyPadding;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: bodyPadding ?? const EdgeInsets.all(8.0),
        child: body,
      )),
      backgroundColor: const Color.fromARGB(255, 55, 55, 55),
    );
  }
}
