import 'package:injectable/injectable.dart';
import 'package:todo_app/presentation/services/app_config.dart';

@InjectableInit(generateForDir: ['lib', 'test'])
void testSetup() => AppConfig.setup(Environment.test);
