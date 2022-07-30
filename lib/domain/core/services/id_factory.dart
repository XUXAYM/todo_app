import 'package:uuid/uuid.dart';

class IdFactory {
  const IdFactory._();

  static const Uuid _uuid = Uuid();

  static String generate() => _uuid.v4();
}
