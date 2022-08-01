import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/todo/todo_watcher/todo_watcher_bloc.dart';
import '../../../injection.dart';
import 'controls/controls.dart';
import 'main_page_body.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TodoWatcherBloc>()
        ..add(const TodoWatcherEvent.todosRequested()),
      child: const Scaffold(
        body: MainPageBody(),
        floatingActionButton: AddTodoFloatingActionButton(),
      ),
    );
  }
}
