import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:logging/logging.dart';
import 'package:todo_app/injection.dart';
import 'package:uuid/uuid.dart';

import 'test_main.dart' as test_app;

final testLogger = Logger('[Test]');

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late final StreamSubscription loggerSub;

  setUpAll(() {
    loggerSub = testLogger.onRecord
        // ignore: avoid_print
        .listen((event) => print('${event.time}: $event'));
  });

  tearDownAll(() async => await loggerSub.cancel());

  // Сбрасываем контейнер getIt после каждого теста
  tearDown(() {
    getIt.reset();
  });

  testWidgets('Entering text and tap add icon creates new todo',
      (tester) async {
    final FlutterExceptionHandler? originalOnError = FlutterError.onError;

    test_app.main();
    await tester.pumpAndSettle();

    FlutterError.onError = originalOnError;

    final String tStr = const Uuid().v1();

    expect(find.text(tStr), findsNothing);

    final textField = find.byType(TextField);
    expect(textField, findsOneWidget);

    await tester.enterText(textField, tStr);
    testLogger.info('Text "$tStr" entered to text field');

    await tester.pumpTimes(60);
    final addIconButton = find.widgetWithIcon(IconButton, Icons.add);

    expect(addIconButton, findsOneWidget);

    await tester.tap(addIconButton);
    testLogger.info('Taped to add icon button');

    await tester.pumpAndWait(waitSeconds: 3);

    expect(find.text(tStr, findRichText: true), findsOneWidget);
    testLogger.info('New todo tile founded');
  });
}

Future<void> waitSec(int seconds) => Future.delayed(Duration(seconds: seconds));

extension TesterExt on WidgetTester {
  Future<void> pumpAndWait({
    int pumpTimes = 60,
    int? waitSeconds,
    Duration? pumpDuration,
  }) async {
    for (var i = 0; i < pumpTimes; i++) {
      await pump(pumpDuration);
    }
    if (waitSeconds != null) {
      waitSec(waitSeconds);
    }
  }

  Future<void> pumpTimes(
    int times, [
    Duration? duration,
    EnginePhase phase = EnginePhase.sendSemanticsUpdate,
  ]) async {
    for (var i = 0; i < times; i++) {
      await pump(duration, phase);
    }
  }
}
