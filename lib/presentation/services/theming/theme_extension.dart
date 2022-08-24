import 'package:flutter/material.dart';
import 'package:todo_app/presentation/services/theming/palette_controller.dart';

extension ThemeEx on ThemeData {
  PaletteController? get paletteController => extension<PaletteController>();
}
