import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'infrastructure/core/services/error_handler.dart';
import 'presentation/app_widget.dart';
import 'presentation/services/app_config.dart';

void main() => runZonedGuarded(
      () async {
        const environment = Environment.dev;

        await AppConfig.setup(environment);

        runApp(const AppWidget(environment: environment));
      },
      ErrorHandler.recordError,
    );
