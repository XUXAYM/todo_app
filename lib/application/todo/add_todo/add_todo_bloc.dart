import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/services/i_device_id_provider.dart';
import '../../../domain/todo/exceptions/repository_exceptions.dart';
import '../../../domain/todo/i_todo_repository.dart';
import '../../../domain/todo/models/todo.dart';
import '../../../presentation/services/logger_controller.dart';
import '../../core/methods.dart';

part 'add_todo_bloc.freezed.dart';
part 'add_todo_event.dart';
part 'add_todo_state.dart';

const Duration _duration = Duration(milliseconds: 150);

@injectable
class AddTodoBloc extends Bloc<AddTodoEvent, AddTodoState> {
  final ITodoRepository _todoRepository;
  final IDeviceIdProvider _deviceIdProvider;

  AddTodoBloc(
    ITodoRepository todoRepository,
    IDeviceIdProvider deviceIdProvider,
  )   : _todoRepository = todoRepository,
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
      await _todoRepository.add(todo);
    } on RepositoryException catch (e, stackTrace) {
      LoggerController.logger
          .warning('Some problem with repository', e, stackTrace);
    } on Object catch (e, stackTrace) {
      LoggerController.logger.warning('Unexpected exception', e, stackTrace);
      rethrow;
    } finally {
      emit(AddTodoState.empty());
    }
  }

  bool _isTextValid(String text) => text.trim().isNotEmpty;
}
