// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/todo/add_todo/add_todo_bloc.dart';
import '../../../../injection.dart';
import '../../../services/s.dart';
import '../../../services/theming/theme_extension.dart';

class AddTodoListTile extends StatelessWidget {
  const AddTodoListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddTodoBloc>(),
      child: const _AddTodoListTileBody(),
    );
  }
}

class _AddTodoListTileBody extends StatelessWidget {
  const _AddTodoListTileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 4.0),
        BlocBuilder<AddTodoBloc, AddTodoState>(
          buildWhen: (previous, current) =>
              previous.canCreate != current.canCreate,
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: state.canCreate
                  ? const _AddTodoIconButton()
                  : const SizedBox.square(dimension: 48.0),
            );
          },
        ),
        const Expanded(child: _AddTodoTextField()),
      ],
    );
  }
}

class _AddTodoIconButton extends StatelessWidget {
  const _AddTodoIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () =>
          context.read<AddTodoBloc>().add(const AddTodoEvent.addTodoPressed()),
    );
  }
}

class _AddTodoTextField extends StatelessWidget {
  const _AddTodoTextField({super.key});

  static const double _verticalSpace = 14.0;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: _configureInputDecoration(context),
      onChanged: (value) =>
          context.read<AddTodoBloc>().add(AddTodoEvent.textChanged(value)),
    );
  }

  InputDecoration _configureInputDecoration(BuildContext context) {
    return InputDecoration(
      border: InputBorder.none,
      hintText: S.of(context).newWord,
      hintStyle: Theme.of(context)
          .textTheme
          .subtitle1
          ?.copyWith(color: Theme.of(context).paletteController?.labelTertiary),
      contentPadding:
          const EdgeInsets.fromLTRB(0.0, _verticalSpace, 16.0, _verticalSpace),
    );
  }
}
