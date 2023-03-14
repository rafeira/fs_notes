import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveRepository<T> {
  String? boxName;
  Box<T>? _box;

  Box<T> get box {
    if (_box != null) {
      return _box!;
    } else {
      throw 'Box not initialized';
    }
  }

  Future<void> openBox() async {
    try {
      _box = await Hive.openBox<T>(boxName!);
    } on HiveError {
      rethrow;
    } 
  }

  Future<void> closeBox() async {
    await box.close();
  }

  bool isOpen() {
    return _box?.isOpen ?? false;
  }
}
