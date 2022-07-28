import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../injection.dart';
import 'pages/main_page/main_page.dart';
import 'services/s.dart';
import 'services/theming/theme_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.supportedLocales,
      theme: getIt<ThemeController>().lightTheme,
      darkTheme: getIt<ThemeController>().darkTheme,
      home: const MainPage(),
    );
  }
}
