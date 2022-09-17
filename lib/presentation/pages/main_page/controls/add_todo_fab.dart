import 'package:flutter/material.dart';
import 'package:todo_app/injection.dart';

import '../../../services/navigating/i_navigation_controller.dart';

class AddTodoFloatingActionButton extends StatelessWidget {
  const AddTodoFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => getIt<INavigationController>().toTodoForm(),
    );
  }
}
