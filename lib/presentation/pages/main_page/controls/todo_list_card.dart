import 'package:flutter/material.dart';

import '../../../../domain/todo/todo_importance.dart';
import 'todo_list_tile.dart';

class TodoListCard extends StatelessWidget {
  const TodoListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: const EdgeInsets.all(8.0),
        child: ListView.custom(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          primary: false,
          shrinkWrap: true,
          childrenDelegate: SliverChildBuilderDelegate(
            (_, index) {
              const title =
                  'Сложно сказать, почему явные признаки победы институционализации, вне зависимости от их уровня, должны быть описаны максимально подробно. Разнообразный и богатый опыт говорит нам, что выбранный нами инновационный путь обеспечивает актуальность новых предложений. В своём стремлении улучшить пользовательский опыт мы упускаем, что предприниматели в сети интернет освещают чрезвычайно интересные особенности картины в целом, однако конкретные выводы, разумеется, функционально разнесены на независимые элементы. С учётом сложившейся международной обстановки, новая модель организационной деятельности предоставляет широкие возможности для благоприятных перспектив. Однозначно, некоторые особенности внутренней политики и по сей день остаются уделом либералов, которые жаждут быть своевременно верифицированы.';

              if (index % 3 == 0) {
                return const TodoListTile(
                  isDone: true,
                  title: title,
                );
              } else if (index % 4 == 0) {
                return const TodoListTile(
                  isDone: false,
                  title: title,
                  importance: TodoImportance.high(),
                );
              } else if (index % 5 == 0) {
                return const TodoListTile(
                  isDone: false,
                  title: title,
                  importance: TodoImportance.low(),
                );
              } else {
                return const TodoListTile(
                  isDone: false,
                  title: title,
                  subtitle: '2 июня 2021',
                );
              }
            },
            childCount: 8,
          ),
        ),
      ),
    );
  }
}
