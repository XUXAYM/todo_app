import 'package:flutter/material.dart';

import '../../../../domain/todo/models/todo.dart';
import 'animated_todo_list_tile.dart';
import 'controls.dart';

class TodoListCard extends StatelessWidget {
  final Iterable<Todo> todos;

  const TodoListCard({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.all(8.0),
      child: ClipRect(
        child: ListView.custom(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          primary: false,
          shrinkWrap: true,
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: todos.length + 1,
            (_, index) {
              if (index < todos.length) {
                final todo = todos.elementAt(index);

                return AnimatedTodoListTile(
                  key: ValueKey(todo.id),
                  todo: todo,
                );
              } else {
                return const AddTodoListTile();
              }
            },
          ),
        ),
      ),
    );
  }
}
