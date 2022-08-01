// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../application/todo/todo_watcher/todo_watcher_bloc.dart';
import '../../../../domain/todo/models/todo.dart';
import '../../../../domain/todo/models/todo_importance.dart';
import '../../../services/theming/assets_controller.dart';
import '../../../services/theming/theme_extension.dart';

class TodoListTile extends StatelessWidget {
  final Todo todo;

  const TodoListTile({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 4.0),
        _TodoCheckbox(todo: todo),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitle(context),
              ],
            ),
          ),
        ),
        const _EditTodoIconButton(),
      ],
    );
  }

  RichText _buildTitle(BuildContext context) {
    return RichText(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: _selectTitleTextStyle(context),
        children: [
          ..._buildLeadingWidget(context),
          TextSpan(text: todo.text),
        ],
      ),
    );
  }

  TextStyle? _selectTitleTextStyle(BuildContext context) {
    final theme = Theme.of(context);
    final palette = theme.paletteController;

    return theme.textTheme.subtitle1?.copyWith(
      color: todo.done ? palette?.labelTertiary : palette?.labelPrimary,
      decoration: todo.done ? TextDecoration.lineThrough : null,
    );
  }

  List<InlineSpan> _buildLeadingWidget(BuildContext context) {
    switch (todo.importance) {
      case TodoImportance.important:
        return [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: SvgPicture.asset(
                AssetsController.doubleExclamationMarkSVG,
                color: Theme.of(context).paletteController?.colorRed,
                width: 10,
                height: 16,
              ),
            ),
          ),
        ];
      case TodoImportance.low:
        return [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.only(right: 4.5),
              child: SvgPicture.asset(
                AssetsController.downArrowSVG,
                color: Theme.of(context).paletteController?.colorGray,
                width: 11,
                height: 14,
              ),
            ),
          ),
        ];
      default:
        return const [];
    }
  }

  Widget? _buildSubtitle(BuildContext context) {
    if (todo.deadline == null) return null;

    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        todo.deadline!.toIso8601String(),
        style: theme.textTheme.bodyText2!
            .copyWith(color: theme.paletteController?.labelTertiary),
      ),
    );
  }
}

class _TodoCheckbox extends StatelessWidget {
  final Todo todo;

  const _TodoCheckbox({
    super.key,
    required this.todo,
  });

  static const double _splashOpacity = 0.1;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: todo.done,
      overlayColor: _selectOverlayColor(context),
      fillColor: _selectFillColor(context),
      onChanged: (_) => context
          .read<TodoWatcherBloc>()
          .add(TodoWatcherEvent.todoToggled(todo)),
    );
  }

  MaterialStateColor _selectOverlayColor(BuildContext context) =>
      MaterialStateColor.resolveWith(
        (states) => _selectFillColor(context).withOpacity(_splashOpacity),
      );

  MaterialStateColor _selectFillColor(BuildContext context) =>
      MaterialStateColor.resolveWith(
        (states) {
          final palette = Theme.of(context).paletteController!;

          if (states.contains(MaterialState.selected)) {
            return palette.colorGreen;
          } else {
            switch (todo.importance) {
              case TodoImportance.important:
                return palette.colorRed;
              default:
                return palette.supportSeparator;
            }
          }
        },
      );
}

class _EditTodoIconButton extends StatelessWidget {
  const _EditTodoIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.info_outline,
        color: Theme.of(context).paletteController?.labelTertiary,
      ),
      onPressed: () {},
    );
  }
}
