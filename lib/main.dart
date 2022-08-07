import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'domain/todo/exceptions/cached_exceptions.dart';
import 'domain/todo/exceptions/network_exceptions.dart';
import 'domain/todo/i_todo_local_data_source.dart';
import 'domain/todo/i_todo_remote_data_source.dart';
import 'domain/todo/models/todo.dart';
import 'firebase_options.dart';
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

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await _configureHive();

  configureDependencies();
  await getIt<FirebaseRemoteConfig>().setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    // Change it to 1 minute, if you need to apply changes immediately
    minimumFetchInterval: const Duration(hours: 1),
  ));
  await getIt<FirebaseRemoteConfig>().fetchAndActivate();

  ErrorHandler.init();

  await _synchronizeData();
}

Future<void> _configureHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Todo>(TodoAdapter());
  Hive.registerAdapter<TodoImportance>(TodoImportanceAdapter());
}

// TODO: Replace it to some controller or BLoC
Future<void> _synchronizeData() async {
  final localDataSource = getIt<ITodoLocalDataSource>();
  final remoteDataSource = getIt<ITodoRemoteDataSource>();

  try {
    if (await localDataSource.isDurtyData()) {
      final localData = await localDataSource.getAll();
      final mergedData = await remoteDataSource.replaceAll(localData);
      await localDataSource.replaceAll(mergedData);
      await localDataSource.setIsDurtyData(false);
    }
  } on NetworkException catch (e, stackTrace) {
    LoggerController.logger
        .warning('Some problem with remote store', e, stackTrace);
  } on CachedException catch (e, stackTrace) {
    LoggerController.logger
        .warning('Some problem with saving todo localy', e, stackTrace);
  }
}
