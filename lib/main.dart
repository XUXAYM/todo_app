import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'domain/todo/models/todo.dart';
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

  await Hive.initFlutter();
  Hive.registerAdapter<Todo>(TodoAdapter());
  Hive.registerAdapter<TodoImportance>(TodoImportanceAdapter());

  configureDependencies();

  ErrorHandler.init();
}
