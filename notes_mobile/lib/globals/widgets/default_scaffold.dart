import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: body),
      backgroundColor: Color.fromARGB(255, 55, 55, 55),
    );
  }
}
