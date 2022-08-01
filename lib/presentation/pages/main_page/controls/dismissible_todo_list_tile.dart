// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/todo/todo_watcher/todo_watcher_bloc.dart';
import '../../../../domain/todo/models/todo.dart';
import '../../../services/theming/theme_extension.dart';
import 'todo_list_tile.dart';

class DismissibleTodoListTile extends StatelessWidget {
  final Todo todo;

  const DismissibleTodoListTile({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ObjectKey(todo),
      secondaryBackground: const _DeleteTodoDismissibleBackground(),
      background: const _CheckTodoDismissibleBackground(),
      confirmDismiss: (direction) => _confirmDismiss(context, direction),
      child: TodoListTile(todo: todo),
    );
  }

  Future<bool?> _confirmDismiss(
    BuildContext context,
    DismissDirection direction,
  ) {
    final bloc = context.read<TodoWatcherBloc>();
    if (direction == DismissDirection.endToStart) {
      bloc.add(TodoWatcherEvent.todoDeleted(todo));
      return Future.value(true);
    } else {
      bloc.add(TodoWatcherEvent.todoToggled(todo));
      return Future.value(false);
    }
  }
}

class _DeleteTodoDismissibleBackground extends StatelessWidget {
  const _DeleteTodoDismissibleBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).paletteController?.colorRed,
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Icon(
          Icons.delete,
          color: Theme.of(context).paletteController?.colorWhite,
        ),
      ),
    );
  }
}

class _CheckTodoDismissibleBackground extends StatelessWidget {
  const _CheckTodoDismissibleBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).paletteController?.colorGreen,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Icon(
          Icons.check,
          color: Theme.of(context).paletteController?.colorWhite,
        ),
      ),
    );
  }
}