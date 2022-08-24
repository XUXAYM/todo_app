import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/todo/todo_form/todo_form_bloc.dart';
import '../../../services/methods.dart';
import '../../../services/navigating/navigation_controller.dart';

class CloseIconButton extends StatelessWidget {
  const CloseIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close),
      onPressed: () => _onPressed(context),
    );
  }

  void _onPressed(BuildContext context) async {
    if (!context.read<TodoFormBloc>().state.isChanged) {
      NavigationController.navigateBack();
    } else {
      final result = await showExitAlertDialog(context) ?? false;

      if (result) NavigationController.navigateBack();
    }
  }
}
