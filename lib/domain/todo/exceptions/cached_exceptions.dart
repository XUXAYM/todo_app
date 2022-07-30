abstract class CachedException implements Exception {
  const CachedException();
}

class NoDataException extends CachedException {
  const NoDataException();
}

class NotFoundedException extends CachedException {
  const NotFoundedException();
}
