import 'package:notes_mobile/data/hive/hive_repository.dart';
import 'package:notes_mobile/routes/main/main_paths.dart';

class LocalHomePageRepository extends HiveRepository<String> {
  @override
  String? get boxName => 'home_page';
  final String key = 'key';
  String getHome() {
    return box.get(key) ?? MainPaths.noteList;
  }
}
