import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

import '../../../injection.dart';
import '../../../presentation/services/logger_controller.dart';

class ErrorHandler {
  const ErrorHandler._();

  static void init() {
    FlutterError.onError = _recordFlutterError;
    LoggerController.logger.info('ErrorHandler initialized');
  }

  static void recordError(Object error, StackTrace stackTrace) {
    getIt<FirebaseCrashlytics>().recordError(error, stackTrace, fatal: true);

    LoggerController.logger.severe(
      error.toString(),
      error,
      stackTrace,
    );
  }

  static void _recordFlutterError(FlutterErrorDetails error) {
    getIt<FirebaseCrashlytics>().recordFlutterFatalError(error);

    LoggerController.logger
        .severe(error.toStringShort(), error.exception, error.stack);
  }
}
