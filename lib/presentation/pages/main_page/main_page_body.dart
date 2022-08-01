import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/todo/todo_watcher/todo_watcher_bloc.dart';
import '../../../domain/todo/models/todo.dart';
import 'controls/controls.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoWatcherBloc, TodoWatcherState>(
      buildWhen: (previous, current) => !current.isLoading,
      builder: (context, state) {
        if (state.initial) return const LoadingWidget();

        return CustomScrollView(
          slivers: [
            MainPageAppBar(completedCount: _getDoneTodoCount(state)),
            SliverToBoxAdapter(
              child: TodoListCard(todos: _sortAndFilterTodoList(state)),
            ),
          ],
        );
      },
    );
  }

  int _getDoneTodoCount(TodoWatcherState state) =>
      state.todos.where((todo) => todo.done).length;

  List<Todo> _sortAndFilterTodoList(TodoWatcherState state) {
    return state.todos
        .where((todo) => !todo.done || !state.hideCompleted)
        .toList()
      ..sort(
        (t1, t2) => -1 * t1.createdAt.compareTo(t2.createdAt),
      );
  }
}
