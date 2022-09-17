import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import 'paths.dart';
import 'state_dto.dart';

//Transform state <-> URL
@LazySingleton(as: RouteInformationParser<NavigationStateDto>)
class TodoRouteInformationParser
    extends RouteInformationParser<NavigationStateDto> {
  @override
  Future<NavigationStateDto> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? '');
    if (uri.pathSegments.isEmpty) {
      return Future.value(NavigationStateDto.home());
    }
    switch (uri.pathSegments[0]) {
      case Paths.home:
        return Future.value(NavigationStateDto.home());
      case Paths.todo:
        return Future.value(
          NavigationStateDto.todoForm(uri.pathSegments[1]),
        );
      default:
        return Future.value(NavigationStateDto.unknown());
    }
  }

  @override
  RouteInformation? restoreRouteInformation(NavigationStateDto configuration) {
    if (configuration.isUnknown) {
      return const RouteInformation(location: Paths.unknown);
    }
    if (!configuration.isTodoForm) {
      return const RouteInformation(location: Paths.home);
    }
    if (configuration.isTodoForm) {
      if (configuration.todoId != null) {
        return const RouteInformation(location: "/${Paths.todo}");
      } else {
        return RouteInformation(
            location: "/${Paths.todo}/${configuration.todoId}");
      }
    }
    return const RouteInformation(location: Paths.unknown);
  }
}
