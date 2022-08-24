import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/todo/models/todo.dart';
import '../../pages/core/widgets/exit_confirmation_alert_dialog.dart';
import '../../pages/main_page/main_page.dart';
import '../../pages/todo_page/todo_page.dart';
import '../../pages/unknown_page/unknown_page.dart';
import 'i_navigation_controller.dart';
import 'routes.dart';

export 'routes.dart';

@LazySingleton(as: INavigationController)
class NavigationController implements INavigationController {
  static final GlobalKey<NavigatorState> key = GlobalKey();

  @override
  FutureOr<void> back<T>([T? result]) {
    key.currentState?.pop(result);
  }

  @override
  Future<bool> showExitAlertDialog() async {
    if (key.currentContext == null) return false;

    final dialogResult = await showDialog<bool>(
      context: key.currentContext!,
      builder: (_) => const ExitConfirmationAlertDialog(),
    );

    return dialogResult ?? false;
  }

  @override
  FutureOr<void> toTodoList() {
    _navigateTo(Routes.mainPage);
  }

  @override
  FutureOr<void> toTodoForm([Todo? todo]) {
    _navigateTo(Routes.todoPage, args: todo);
  }

  @override
  FutureOr<void> toUnknown() {
    _navigateTo(Routes.unknown);
  }

  void _navigateTo(String routeName, {Object? args}) =>
      key.currentState?.pushNamed(routeName, arguments: args);

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainPage:
        return _generateMaterialPageRoute(const MainPage());
      case Routes.todoPage:
        return _generateMaterialPageRoute(
          TodoPage(todo: settings.arguments as Todo?),
        );
      default:
        return _generateMaterialPageRoute(const UnknownPage());
    }
  }

  static MaterialPageRoute _generateMaterialPageRoute(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}
