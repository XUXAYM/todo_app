import 'package:flutter/material.dart';

import 'controls/controls.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          MainPageAppBar(completedCount: 3),
          TodoListCard(),
        ],
      ),
      floatingActionButton: AddTodoFloatingActionButton(),
    );
  }
}
