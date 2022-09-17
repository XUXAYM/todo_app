import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/domain/core/services/i_device_id_provider.dart';
import 'package:todo_app/domain/todo/exceptions/cached_exceptions.dart';
import 'package:todo_app/domain/todo/exceptions/network_exceptions.dart';
import 'package:todo_app/domain/todo/exceptions/repository_exceptions.dart';
import 'package:todo_app/domain/todo/i_todo_local_data_source.dart';
import 'package:todo_app/domain/todo/i_todo_remote_data_source.dart';
import 'package:todo_app/domain/todo/i_todo_repository.dart';
import 'package:todo_app/domain/todo/models/todo.dart';
import 'package:todo_app/domain/todo/models/todo_data.dart';
import 'package:todo_app/infrastructure/todo/todo_repository.dart';

import 'todo_repository_test.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<ITodoRemoteDataSource>(as: #MockTodoRemoteDataSource),
    MockSpec<ITodoLocalDataSource>(as: #MockTodoLocalDataSource),
    MockSpec<IDeviceIdProvider>(as: #MockDeviceIdProvider),
  ],
)
void main() {
  late MockTodoRemoteDataSource mockTodoRemoteDataSource;
  late MockTodoLocalDataSource mockTodoLocalDataSource;
  late MockDeviceIdProvider mockDeviceIdProvider;

  late ITodoRepository todoRepository;

  setUp(() {
    mockTodoRemoteDataSource = MockTodoRemoteDataSource();
    mockTodoLocalDataSource = MockTodoLocalDataSource();
    mockDeviceIdProvider = MockDeviceIdProvider();
    todoRepository = TodoRepository(
      mockTodoLocalDataSource,
      mockTodoRemoteDataSource,
      mockDeviceIdProvider,
    );
  });

  const tStr = 'test';
  const tInt = 1;
  final tDate = DateTime(2022);
  final tTodo = Todo(
    id: tStr,
    text: tStr,
    importance: TodoImportance.basic,
    done: false,
    createdAt: tDate,
    changedAt: tDate,
  );

  final tTodoList = [tTodo];

  final tSingleTodoData = SingleTodoData(
    todo: tTodo,
    revision: tInt,
  );

  final tRemoteTodoSingleData = SingleTodoData(
    todo: tTodo,
    revision: tInt + 1,
  );

  final tCollectionTodoData = CollectionTodoData(
    todos: tTodoList,
    revision: tInt,
  );

  final tRemoteTodoCollectionData = CollectionTodoData(
    todos: tTodoList,
    revision: tInt + 1,
  );

  setUp(
    () {
      when(
        mockTodoLocalDataSource.getRevision(),
      ).thenAnswer((_) => SynchronousFuture(tInt));
      when(
        mockDeviceIdProvider.getDeviceId(),
      ).thenAnswer((_) => SynchronousFuture(tStr));
    },
  );

  group(
    'getAll',
    () {
      test(
        'should return remote data',
        () async {
          //  Arrange
          when(
            mockTodoRemoteDataSource.getAll(),
          ).thenAnswer((_) => SynchronousFuture(tCollectionTodoData));
          when(
            mockTodoLocalDataSource.replaceAll(any),
          ).thenAnswer((_) async {});
          //  Act
          final result = await todoRepository.getAll();
          //  Assert
          expect(tTodoList, result);
        },
      );

      test(
        'should call remote data source '
        'and then save to local data source',
        () async {
          //  Arrange
          when(
            mockTodoRemoteDataSource.getAll(),
          ).thenAnswer((_) => SynchronousFuture(tCollectionTodoData));
          when(
            mockTodoLocalDataSource.replaceAll(any),
          ).thenAnswer((_) async {});
          //  Act
          await todoRepository.getAll();
          //  Assert
          verifyInOrder([
            mockTodoRemoteDataSource.getAll(),
            mockTodoLocalDataSource.replaceAll(tCollectionTodoData),
          ]);
        },
      );

      test(
        'should return local data, '
        'when remote data source throws an exception',
        () async {
          //  Arrange
          when(
            mockTodoRemoteDataSource.getAll(),
          ).thenThrow(const ServerException());
          when(
            mockTodoLocalDataSource.getAll(),
          ).thenAnswer((_) => SynchronousFuture(tCollectionTodoData));
          //  Act
          final result = await todoRepository.getAll();
          //  Assert
          expect(tTodoList, result);
          verifyInOrder([
            mockTodoRemoteDataSource.getAll(),
            mockTodoLocalDataSource.getAll(),
          ]);
        },
      );

      test(
        'should not call remote data source, '
        'if cached argument is true',
        () async {
          //  Arrange
          when(
            mockTodoLocalDataSource.getAll(),
          ).thenAnswer((_) => SynchronousFuture(tCollectionTodoData));
          //  Act
          await todoRepository.getAll(true);
          //  Assert
          verify(mockTodoLocalDataSource.getAll()).called(1);
          verifyNever(mockTodoRemoteDataSource.getAll());
        },
      );
    },
  );

  group(
    'get',
    () {
      test(
        'should return remote data',
        () async {
          //  Arrange
          when(
            mockTodoRemoteDataSource.get(any),
          ).thenAnswer((_) => SynchronousFuture(tSingleTodoData));
          when(
            mockTodoLocalDataSource.replaceAll(any),
          ).thenAnswer((_) async {});
          //  Act
          final result = await todoRepository.get(tStr);
          //  Assert
          expect(tTodo, result);
        },
      );

      test(
        'should call remote data source '
        'and then update localy',
        () async {
          //  Arrange
          when(
            mockTodoRemoteDataSource.get(any),
          ).thenAnswer((_) => SynchronousFuture(tSingleTodoData));
          when(
            mockTodoLocalDataSource.update(any),
          ).thenAnswer((_) async {});
          //  Act
          await todoRepository.get(tStr);
          //  Assert
          verifyInOrder([
            mockTodoRemoteDataSource.get(tStr),
            mockTodoLocalDataSource.update(tSingleTodoData),
          ]);
        },
      );

      test(
        'should return local data, '
        'when remote data source throws an exception',
        () async {
          //  Arrange
          when(
            mockTodoRemoteDataSource.get(any),
          ).thenThrow(const ServerException());
          when(
            mockTodoLocalDataSource.get(any),
          ).thenAnswer((_) => SynchronousFuture(tSingleTodoData));
          //  Act
          final result = await todoRepository.get(tStr);
          //  Assert
          expect(tTodo, result);
          verifyInOrder([
            mockTodoRemoteDataSource.get(tStr),
            mockTodoLocalDataSource.get(tStr),
          ]);
        },
      );

      test(
        'should not call remote data source, '
        'if cached argument is true',
        () async {
          //  Arrange
          when(
            mockTodoLocalDataSource.get(any),
          ).thenAnswer((_) => SynchronousFuture(tSingleTodoData));
          //  Act
          await todoRepository.get(tStr, true);
          //  Assert
          verify(mockTodoLocalDataSource.get(tStr)).called(1);
          verifyNever(mockTodoRemoteDataSource.get(any));
        },
      );
    },
  );

  group(
    'add',
    () {
      test(
        'should save to local data source '
        'and then save to remote data source',
        () async {
          //  Arrange
          when(
            mockTodoLocalDataSource.add(any),
          ).thenAnswer((_) async {});
          when(
            mockTodoLocalDataSource.update(any),
          ).thenAnswer((_) async {});
          when(
            mockTodoRemoteDataSource.create(any),
          ).thenAnswer((_) => SynchronousFuture(tRemoteTodoSingleData));
          //  Act
          await todoRepository.add(tTodo);
          //  Assert
          verifyInOrder([
            mockTodoLocalDataSource.getRevision(),
            mockTodoLocalDataSource.add(any),
            mockTodoRemoteDataSource.create(any),
            mockTodoLocalDataSource.update(any),
          ]);
        },
      );

      test(
        'should not save to remote data source, '
        'if local data source throws an exception '
        'and method should throw RepositoryException',
        () async {
          //  Arrange
          when(
            mockTodoLocalDataSource.add(any),
          ).thenThrow(const StorageException());
          when(
            mockTodoLocalDataSource.update(any),
          ).thenAnswer((_) async {});
          when(
            mockTodoRemoteDataSource.create(any),
          ).thenAnswer((_) => SynchronousFuture(tRemoteTodoSingleData));
          //  Act and Assert
          final request = todoRepository.add(tTodo);
          //  Assert
          await expectLater(request, throwsA(isA<RepositoryException>()));
          verify(mockTodoLocalDataSource.add(any)).called(1);
          verifyNever(mockTodoRemoteDataSource.create(any));
        },
      );

      test(
        'should not throw RepositoryException, '
        'if remote data source throws an exception',
        () async {
          //  Arrange
          when(
            mockTodoLocalDataSource.add(any),
          ).thenAnswer((_) async {});
          when(
            mockTodoRemoteDataSource.create(any),
          ).thenThrow(const ServerException());
          //  Act and Assert
          await todoRepository.add(tTodo);
          //  Assert
          verify(mockTodoLocalDataSource.add(any)).called(1);
          verify(mockTodoRemoteDataSource.create(any)).called(1);
        },
      );
    },
  );

  group(
    'update',
    () {
      test(
        'should update in local data source '
        'and then update in remote data source',
        () async {
          //  Arrange
          when(
            mockTodoLocalDataSource.update(any),
          ).thenAnswer((_) async {});
          when(
            mockTodoRemoteDataSource.update(any),
          ).thenAnswer((_) => SynchronousFuture(tRemoteTodoSingleData));
          //  Act
          await todoRepository.update(tTodo);
          //  Assert
          verifyInOrder([
            mockTodoLocalDataSource.getRevision(),
            mockTodoLocalDataSource.update(any),
            mockTodoRemoteDataSource.update(any),
            mockTodoLocalDataSource.update(any),
          ]);
        },
      );

      test(
        'should not update in remote data source, '
        'if local data source throws an exception '
        'and method should throw RepositoryException',
        () async {
          //  Arrange
          when(
            mockTodoLocalDataSource.update(any),
          ).thenThrow(const StorageException());
          when(
            mockTodoRemoteDataSource.update(any),
          ).thenAnswer((_) => SynchronousFuture(tRemoteTodoSingleData));
          //  Act and Assert
          final request = todoRepository.update(tTodo);
          //  Assert
          await expectLater(request, throwsA(isA<RepositoryException>()));
          verify(mockTodoLocalDataSource.update(any)).called(1);
          verifyNever(mockTodoRemoteDataSource.update(any));
        },
      );
      test(
        'should not throw RepositoryException, '
        'if remote data source throws an exception',
        () async {
          //  Arrange
          when(
            mockTodoLocalDataSource.update(any),
          ).thenAnswer((_) async {});
          when(
            mockTodoRemoteDataSource.update(any),
          ).thenThrow(const ServerException());
          //  Act and Assert
          await todoRepository.update(tTodo);
          //  Assert
          verify(mockTodoLocalDataSource.update(any)).called(1);
          verify(mockTodoRemoteDataSource.update(any)).called(1);
        },
      );
    },
  );

  group(
    'delete',
    () {
      setUp(
        () {
          when(
            mockTodoLocalDataSource.get(any),
          ).thenAnswer((_) => SynchronousFuture(tSingleTodoData));
        },
      );

      test(
        'should delete in local data source '
        'and then delete in remote data source',
        () async {
          //  Arrange
          when(
            mockTodoLocalDataSource.delete(any),
          ).thenAnswer((_) async {});
          when(
            mockTodoRemoteDataSource.delete(any),
          ).thenAnswer((_) => SynchronousFuture(tRemoteTodoSingleData));
          //  Act
          await todoRepository.delete(tTodo);
          //  Assert
          verifyInOrder([
            mockTodoLocalDataSource.get(any),
            mockTodoLocalDataSource.delete(any),
            mockTodoRemoteDataSource.delete(any),
          ]);
        },
      );

      test(
        'should not delete in remote data source, '
        'if local data source throws an exception '
        'and method should throw RepositoryException',
        () async {
          //  Arrange
          when(
            mockTodoLocalDataSource.delete(any),
          ).thenThrow(const StorageException());
          //  Act and Assert
          final request = todoRepository.delete(tTodo);
          //  Assert
          await expectLater(request, throwsA(isA<RepositoryException>()));
          verify(mockTodoLocalDataSource.delete(any)).called(1);
          verifyNever(mockTodoRemoteDataSource.delete(any));
        },
      );

      test(
        'should not throw RepositoryException, '
        'if remote data source throws an exception',
        () async {
          //  Arrange
          when(
            mockTodoLocalDataSource.delete(any),
          ).thenAnswer((_) async {});
          when(
            mockTodoRemoteDataSource.delete(any),
          ).thenThrow(const ServerException());
          //  Act and Assert
          await todoRepository.delete(tTodo);
          //  Assert
          verify(mockTodoLocalDataSource.delete(any)).called(1);
          verify(mockTodoRemoteDataSource.delete(any)).called(1);
        },
      );
    },
  );

  group('synchronizeData', () {
    group(
      'data is dirty',
      () {
        setUp(
          () {
            when(mockTodoLocalDataSource.isDurtyData())
                .thenAnswer((_) => SynchronousFuture(true));
          },
        );

        test(
          'should call remote repository replaceAll with local data, '
          'and then save synchronized data localy',
          () async {
            //  Arrange
            when(mockTodoLocalDataSource.getAll())
                .thenAnswer((_) => SynchronousFuture(tCollectionTodoData));
            when(mockTodoRemoteDataSource.replaceAll(any)).thenAnswer(
                (_) => SynchronousFuture(tRemoteTodoCollectionData));
            when(mockTodoLocalDataSource.replaceAll(any))
                .thenAnswer((_) async {});
            //  Act
            await todoRepository.synchronizeData();
            //  Assert
            verifyInOrder(
              [
                mockTodoLocalDataSource.getAll(),
                mockTodoRemoteDataSource.replaceAll(tCollectionTodoData),
                mockTodoLocalDataSource.replaceAll(tRemoteTodoCollectionData),
              ],
            );
          },
        );
      },
    );

    group(
      'data is not dirty',
      () {
        setUp(
          () {
            when(mockTodoLocalDataSource.isDurtyData())
                .thenAnswer((_) => SynchronousFuture(false));
          },
        );

        test('should not call any repository operations', () async {
          //  Act
          await todoRepository.synchronizeData();
          //  Assert
          verifyNever(mockTodoLocalDataSource.getAll());
          verifyNever(mockTodoRemoteDataSource.replaceAll(any));
          verifyNever(
              mockTodoLocalDataSource.replaceAll(tRemoteTodoCollectionData));
        });
      },
    );
  });
}
