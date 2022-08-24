import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../application/todo/todo_form/todo_form_bloc.dart';
import '../../../services/s.dart';
import '../../../services/theming/theme_extension.dart';

class TodoDeadlineWidget extends StatelessWidget {
  final DateTime? deadline;

  const TodoDeadlineWidget({super.key, required this.deadline});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).done_by,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            if (deadline != null)
              Text(
                DateFormat.yMMMMd(S.of(context).localeName).format(deadline!),
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Theme.of(context).paletteController?.colorBlue,
                    ),
              ),
          ],
        ),
        Switch(
          value: deadline != null,
          onChanged: (value) => _onSwitchChange(context, value),
        ),
      ],
    );
  }

  void _onSwitchChange(BuildContext context, bool value) {
    if (value) {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 30)),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Theme.of(context).paletteController!.colorBlue,
                onSurface: Theme.of(context).paletteController!.labelPrimary,
              ),
            ),
            child: child!,
          );
        },
        // Linter doesn't like async calling to context
      ).then(
        (date) {
          if (date != null) {
            context
                .read<TodoFormBloc>()
                .add(TodoFormEvent.deadlineChanged(date));
          }
        },
      );
    } else {
      context
          .read<TodoFormBloc>()
          .add(const TodoFormEvent.deadlineChanged(null));
    }
  }
}
