import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/todo/todo_form/todo_form_bloc.dart';
import '../../../injection.dart';
import 'todo_page_body.dart';

class TodoPage extends StatelessWidget {
  final String? todoId;

  const TodoPage({super.key, required this.todoId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<TodoFormBloc>()..add(TodoFormEvent.initialize(todoId)),
      child: const Scaffold(
        body: TodoPageBody(),
      ),
    );
  }
}
