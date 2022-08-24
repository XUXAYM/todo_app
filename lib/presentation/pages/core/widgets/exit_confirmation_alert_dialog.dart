import 'package:flutter/material.dart';

import '../../../../injection.dart';
import '../../../services/navigating/i_navigation_controller.dart';
import '../../../services/s.dart';

class ExitConfirmationAlertDialog extends StatelessWidget {
  const ExitConfirmationAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${S.of(context).exitAlertTitle}?'),
      content: Text('${S.of(context).exitAlertContent}.'),
      actions: [
        TextButton(
          onPressed: () => getIt<INavigationController>().back(false),
          child: Text(S.of(context).cancel),
        ),
        TextButton(
          onPressed: () => getIt<INavigationController>().back(true),
          child: Text(S.of(context).exit),
        ),
      ],
    );
  }
}
