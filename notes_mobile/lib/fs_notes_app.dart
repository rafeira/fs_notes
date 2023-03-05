import 'package:flutter/material.dart';
import 'package:notes_mobile/pages/splash/splash_page.dart';
import 'package:notes_mobile/routes/main/main_routes.dart';

class FSNotesApp extends StatelessWidget {
  const FSNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashPage(),
      routes: MainRoutes.routes,
    );
  }
}
