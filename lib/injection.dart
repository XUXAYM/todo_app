import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';
import 'presentation/services/logger_controller.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies([String? environment]) {
  $initGetIt(
    getIt,
    environment: environment,
  );
  LoggerController.logger.info('Get It dependencies configured');
}
