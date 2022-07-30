abstract class NetworkException implements Exception {
  final int _statusCode;

  const NetworkException(int statusCode) : _statusCode = statusCode;

  int get statusCode => _statusCode;
}

class UnsynchronizedDataException extends NetworkException {
  const UnsynchronizedDataException([super.statusCode = 400]);
}

class BadRequestException extends NetworkException {
  const BadRequestException([super.statusCode = 400]);
}

class AuthorizationException extends NetworkException {
  const AuthorizationException([super.statusCode = 401]);
}

class NotFoundedException extends NetworkException {
  const NotFoundedException([super.statusCode = 404]);
}

class ServerException extends NetworkException {
  const ServerException([super.statusCode = 500]);
}

class UnexpectedNetworkException extends NetworkException {
  const UnexpectedNetworkException(super.statusCode);
}
