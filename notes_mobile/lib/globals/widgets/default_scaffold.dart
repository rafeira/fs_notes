import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold(
      {super.key,
      required this.body,
      this.bodyPadding,
      this.backgroundColor = const Color.fromARGB(255, 55, 55, 55)});
  final Widget body;
  final EdgeInsetsGeometry? bodyPadding;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: bodyPadding ?? const EdgeInsets.all(8.0),
        child: body,
      )),
      backgroundColor: backgroundColor,
    );
  }
}
