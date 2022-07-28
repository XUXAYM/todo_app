import 'package:uuid/uuid.dart';

class IdFactory {
  const IdFactory._();

  static const Uuid _uuid = Uuid();

  static String generateId() => _uuid.v4();
}
