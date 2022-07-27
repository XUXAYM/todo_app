import 'package:flutter/material.dart';

abstract class PaletteController extends ThemeExtension<PaletteController> {
  const PaletteController();

  Color get supportSeparator;
  Color get supportOverlay;
  Color get labelPrimary;
  Color get labelSecondary;
  Color get labelTertiary;
  Color get labelDisable;
  Color get colorRed;
  Color get colorGreen;
  Color get colorBlue;
  Color get colorGray;
  Color get colorGrayLight;
  Color get colorGrayWhite;
  Color get backPrimary;
  Color get backSecondary;
  Color get backElevated;
}