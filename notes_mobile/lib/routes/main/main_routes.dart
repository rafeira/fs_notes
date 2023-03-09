import 'package:flutter/material.dart';
import 'package:notes_mobile/pages/login/login_page.dart';
import 'package:notes_mobile/pages/note_list/note_list_page.dart';
import 'package:notes_mobile/pages/splash/splash_page.dart';
import 'package:notes_mobile/routes/main/main_paths.dart';

class MainRoutes {
  MainRoutes._();
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    MainPaths.splash: (context) => const SplashPage(),
    MainPaths.login: (context) => const LoginPage(),
    MainPaths.noteList: (context) => NoteListPage(),
  };
}
