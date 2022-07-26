import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/presentation/app_widget.dart';

import '../test/core/test_injection.dart';

void main() {
  testSetup();

  runApp(const AppWidget(environment: Environment.test));
}
