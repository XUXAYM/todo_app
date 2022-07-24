import 'package:flutter/foundation.dart';

import '../../../presentation/services/logger_controller.dart';

class ErrorHandler {
  const ErrorHandler._();

  static void init() {
    FlutterError.onError = _recordFlutterError;
    LoggerController.logger.info('ErrorHandler initialized');
  }

  static void recordError(Object error, StackTrace stackTrace) {
    LoggerController.logger.severe(
      error.toString(),
      error,
      stackTrace,
    );
  }

  static void _recordFlutterError(FlutterErrorDetails error) {
    LoggerController.logger
        .severe(error.toStringShort(), error.exception, error.stack);
  }
}
