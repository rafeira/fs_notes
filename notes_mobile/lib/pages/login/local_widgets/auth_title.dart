import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({super.key, required this.title});
  final String title;
  final titleStyle = const TextStyle(
      color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: titleStyle,
    );
  }
}
