// Mocks generated by Mockito 5.3.0 from annotations
// in todo_app/test/infrastructure/todo_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:todo_app/domain/core/services/i_device_id_provider.dart' as _i7;
import 'package:todo_app/domain/todo/i_todo_local_data_source.dart' as _i5;
import 'package:todo_app/domain/todo/i_todo_remote_data_source.dart' as _i3;
import 'package:todo_app/domain/todo/models/todo.dart' as _i6;
import 'package:todo_app/domain/todo/models/todo_data.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCollectionTodoData_0 extends _i1.SmartFake
    implements _i2.CollectionTodoData {
  _FakeCollectionTodoData_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeSingleTodoData_1 extends _i1.SmartFake
    implements _i2.SingleTodoData {
  _FakeSingleTodoData_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [ITodoRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoRemoteDataSource extends _i1.Mock
    implements _i3.ITodoRemoteDataSource {
  MockTodoRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.CollectionTodoData> getAll() => (super.noSuchMethod(
          Invocation.method(#getAll, []),
          returnValue: _i4.Future<_i2.CollectionTodoData>.value(
              _FakeCollectionTodoData_0(this, Invocation.method(#getAll, []))))
      as _i4.Future<_i2.CollectionTodoData>);
  @override
  _i4.Future<_i2.CollectionTodoData> replaceAll(
          _i2.CollectionTodoData? todoData) =>
      (super.noSuchMethod(Invocation.method(#replaceAll, [todoData]),
              returnValue: _i4.Future<_i2.CollectionTodoData>.value(
                  _FakeCollectionTodoData_0(
                      this, Invocation.method(#replaceAll, [todoData]))))
          as _i4.Future<_i2.CollectionTodoData>);
  @override
  _i4.Future<_i2.SingleTodoData> create(_i2.SingleTodoData? todoData) =>
      (super.noSuchMethod(Invocation.method(#create, [todoData]),
              returnValue: _i4.Future<_i2.SingleTodoData>.value(
                  _FakeSingleTodoData_1(
                      this, Invocation.method(#create, [todoData]))))
          as _i4.Future<_i2.SingleTodoData>);
  @override
  _i4.Future<_i2.SingleTodoData> get(String? todoId) => (super.noSuchMethod(
          Invocation.method(#get, [todoId]),
          returnValue: _i4.Future<_i2.SingleTodoData>.value(
              _FakeSingleTodoData_1(this, Invocation.method(#get, [todoId]))))
      as _i4.Future<_i2.SingleTodoData>);
  @override
  _i4.Future<_i2.SingleTodoData> update(_i2.SingleTodoData? todoData) =>
      (super.noSuchMethod(Invocation.method(#update, [todoData]),
              returnValue: _i4.Future<_i2.SingleTodoData>.value(
                  _FakeSingleTodoData_1(
                      this, Invocation.method(#update, [todoData]))))
          as _i4.Future<_i2.SingleTodoData>);
  @override
  _i4.Future<_i2.SingleTodoData> delete(_i2.SingleTodoData? todoData) =>
      (super.noSuchMethod(Invocation.method(#delete, [todoData]),
              returnValue: _i4.Future<_i2.SingleTodoData>.value(
                  _FakeSingleTodoData_1(
                      this, Invocation.method(#delete, [todoData]))))
          as _i4.Future<_i2.SingleTodoData>);
}

/// A class which mocks [ITodoLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoLocalDataSource extends _i1.Mock
    implements _i5.ITodoLocalDataSource {
  MockTodoLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<_i6.Todo?> watch() =>
      (super.noSuchMethod(Invocation.method(#watch, []),
          returnValue: _i4.Stream<_i6.Todo?>.empty()) as _i4.Stream<_i6.Todo?>);
  @override
  _i4.Future<int> getRevision() =>
      (super.noSuchMethod(Invocation.method(#getRevision, []),
          returnValue: _i4.Future<int>.value(0)) as _i4.Future<int>);
  @override
  _i4.Future<bool> isDurtyData() =>
      (super.noSuchMethod(Invocation.method(#isDurtyData, []),
          returnValue: _i4.Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i4.Future<void> setIsDurtyData(bool? value) => (super.noSuchMethod(
      Invocation.method(#setIsDurtyData, [value]),
      returnValue: _i4.Future<void>.value(),
      returnValueForMissingStub: _i4.Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<_i2.CollectionTodoData> getAll() => (super.noSuchMethod(
          Invocation.method(#getAll, []),
          returnValue: _i4.Future<_i2.CollectionTodoData>.value(
              _FakeCollectionTodoData_0(this, Invocation.method(#getAll, []))))
      as _i4.Future<_i2.CollectionTodoData>);
  @override
  _i4.Future<void> replaceAll(_i2.CollectionTodoData? todoData) =>
      (super.noSuchMethod(Invocation.method(#replaceAll, [todoData]),
              returnValue: _i4.Future<void>.value(),
              returnValueForMissingStub: _i4.Future<void>.value())
          as _i4.Future<void>);
  @override
  _i4.Future<_i2.SingleTodoData> get(String? todoId) => (super.noSuchMethod(
          Invocation.method(#get, [todoId]),
          returnValue: _i4.Future<_i2.SingleTodoData>.value(
              _FakeSingleTodoData_1(this, Invocation.method(#get, [todoId]))))
      as _i4.Future<_i2.SingleTodoData>);
  @override
  _i4.Future<void> add(_i2.SingleTodoData? todoData) => (super.noSuchMethod(
      Invocation.method(#add, [todoData]),
      returnValue: _i4.Future<void>.value(),
      returnValueForMissingStub: _i4.Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> update(_i2.SingleTodoData? todoData) => (super.noSuchMethod(
      Invocation.method(#update, [todoData]),
      returnValue: _i4.Future<void>.value(),
      returnValueForMissingStub: _i4.Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> delete(_i2.SingleTodoData? todoData) => (super.noSuchMethod(
      Invocation.method(#delete, [todoData]),
      returnValue: _i4.Future<void>.value(),
      returnValueForMissingStub: _i4.Future<void>.value()) as _i4.Future<void>);
}

/// A class which mocks [IDeviceIdProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeviceIdProvider extends _i1.Mock implements _i7.IDeviceIdProvider {
  MockDeviceIdProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<String> getDeviceId() =>
      (super.noSuchMethod(Invocation.method(#getDeviceId, []),
          returnValue: _i4.Future<String>.value('')) as _i4.Future<String>);
}
