import 'package:logger/logger.dart';

/// class to print logs using logger
class Logs {
  Logs._internal();
  static Logger _logger = Logger();
  static Logger get p => _logger;
}
