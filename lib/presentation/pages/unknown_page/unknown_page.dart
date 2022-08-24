import 'package:flutter/material.dart';

import '../../../injection.dart';
import '../../services/navigating/i_navigation_controller.dart';
import '../../services/s.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UnknownPageWidget(),
    );
  }
}

class UnknownPageWidget extends StatelessWidget {
  const UnknownPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).pageNotFound,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () => getIt<INavigationController>().back(),
            child: Text(S.of(context).back),
          )
        ],
      ),
    ));
  }
}
