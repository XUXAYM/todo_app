import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/todo/todo_form/todo_form_bloc.dart';
import '../../../injection.dart';
import '../../services/navigating/i_navigation_controller.dart';
import '../../services/theming/theme_extension.dart';
import 'controls/controls.dart';

class TodoPageBody extends StatelessWidget {
  const TodoPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoFormBloc, TodoFormState>(
      listenWhen: (_, current) => current.shouldPop,
      listener: (_, state) {
        if (state.shouldPop) getIt<INavigationController>().back();
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            if (state.isChanged) {
              return await getIt<INavigationController>().showExitAlertDialog();
            } else {
              return true;
            }
          },
          child: AbsorbPointer(
            absorbing: state.isLoading,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor:
                      Theme.of(context).paletteController?.backPrimary,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  elevation: 4.0,
                  actions: const [SaveTodoTextButton()],
                  leading: const CloseIconButton(),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
                        child: TodoTextField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TodoImportanceWidget(
                          importance: state.todo.importance,
                        ),
                      ),
                      const Divider(indent: 16.0, endIndent: 16.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 4.0),
                        child: TodoDeadlineWidget(
                          deadline: state.todo.deadline,
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: DeleteTodoTextButton(enabled: state.isEditing),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
