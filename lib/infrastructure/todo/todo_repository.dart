import 'package:injectable/injectable.dart';

import '../../domain/core/services/i_device_id_provider.dart';
import '../../domain/todo/exceptions/cached_exceptions.dart';
import '../../domain/todo/exceptions/network_exceptions.dart';
import '../../domain/todo/exceptions/repository_exceptions.dart';
import '../../domain/todo/i_todo_local_data_source.dart';
import '../../domain/todo/i_todo_remote_data_source.dart';
import '../../domain/todo/i_todo_repository.dart';
import '../../domain/todo/models/todo.dart';
import '../../domain/todo/models/todo_data.dart';
import '../../presentation/services/logger_controller.dart';

@LazySingleton(as: ITodoRepository)
class TodoRepository implements ITodoRepository {
  final ITodoLocalDataSource _localDataSource;
  final ITodoRemoteDataSource _remoteDataSource;
  final IDeviceIdProvider _deviceIdProvider;

  TodoRepository(
    ITodoLocalDataSource localDataSource,
    ITodoRemoteDataSource remoteDataSource,
    IDeviceIdProvider deviceIdProvider,
  )   : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource,
        _deviceIdProvider = deviceIdProvider;

  @override
  Stream<Todo?> watch() => _localDataSource.watch();

  @override
  Future<Iterable<Todo>> getAll([bool cached = false]) async {
    return cached ? _getCachedAll() : _getAllRemoteOtherwiseCached();
  }

  Future<Iterable<Todo>> _getAllRemoteOtherwiseCached() async {
    try {
      final remoteTodoData = await _remoteDataSource.getAll();
      await _localDataSource.replaceAll(remoteTodoData);

      return remoteTodoData.todos;
    } on NetworkException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with remote store', e, stackTrace);

      return _getCachedAll();
    } on CachedException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with local store', e, stackTrace);
      throw const DataModifyException();
    }
  }

  Future<Iterable<Todo>> _getCachedAll() async {
    try {
      final localTodoData = await _localDataSource.getAll();

      return localTodoData.todos;
    } on CachedException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with local store', e, stackTrace);
      throw const DataFetchException();
    }
  }

  @override
  Future<Todo> get(String todoId, [bool cached = false]) async {
    return cached ? _getCached(todoId) : _getRemoteOtherwiseCached(todoId);
  }

  Future<Todo> _getRemoteOtherwiseCached(String todoId) async {
    try {
      final remoteTodoData = await _remoteDataSource.get(todoId);
      await _localDataSource.update(remoteTodoData);

      return remoteTodoData.todo;
    } on NetworkException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with remote store', e, stackTrace);

      return _getCached(todoId);
    } on CachedException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with local store', e, stackTrace);
      throw const DataModifyException();
    }
  }

  Future<Todo> _getCached(String todoId) async {
    try {
      final localTodoData = await _localDataSource.get(todoId);

      return localTodoData.todo;
    } on CachedException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with local store', e, stackTrace);
      throw const DataFetchException();
    }
  }

  @override
  Future<void> add(Todo todo) async {
    late final TodoData todoData;

    try {
      final localRevision = await _localDataSource.getRevision();
      final deviceId = await _deviceIdProvider.getDeviceId();

      final date = DateTime.now();

      todoData = TodoData.single(
        todo: todo.copyWith(
          createdAt: date,
          changedAt: date,
          lastUpdatedBy: deviceId,
        ),
        revision: localRevision,
      );

      await _localDataSource.add(todoData as SingleTodoData);
    } on CachedException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with local store', e, stackTrace);
      throw const DataModifyException();
    }

    try {
      final remoteData = await _remoteDataSource.create(todoData);

      _localDataSource.update(remoteData);
    } on NetworkException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with remote store', e, stackTrace);

      _localDataSource.setIsDurtyData(true);
    } on CachedException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with local store', e, stackTrace);
    }
  }

  @override
  Future<void> update(Todo todo) async {
    late final TodoData todoData;

    try {
      final localRevision = await _localDataSource.getRevision();
      final deviceId = await _deviceIdProvider.getDeviceId();

      todoData = TodoData.single(
        todo: todo.copyWith(
          changedAt: DateTime.now(),
          lastUpdatedBy: deviceId,
        ),
        revision: localRevision,
      );

      await _localDataSource.update(todoData as SingleTodoData);
    } on CachedException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with todo localy storage', e, stackTrace);
      throw const DataModifyException();
    }

    try {
      final remoteData = await _remoteDataSource.update(todoData);

      _localDataSource.update(remoteData);
    } on NetworkException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with remote store', e, stackTrace);

      _localDataSource.setIsDurtyData(true);
    } on CachedException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with local store', e, stackTrace);
    }
  }

  @override
  Future<void> delete(Todo todo) async {
    try {
      final storedTodoData = await _localDataSource.get(todo.id);

      await _localDataSource.delete(storedTodoData);

      await _remoteDataSource.delete(storedTodoData);
    } on NetworkException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with remote store', e, stackTrace);

      await _localDataSource.setIsDurtyData(true);
    } on CachedException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with todo localy storage', e, stackTrace);
      throw const DataFetchException();
    }
  }

  @override
  Future<void> synchronizeData() async {
    try {
      if (await _localDataSource.isDurtyData()) {
        final localData = await _localDataSource.getAll();
        final mergedData = await _remoteDataSource.replaceAll(localData);
        await _localDataSource.replaceAll(mergedData);
        await _localDataSource.setIsDurtyData(false);
      }
    } on NetworkException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with remote store', e, stackTrace);
    } on CachedException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with saving todo localy', e, stackTrace);
    }
  }
}
