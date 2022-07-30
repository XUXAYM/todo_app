import 'dart:async';

import 'package:hive/hive.dart';

import '../../../domain/todo/models/todo.dart';
import 'hive_boxes.dart';

class HiveBoxController {
  const HiveBoxController._();

  static FutureOr<Box<Todo>> getTodoBox() => _getBox<Todo>(HiveBoxes.todo);

  static FutureOr<Box> getSettingsBox() => _getBox(HiveBoxes.settings);

  static FutureOr<Box<T>> _getBox<T>(String key) async =>
      Hive.isBoxOpen(key) ? Hive.box(key) : await Hive.openBox(key);
}
