import 'package:injectable/injectable.dart';
import 'package:todo_app/main.dart';

@InjectableInit(generateForDir: ['lib', 'test'])
void testSetup() => setup(Environment.test);
