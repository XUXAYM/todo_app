import 'package:flutter/material.dart';

abstract class PaletteController extends ThemeExtension<PaletteController> {
  const PaletteController();

  Color get supportSeparator;
  Color get supportOverlay;
  Color get labelPrimary;
  Color get labelSecondary;
  Color get labelTertiary;
  Color get labelDisable;
  Color get colorAttention;
  Color get colorRed;
  Color get colorGreen;
  Color get colorBlue;
  Color get colorPurple => const Color(0xFF793CD8);
  Color get colorGray;
  Color get colorGrayLight;
  Color get colorWhite;
  Color get backPrimary;
  Color get backSecondary;
  Color get backElevated;
}
