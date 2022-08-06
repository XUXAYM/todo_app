import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/services/i_device_id_provider.dart';
import '../../../domain/todo/exceptions/cached_exceptions.dart';
import '../../../domain/todo/exceptions/network_exceptions.dart';
import '../../../domain/todo/i_todo_local_data_source.dart';
import '../../../domain/todo/i_todo_remote_data_source.dart';
import '../../../domain/todo/models/todo.dart';
import '../../../domain/todo/models/todo_data.dart';
import '../../../presentation/services/logger_controller.dart';
import '../../core/methods.dart';

part 'add_todo_bloc.freezed.dart';
part 'add_todo_event.dart';
part 'add_todo_state.dart';

const Duration _duration = Duration(milliseconds: 150);

@injectable
class AddTodoBloc extends Bloc<AddTodoEvent, AddTodoState> {
  final ITodoLocalDataSource _localDataSource;
  final ITodoRemoteDataSource _remoteDataSource;
  final IDeviceIdProvider _deviceIdProvider;

  AddTodoBloc(
    ITodoLocalDataSource todoLocalDataSource,
    ITodoRemoteDataSource todoRemoteDataSource,
    IDeviceIdProvider deviceIdProvider,
  )   : _localDataSource = todoLocalDataSource,
        _remoteDataSource = todoRemoteDataSource,
        _deviceIdProvider = deviceIdProvider,
        super(AddTodoState.empty()) {
    on<_TextChanged>(_textChanged, transformer: debounce(_duration));
    on<_AddTodoPressed>(_addTodoPressed);
  }

  FutureOr<void> _textChanged(
    _TextChanged event,
    Emitter<AddTodoState> emit,
  ) async {
    emit(AddTodoState(
      text: event.text,
      isLoading: false,
      canCreate: _isTextValid(event.text),
    ));
  }

  FutureOr<void> _addTodoPressed(
    _AddTodoPressed event,
    Emitter<AddTodoState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, exception: null));

    final createdTime = DateTime.now();
    final todo = Todo.textOnly(state.text).copyWith(
      createdAt: createdTime,
      changedAt: createdTime,
      lastUpdatedBy: await _deviceIdProvider.getDeviceId(),
    );

    try {
      final localRevision = await _localDataSource.getRevision();

      final todoData = TodoData.single(
        todo: todo,
        revision: localRevision,
      ) as SingleTodoData;

      await _localDataSource.add(todoData);

      try {
        final remoteTodoData = await _remoteDataSource.create(todoData);

        await _localDataSource.update(remoteTodoData);
      } on NetworkException catch (e, stackTrace) {
        LoggerController.logger
            .warning('Some problem with remote store', e, stackTrace);

        await _localDataSource.setIsDurtyData(true);
      }
    } on CachedException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with saving todo localy', e, stackTrace);
    } finally {
      emit(AddTodoState.empty());
    }
  }

  bool _isTextValid(String text) => text.trim().isNotEmpty;
}
