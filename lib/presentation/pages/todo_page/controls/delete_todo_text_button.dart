import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/todo/todo_form/todo_form_bloc.dart';
import '../../../services/s.dart';
import '../../../services/theming/theme_extension.dart';

class DeleteTodoTextButton extends StatelessWidget {
  final bool enabled;

  const DeleteTodoTextButton({
    super.key,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.delete),
      label: Text(S.of(context).delete),
      style: _configureButtonStyle(context),
      onPressed: enabled
          ? () => context
              .read<TodoFormBloc>()
              .add(const TodoFormEvent.deletePressed())
          : null,
    );
  }

  ButtonStyle? _configureButtonStyle(BuildContext context) {
    final theme = Theme.of(context);

    return theme.textButtonTheme.style?.copyWith(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return theme.paletteController?.labelDisable;
          } else {
            return theme.paletteController?.colorRed;
          }
        },
      ),
    );
  }
}
