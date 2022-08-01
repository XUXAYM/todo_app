import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/todo/exceptions/cached_exceptions.dart';
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
  // TODO: Implement remote interactions
  final ITodoRemoteDataSource _remoteDataSource;

  AddTodoBloc(
    ITodoLocalDataSource todoLocalDataSource,
    ITodoRemoteDataSource todoRemoteDataSource,
  )   : _localDataSource = todoLocalDataSource,
        _remoteDataSource = todoRemoteDataSource,
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
    );

    try {
      final localRevision = await _localDataSource.getRevision();

      final todoData = TodoData.single(
        todo: todo,
        revision: localRevision,
      );

      await _localDataSource.add(todoData as SingleTodoData);
    } on CachedException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with saving todo localy', e, stackTrace);
    } finally {
      emit(AddTodoState.empty());
    }
  }

  bool _isTextValid(String text) => text.trim().isNotEmpty;
}
