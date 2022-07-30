import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/todo/exceptions/network_exceptions.dart';
import '../../domain/todo/i_todo_remote_data_source.dart';
import '../../domain/todo/models/todo_data.dart';

@LazySingleton(as: ITodoRemoteDataSource)
class YandexBackendTodoRemoteDataSource implements ITodoRemoteDataSource {
  final Dio _dio;

  YandexBackendTodoRemoteDataSource(
    Dio dio,
  ) : _dio = dio..options = _options;

  static final BaseOptions _options = BaseOptions(
    baseUrl: _baseUrl,
    headers: {
      'Authorization': 'Bearer $_apiKey',
    },
  );

  static const String _revisionHeader = 'X-Last-Known-Revision';

  static const String _baseUrl = 'https://beta.mrdekk.ru/todobackend';

  static const String _path = '/list';

  static const String _apiKey = 'Ekahull';

  @override
  Future<CollectionTodoData> getAll() => _exceptionMapper(
        () async {
          final response = await _dio.get<Map<String, dynamic>>(_path);

          if (response.data != null) {
            return TodoData.fromJson(response.data!) as CollectionTodoData;
          } else {
            throw const ServerException();
          }
        },
      );

  @override
  Future<CollectionTodoData> replaceAll(CollectionTodoData todoData) =>
      _exceptionMapper(
        () async {
          final response = await _dio.patch(
            _path,
            data: todoData.toJson()..remove('revision'),
            options: Options(
              headers: {_revisionHeader: todoData.revision},
            ),
          );

          if (response.data != null) {
            return TodoData.fromJson(response.data!) as CollectionTodoData;
          } else {
            throw const ServerException();
          }
        },
      );

  @override
  Future<SingleTodoData> get(String id) => _exceptionMapper(
        () async {
          final response = await _dio.get('$_path/$id');

          if (response.data != null) {
            return TodoData.fromJson(response.data!) as SingleTodoData;
          } else {
            throw const ServerException();
          }
        },
      );

  @override
  Future<SingleTodoData> create(SingleTodoData todoData) => _exceptionMapper(
        () async {
          final response = await _dio.post(
            '$_path/${todoData.todo.id}',
            data: todoData.toJson()..remove('revision'),
            options: Options(
              headers: {_revisionHeader: todoData.revision},
            ),
          );

          if (response.data != null) {
            return TodoData.fromJson(response.data!) as SingleTodoData;
          } else {
            throw const ServerException();
          }
        },
      );

  @override
  Future<SingleTodoData> update(SingleTodoData todoData) => _exceptionMapper(
        () async {
          final response = await _dio.put(
            '$_path/${todoData.todo.id}',
            data: todoData.toJson()..remove('revision'),
            options: Options(
              headers: {_revisionHeader: todoData.revision},
            ),
          );

          if (response.data != null) {
            return TodoData.fromJson(response.data!) as SingleTodoData;
          } else {
            throw const ServerException();
          }
        },
      );

  @override
  Future<SingleTodoData> delete(SingleTodoData todoData) => _exceptionMapper(
        () async {
          final response = await _dio.delete(
            '$_path/${todoData.todo.id}',
            options: Options(
              headers: {_revisionHeader: todoData.revision},
            ),
          );

          if (response.data != null) {
            return TodoData.fromJson(response.data!) as SingleTodoData;
          } else {
            throw const ServerException();
          }
        },
      );

  Future<T> _exceptionMapper<T>(FutureOr<T> Function() body) async {
    try {
      return await body();
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 400:
          if (e.response?.data.toString() == 'unsynchronizedData') {
            throw const UnsynchronizedDataException();
          } else {
            throw const BadRequestException();
          }
        case 401:
          throw const AuthorizationException();
        case 404:
          throw const NotFoundedException();
        default:
          if (e.response?.statusCode != null &&
              e.response!.statusCode! ~/ 100 == 5) {
            throw ServerException(e.response!.statusCode!);
          } else {
            throw UnexpectedNetworkException(e.response?.statusCode ?? -1);
          }
      }
    }
  }
}
