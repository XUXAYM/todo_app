import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/todo/i_todo_repository.dart';
import '../../domain/todo/models/todo.dart';
import '../../firebase_options.dart';
import '../../infrastructure/core/services/error_handler.dart';
import '../../injection.dart';
import 'logger_controller.dart';

class AppConfig {
  static Future<void> setup([String? environment]) async {
    WidgetsFlutterBinding.ensureInitialized();
    LoggerController.logger.info('Initial initialization');

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await _configureHive();

    configureDependencies(environment);
    await getIt<FirebaseRemoteConfig>().setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      // Change it to 1 minute, if you need to apply changes immediately
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await getIt<FirebaseRemoteConfig>().fetchAndActivate();

    ErrorHandler.init();

    await getIt<ITodoRepository>().synchronizeData();
  }

  static Future<void> _configureHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter<Todo>(TodoAdapter());
    Hive.registerAdapter<TodoImportance>(TodoImportanceAdapter());
  }
}
