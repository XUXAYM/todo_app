import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'dark_palette_controller.dart';
import 'light_palette_controller.dart';
import 'palette_controller.dart';
import 'typography.dart';

@LazySingleton()
class ThemeController {
  final PaletteController _lightPalette;
  final PaletteController _darkPalette;

  ThemeController(
    LightPaletteController lightPalette,
    DarkPaletteController darkPalette,
  )   : _lightPalette = lightPalette,
        _darkPalette = darkPalette;

  ThemeData get lightTheme => _configureTheme(_lightPalette);

  ThemeData get darkTheme => _configureTheme(_darkPalette);

  ThemeData _configureTheme(PaletteController palette) => _baseTheme.copyWith(
        primaryColor: palette.colorBlue,
        scaffoldBackgroundColor: palette.backPrimary,
        canvasColor: palette.backElevated,
        appBarTheme: _baseAppBarTheme.copyWith(
          color: palette.backSecondary,
          foregroundColor: palette.labelPrimary,
        ),
        floatingActionButtonTheme:
            _fabTheme.copyWith(backgroundColor: palette.colorBlue),
        cardTheme: _baseCardTheme.copyWith(color: palette.backSecondary),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: subhead,
            onPrimary: palette.backPrimary,
            primary: palette.colorBlue,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(textStyle: button),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateColor.resolveWith(
            ((states) {
              if (states.contains(MaterialState.selected)) {
                return palette.colorBlue;
              } else {
                return palette.backElevated;
              }
            }),
          ),
          trackColor: MaterialStateColor.resolveWith(
            ((states) {
              if (states.contains(MaterialState.selected)) {
                return palette.colorBlue.withOpacity(0.3);
              } else {
                return palette.supportOverlay;
              }
            }),
          ),
        ),
        dividerTheme: _dividerTheme.copyWith(color: palette.supportSeparator),
        textTheme: TextTheme(
          headline5: largeTitle.copyWith(color: palette.labelPrimary),
          headline6: title.copyWith(color: palette.labelPrimary),
          subtitle1: body.copyWith(color: palette.labelPrimary),
          bodyText2: subhead.copyWith(color: palette.labelPrimary),
        ),
        extensions: <ThemeExtension<dynamic>>[palette],
        dialogBackgroundColor: palette.backSecondary,
      );

  static final ThemeData _baseTheme = ThemeData(
    appBarTheme: _baseAppBarTheme,
    listTileTheme: _baseListTileTheme,
    cardTheme: _baseCardTheme,
    floatingActionButtonTheme: _fabTheme,
  );

  static const _baseCardTheme = CardTheme();

  static const _fabTheme = FloatingActionButtonThemeData();

  static const _baseAppBarTheme = AppBarTheme(
    titleTextStyle: title,
  );

  static const _baseListTileTheme = ListTileThemeData(
    contentPadding: EdgeInsets.only(left: 4.0),
    minVerticalPadding: 12.0,
    horizontalTitleGap: 0.0,
    minLeadingWidth: 0.0,
  );

  static const _dividerTheme = DividerThemeData(
    space: 32.0,
    thickness: 0.5,
  );
}
