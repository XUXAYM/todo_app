import 'package:flutter/material.dart';

import '../../../domain/todo/models/todo.dart';
import '../../pages/main_page/main_page.dart';
import '../../pages/todo_page/todo_page.dart';
import '../../pages/unknown_page/unknown_page.dart';
import 'routes.dart';

export 'routes.dart';

class NavigationController {
  const NavigationController._();

  static final GlobalKey<NavigatorState> key = GlobalKey();

  static void navigateTo(String routeName, {Object? args}) =>
      key.currentState?.pushNamed(routeName, arguments: args);

  static void navigateBack<T>([T? result]) => key.currentState?.pop<T>(result);

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
