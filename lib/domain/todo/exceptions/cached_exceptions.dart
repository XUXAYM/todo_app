abstract class CachedException implements Exception {
  const CachedException();
}

class StorageException extends CachedException {
  const StorageException();
}

class NotFoundedException extends CachedException {
  const NotFoundedException();
}
