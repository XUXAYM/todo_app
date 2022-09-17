import 'dart:async';

abstract class INavigationController {
  FutureOr<void> toTodoList();

  FutureOr<void> toTodoForm([String? todoId]);

  FutureOr<void> toUnknown();

  FutureOr<void> back<T>([T? result]);

  Future<bool> showExitAlertDialog();
}
