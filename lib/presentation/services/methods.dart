import 'package:flutter/material.dart';

import 'navigating/navigation_controller.dart';
import 's.dart';

Future<bool?> showExitAlertDialog(BuildContext context) => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${S.of(context).exitAlertTitle}?'),
        content: Text('${S.of(context).exitAlertContent}.'),
        actions: [
          TextButton(
            onPressed: () => NavigationController.navigateBack(false),
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () => NavigationController.navigateBack(true),
            child: Text(S.of(context).exit),
          ),
        ],
      ),
    );
