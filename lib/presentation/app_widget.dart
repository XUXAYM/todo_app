import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:injectable/injectable.dart';

import '../injection.dart';
import 'services/navigating/state_dto.dart';
import 'services/s.dart';
import 'services/theming/theme_controller.dart';

class AppWidget extends StatelessWidget {
  final String environment;

  const AppWidget({
    super.key,
    required this.environment,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: environment != Environment.prod,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.supportedLocales,
      theme: getIt<ThemeController>().lightTheme,
      darkTheme: getIt<ThemeController>().darkTheme,
      backButtonDispatcher: RootBackButtonDispatcher(),
      routerDelegate: getIt<RouterDelegate<NavigationStateDto>>(),
      routeInformationParser:
          getIt<RouteInformationParser<NavigationStateDto>>(),
    );
  }
}
