import 'dart:async';

import 'package:flutter/material.dart';

import 'infrastructure/core/services/error_handler.dart';
import 'injection.dart';
import 'presentation/app_widget.dart';
import 'presentation/services/logger_controller.dart';

void main() => runZonedGuarded(
      () async {
        await _initialize();

        runApp(const AppWidget());
      },
      ErrorHandler.recordError,
    );

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  LoggerController.logger.info('Initial initialization');

  configureDependencies();

  ErrorHandler.init();
}
