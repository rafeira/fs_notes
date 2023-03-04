import 'package:flutter/material.dart';
import 'package:notes_mobile/pages/login/login_page.dart';

class FSNotesApp extends StatelessWidget {
  const FSNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
