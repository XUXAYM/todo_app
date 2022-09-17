import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../pages/core/widgets/exit_confirmation_alert_dialog.dart';
import '../../pages/main_page/main_page.dart';
import '../../pages/todo_page/todo_page.dart';
import '../../pages/unknown_page/unknown_page.dart';
import 'i_navigation_controller.dart';
import 'state.dart';
import 'state_dto.dart';

@LazySingleton()
class TodoRouterDelegate extends RouterDelegate<NavigationStateDto>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationStateDto>
    implements INavigationController {
  static final GlobalKey<NavigatorState> _key = GlobalKey();

  NavigationState state = NavigationState(false, null, false);

  bool get isHome => !state.isTodoForm && state.todoId == null;

  bool get isTodoFormEditing => state.isTodoForm && state.todoId != null;

  bool get isTodoFormCreating => state.isTodoForm && state.todoId == null;

  @override
  FutureOr<void> back<T>([T? result]) {
    navigatorKey?.currentState?.pop(result);
  }

  @override
  Future<bool> showExitAlertDialog() async {
    if (navigatorKey?.currentContext == null) return false;

    final dialogResult = await showDialog<bool>(
      context: navigatorKey!.currentContext!,
      builder: (_) => const ExitConfirmationAlertDialog(),
    );

    return dialogResult ?? false;
  }

  @override
  FutureOr<void> toTodoForm([String? id]) {
    state
      ..isTodoForm = true
      ..todoId = id
      ..isUnknown = false;
    notifyListeners();
  }

  @override
  FutureOr<void> toTodoList() {
    state
      ..isTodoForm = false
      ..todoId = null
      ..isUnknown = false;
    notifyListeners();
  }

  @override
  FutureOr<void> toUnknown() {
    state
      ..isTodoForm = false
      ..todoId = null
      ..isUnknown = true;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _key,
      onPopPage: (route, result) {
        final shouldPop = route.didPop(result);
        if (shouldPop) {
          state
            ..isTodoForm = false
            ..todoId = null;
        }

        return shouldPop;
      },
      pages: [
        const MaterialPage(
          child: MainPage(),
        ),
        if (state.isTodoForm)
          MaterialPage(
            child: TodoPage(todoId: state.todoId),
          ),
        if (state.isUnknown)
          const MaterialPage(
            child: UnknownPage(),
          ),
      ],
    );
  }

  @override
  NavigationStateDto? get currentConfiguration {
    return NavigationStateDto(state.isTodoForm, state.todoId, false);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _key;

  @override
  Future<void> setNewRoutePath(NavigationStateDto configuration) {
    state.isTodoForm = configuration.isTodoForm;
    state.todoId = configuration.todoId;
    state.isUnknown = configuration.isUnknown;

    return Future.value();
  }
}
