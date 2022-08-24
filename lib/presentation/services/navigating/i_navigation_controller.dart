import 'dart:async';

import '../../../domain/todo/models/todo.dart';

abstract class INavigationController {
  FutureOr<void> toTodoList();

  FutureOr<void> toTodoForm([Todo? todo]);

  FutureOr<void> toUnknown();

  FutureOr<void> back<T>([T? result]);

  Future<bool> showExitAlertDialog();
}
