import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../application/todo/todo_form/todo_form_bloc.dart';
import '../../../services/s.dart';
import '../../../services/theming/theme_extension.dart';

class TodoTextField extends HookWidget {
  const TodoTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(
      text: context.watch<TodoFormBloc>().state.todo.text,
    );

    return Material(
      borderRadius: BorderRadius.circular(8.0),
      elevation: 2.0,
      color: Theme.of(context).paletteController?.backSecondary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controller,
          minLines: 4,
          maxLines: null,
          decoration: InputDecoration(
            hintText: '${S.of(context).todoTextFieldHint}...',
            hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: Theme.of(context).paletteController?.labelTertiary,
                ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          onChanged: (value) => context
              .read<TodoFormBloc>()
              .add(TodoFormEvent.textChanged(value)),
        ),
      ),
    );
  }
}
