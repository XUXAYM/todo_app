import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../application/todo/todo_form/todo_form_bloc.dart';
import '../../../../domain/todo/models/todo_importance.dart';
import '../../../services/s.dart';
import '../../../services/theming/assets_controller.dart';
import '../../../services/theming/theme_extension.dart';

class TodoImportanceWidget extends StatelessWidget {
  final TodoImportance importance;

  const TodoImportanceWidget({super.key, required this.importance});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).importance,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(
          width: 164.0,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<TodoImportance>(
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Theme.of(context).paletteController?.labelTertiary,
                  ),
              elevation: 1,
              value: importance,
              isDense: true,
              icon: const SizedBox(),
              selectedItemBuilder: _buildSelectedMenuItems,
              items: _buildMenuItems(context),
              onChanged: (value) => _onChanged(context, value),
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<TodoImportance>> _buildSelectedMenuItems(
    BuildContext context,
  ) {
    return TodoImportance.values
        .map<DropdownMenuItem<TodoImportance>>(
          (importance) => DropdownMenuItem(
            value: importance,
            child: Text(_mapTodoImportanceToText(context, importance)),
          ),
        )
        .toList();
  }

  List<DropdownMenuItem<TodoImportance>> _buildMenuItems(BuildContext context) {
    final theme = Theme.of(context);

    return TodoImportance.values.map<DropdownMenuItem<TodoImportance>>(
      (importance) {
        switch (importance) {
          case TodoImportance.important:
            return DropdownMenuItem(
              value: importance,
              child: RichText(
                textWidthBasis: TextWidthBasis.longestLine,
                softWrap: false,
                text: TextSpan(
                  style: theme.textTheme.subtitle1?.copyWith(
                    color: theme.paletteController?.labelPrimary,
                  ),
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: SvgPicture.asset(
                          AssetsController.doubleExclamationMarkSVG,
                          color: theme.paletteController?.colorAttention,
                          height: 12,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: _mapTodoImportanceToText(
                        context,
                        importance,
                      ),
                      style: theme.textTheme.subtitle1?.copyWith(
                        color: theme.paletteController?.colorAttention,
                      ),
                    ),
                  ],
                ),
              ),
            );
          default:
            return DropdownMenuItem(
              value: importance,
              child: Text(
                _mapTodoImportanceToText(context, importance),
                style: theme.textTheme.subtitle1?.copyWith(
                  color: theme.paletteController?.labelPrimary,
                ),
              ),
            );
        }
      },
    ).toList();
  }

  String _mapTodoImportanceToText(
    BuildContext context,
    TodoImportance todoImportance,
  ) {
    switch (todoImportance) {
      case TodoImportance.basic:
        return S.of(context).no;
      case TodoImportance.low:
        return S.of(context).low;
      case TodoImportance.important:
        return S.of(context).high;
      default:
        return todoImportance.name;
    }
  }

  void _onChanged(BuildContext context, TodoImportance? value) {
    if (value != null) {
      context.read<TodoFormBloc>().add(TodoFormEvent.importanceChanged(value));
    }
  }
}
