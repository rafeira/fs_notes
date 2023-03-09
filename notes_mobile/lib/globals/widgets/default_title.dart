import 'package:flutter/material.dart';

class DefaultTitle extends StatelessWidget {
  const DefaultTitle(
      {super.key,
      required this.text,
      this.fontSize = 30,
      this.color = const Color.fromARGB(255, 49, 49, 49)});
  final String text;
  final double fontSize;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: fontSize, color: color);
    return Text(
      text,
      style: style,
    );
  }
}
