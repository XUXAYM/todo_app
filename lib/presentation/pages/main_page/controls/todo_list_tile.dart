// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../domain/todo/models/todo_importance.dart';
import '../../../services/theming/theme_extension.dart';

class TodoListTile extends StatelessWidget {
  final TodoImportance importance;
  final bool isDone;
  final String title;
  final String? subtitle;

  const TodoListTile({
    super.key,
    this.subtitle,
    this.importance = const TodoImportance.normal(),
    required this.title,
    required this.isDone,
  });

  static const double _sizeAddendum = 4.0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _TodoCheckbox(isDone: isDone, importance: importance),
      trailing: const _EditTodoIconButton(),
      title: _buildTitle(context),
      subtitle: _buildSubtitle(context),
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
          TextSpan(text: title),
        ],
      ),
    );
  }

  TextStyle? _selectTitleTextStyle(BuildContext context) {
    final theme = Theme.of(context);
    final palette = theme.paletteController;

    return theme.textTheme.subtitle1?.copyWith(
      color: isDone ? palette?.labelTertiary : palette?.labelPrimary,
      decoration: isDone ? TextDecoration.lineThrough : null,
    );
  }

  List<InlineSpan> _buildLeadingWidget(BuildContext context) {
    double _calculateWidgetSize(ThemeData theme) {
      return theme.textTheme.subtitle1!.fontSize! + _sizeAddendum;
    }

    final theme = Theme.of(context);
    final palette = Theme.of(context).paletteController;

    return importance.maybeMap(
      high: (_) => [
        TextSpan(
          text: ' \u{203C} ',
          style: theme.textTheme.subtitle1!.copyWith(
            fontSize: _calculateWidgetSize(theme),
            color: palette?.colorRed,
          ),
        ),
      ],
      low: (_) => [
        WidgetSpan(
          child: Icon(
            CupertinoIcons.down_arrow,
            size: _calculateWidgetSize(theme),
            color: palette?.colorGray,
          ),
        ),
      ],
      orElse: () => const [],
    );
  }

  Widget? _buildSubtitle(BuildContext context) {
    if (subtitle == null) return null;

    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        subtitle!,
        style: theme.textTheme.bodyText2!
            .copyWith(color: theme.paletteController?.labelTertiary),
      ),
    );
  }
}

class _TodoCheckbox extends StatelessWidget {
  final bool isDone;
  final TodoImportance importance;

  const _TodoCheckbox({
    super.key,
    required this.isDone,
    required this.importance,
  });

  static const double _splashOpacity = 0.1;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isDone,
      overlayColor: _selectOverlayColor(context),
      fillColor: _selectFillColor(context),
      onChanged: (_) {},
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
            return importance.maybeMap(
              high: (_) => palette.colorRed,
              orElse: () => palette.supportSeparator,
            );
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
