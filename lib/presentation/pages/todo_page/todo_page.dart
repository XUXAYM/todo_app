import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/todo/todo_form/todo_form_bloc.dart';
import '../../../domain/todo/models/todo.dart';
import '../../../injection.dart';
import 'todo_page_body.dart';

class TodoPage extends StatelessWidget {
  final Todo? todo;

  const TodoPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TodoFormBloc>(param1: todo),
      child: const Scaffold(
        body: TodoPageBody(),
      ),
    );
  }
}
