import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../../injection.dart';
import 'delegate.dart';
import 'i_navigation_controller.dart';
import 'state_dto.dart';

@module
abstract class DelegateRegisterModule {
  @LazySingleton()
  RouterDelegate<NavigationStateDto> get delegate =>
      getIt<TodoRouterDelegate>();

  @LazySingleton()
  INavigationController get controller => getIt<TodoRouterDelegate>();
}
