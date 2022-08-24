abstract class RepositoryException implements Exception {
  const RepositoryException();
}

class DataModifyException extends RepositoryException {
  const DataModifyException();
}

class DataFetchException extends RepositoryException {
  const DataFetchException();
}
