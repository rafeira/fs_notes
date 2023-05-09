import 'package:logger/logger.dart';

class LoggerConfig {
  static Logger? _logger;
  LoggerConfig._internal() {
    _logger = Logger();
  }
  static Logger get logger {
    if (_logger == null) {
      LoggerConfig._internal();
    }
    return _logger!;
  }
}
