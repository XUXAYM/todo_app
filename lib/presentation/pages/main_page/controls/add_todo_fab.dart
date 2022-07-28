import 'package:flutter/material.dart';

class AddTodoFloatingActionButton extends StatelessWidget {
  const AddTodoFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {},
    );
  }
}