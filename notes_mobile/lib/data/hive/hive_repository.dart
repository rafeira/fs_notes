import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveRepository<T> {
  String? boxName;
  Box<T>? box;

  Future<void> openBox() async {
    box = await Hive.openBox<T>(boxName!);
  }

  Future<void> closeBox() async {
    await box?.close();
  }
}
