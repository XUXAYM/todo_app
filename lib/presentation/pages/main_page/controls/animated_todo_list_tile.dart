import 'package:flutter/material.dart';

import '../../../../domain/todo/models/todo.dart';
import 'dismissible_todo_list_tile.dart';

class AnimatedTodoListTile extends StatefulWidget {
  final Todo todo;

  const AnimatedTodoListTile({
    super.key,
    required this.todo,
  });

  @override
  State<AnimatedTodoListTile> createState() => _AnimatedTodoListTileState();
}

class _AnimatedTodoListTileState extends State<AnimatedTodoListTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> scale;
  late final Animation<double> downscale;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    scale = CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0.0,
        0.3,
        curve: Curves.easeIn,
      ),
    ).drive(Tween(begin: 1.0, end: 1.05));

    downscale = CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0.7,
        1.0,
        curve: Curves.easeIn,
      ),
    ).drive(Tween(begin: 1.0, end: 1.0 / 1.05));

    controller.addListener(() => setState(() {}));
  }

  @override
  void didUpdateWidget(covariant AnimatedTodoListTile oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.todo.id == widget.todo.id && oldWidget.todo != widget.todo) {
      controller
        ..reset()
        ..forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: downscale,
      child: ScaleTransition(
        scale: scale,
        child: DismissibleTodoListTile(
          key: ValueKey(widget.todo.id),
          todo: widget.todo,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
