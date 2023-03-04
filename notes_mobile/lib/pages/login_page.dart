import 'package:flutter/material.dart';
import 'package:notes_mobile/globals/widgets/default_scaffold.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultScaffold(
        body: Center(
      child: Text(
        'Login page',
        style: TextStyle(color: Colors.white ),
      ),
    ));
  }
}
