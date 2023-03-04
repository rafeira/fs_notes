import 'package:flutter/material.dart';
import 'package:notes_mobile/pages/login_page.dart';

class FSNotesApp extends StatelessWidget {
  const FSNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
