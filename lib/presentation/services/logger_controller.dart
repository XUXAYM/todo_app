import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class LoggerController {
  const LoggerController._();

  static final logger = Logger('');

  static void initLogger() {
    if (kDebugMode) {
      Logger.root.level = Level.ALL;
      Logger.root.onRecord.listen((log) {
        dev.log(
          log.message,
          time: log.time,
          sequenceNumber: log.sequenceNumber,
          level: log.level.value,
          name: log.loggerName,
          zone: log.zone,
          error: log.error,
          stackTrace: log.stackTrace,
        );
      });
    }
  }
}
