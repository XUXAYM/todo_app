import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/todo/todo_form/todo_form_bloc.dart';
import '../../../services/s.dart';

class SaveTodoTextButton extends StatelessWidget {
  const SaveTodoTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(S.of(context).save.toUpperCase()),
      onPressed: () =>
          context.read<TodoFormBloc>().add(const TodoFormEvent.savePressed()),
    );
  }
}
