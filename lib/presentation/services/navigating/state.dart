import 'package:flutter/foundation.dart';

class NavigationState with ChangeNotifier {
  bool _isUnknown;
  bool _isTodoForm;
  String? _todoId;

  NavigationState(this._isTodoForm, this._todoId, this._isUnknown);

  bool get isTodoForm => _isTodoForm;
  set isTodoForm(bool value) {
    _isTodoForm = value;
    notifyListeners();
  }

  String? get todoId => _todoId;
  set todoId(String? value) {
    _todoId = value;
    notifyListeners();
  }

  bool get isUnknown => _isUnknown;
  set isUnknown(bool value) {
    _isUnknown = value;
    notifyListeners();
  }

  @override
  String toString() =>
      "TodoForm: $_isTodoForm, todo: $_todoId, isUnknown: $_isUnknown";
}
