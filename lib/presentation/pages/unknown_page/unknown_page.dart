import 'package:flutter/material.dart';

import '../../services/navigating/navigation_controller.dart';
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
            onPressed: () => NavigationController.navigateBack(),
            child: Text(S.of(context).back),
          )
        ],
      ),
    ));
  }
}
