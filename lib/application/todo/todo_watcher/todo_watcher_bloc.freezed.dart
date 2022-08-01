// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() todosRequested,
    required TResult Function() completedVisibilityChanged,
    required TResult Function(Todo todo) todoDeleted,
    required TResult Function(Todo todo) todoToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? todosRequested,
    TResult Function()? completedVisibilityChanged,
    TResult Function(Todo todo)? todoDeleted,
    TResult Function(Todo todo)? todoToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? todosRequested,
    TResult Function()? completedVisibilityChanged,
    TResult Function(Todo todo)? todoDeleted,
    TResult Function(Todo todo)? todoToggled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodosRequested value) todosRequested,
    required TResult Function(_CompletedVisibilityChanged value)
        completedVisibilityChanged,
    required TResult Function(_TodoDeleted value) todoDeleted,
    required TResult Function(_TodoToggled value) todoToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TodosRequested value)? todosRequested,
    TResult Function(_CompletedVisibilityChanged value)?
        completedVisibilityChanged,
    TResult Function(_TodoDeleted value)? todoDeleted,
    TResult Function(_TodoToggled value)? todoToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodosRequested value)? todosRequested,
    TResult Function(_CompletedVisibilityChanged value)?
        completedVisibilityChanged,
    TResult Function(_TodoDeleted value)? todoDeleted,
    TResult Function(_TodoToggled value)? todoToggled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoWatcherEventCopyWith<$Res> {
  factory $TodoWatcherEventCopyWith(
          TodoWatcherEvent value, $Res Function(TodoWatcherEvent) then) =
      _$TodoWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TodoWatcherEventCopyWithImpl<$Res>
    implements $TodoWatcherEventCopyWith<$Res> {
  _$TodoWatcherEventCopyWithImpl(this._value, this._then);

  final TodoWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(TodoWatcherEvent) _then;
}

/// @nodoc
abstract class _$$_TodosRequestedCopyWith<$Res> {
  factory _$$_TodosRequestedCopyWith(
          _$_TodosRequested value, $Res Function(_$_TodosRequested) then) =
      __$$_TodosRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TodosRequestedCopyWithImpl<$Res>
    extends _$TodoWatcherEventCopyWithImpl<$Res>
    implements _$$_TodosRequestedCopyWith<$Res> {
  __$$_TodosRequestedCopyWithImpl(
      _$_TodosRequested _value, $Res Function(_$_TodosRequested) _then)
      : super(_value, (v) => _then(v as _$_TodosRequested));

  @override
  _$_TodosRequested get _value => super._value as _$_TodosRequested;
}

/// @nodoc

class _$_TodosRequested implements _TodosRequested {
  const _$_TodosRequested();

  @override
  String toString() {
    return 'TodoWatcherEvent.todosRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_TodosRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() todosRequested,
    required TResult Function() completedVisibilityChanged,
    required TResult Function(Todo todo) todoDeleted,
    required TResult Function(Todo todo) todoToggled,
  }) {
    return todosRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? todosRequested,
    TResult Function()? completedVisibilityChanged,
    TResult Function(Todo todo)? todoDeleted,
    TResult Function(Todo todo)? todoToggled,
  }) {
    return todosRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? todosRequested,
    TResult Function()? completedVisibilityChanged,
    TResult Function(Todo todo)? todoDeleted,
    TResult Function(Todo todo)? todoToggled,
    required TResult orElse(),
  }) {
    if (todosRequested != null) {
      return todosRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodosRequested value) todosRequested,
    required TResult Function(_CompletedVisibilityChanged value)
        completedVisibilityChanged,
    required TResult Function(_TodoDeleted value) todoDeleted,
    required TResult Function(_TodoToggled value) todoToggled,
  }) {
    return todosRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TodosRequested value)? todosRequested,
    TResult Function(_CompletedVisibilityChanged value)?
        completedVisibilityChanged,
    TResult Function(_TodoDeleted value)? todoDeleted,
    TResult Function(_TodoToggled value)? todoToggled,
  }) {
    return todosRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodosRequested value)? todosRequested,
    TResult Function(_CompletedVisibilityChanged value)?
        completedVisibilityChanged,
    TResult Function(_TodoDeleted value)? todoDeleted,
    TResult Function(_TodoToggled value)? todoToggled,
    required TResult orElse(),
  }) {
    if (todosRequested != null) {
      return todosRequested(this);
    }
    return orElse();
  }
}

abstract class _TodosRequested implements TodoWatcherEvent {
  const factory _TodosRequested() = _$_TodosRequested;
}

/// @nodoc
abstract class _$$_CompletedVisibilityChangedCopyWith<$Res> {
  factory _$$_CompletedVisibilityChangedCopyWith(
          _$_CompletedVisibilityChanged value,
          $Res Function(_$_CompletedVisibilityChanged) then) =
      __$$_CompletedVisibilityChangedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CompletedVisibilityChangedCopyWithImpl<$Res>
    extends _$TodoWatcherEventCopyWithImpl<$Res>
    implements _$$_CompletedVisibilityChangedCopyWith<$Res> {
  __$$_CompletedVisibilityChangedCopyWithImpl(
      _$_CompletedVisibilityChanged _value,
      $Res Function(_$_CompletedVisibilityChanged) _then)
      : super(_value, (v) => _then(v as _$_CompletedVisibilityChanged));

  @override
  _$_CompletedVisibilityChanged get _value =>
      super._value as _$_CompletedVisibilityChanged;
}

/// @nodoc

class _$_CompletedVisibilityChanged implements _CompletedVisibilityChanged {
  const _$_CompletedVisibilityChanged();

  @override
  String toString() {
    return 'TodoWatcherEvent.completedVisibilityChanged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompletedVisibilityChanged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() todosRequested,
    required TResult Function() completedVisibilityChanged,
    required TResult Function(Todo todo) todoDeleted,
    required TResult Function(Todo todo) todoToggled,
  }) {
    return completedVisibilityChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? todosRequested,
    TResult Function()? completedVisibilityChanged,
    TResult Function(Todo todo)? todoDeleted,
    TResult Function(Todo todo)? todoToggled,
  }) {
    return completedVisibilityChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? todosRequested,
    TResult Function()? completedVisibilityChanged,
    TResult Function(Todo todo)? todoDeleted,
    TResult Function(Todo todo)? todoToggled,
    required TResult orElse(),
  }) {
    if (completedVisibilityChanged != null) {
      return completedVisibilityChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodosRequested value) todosRequested,
    required TResult Function(_CompletedVisibilityChanged value)
        completedVisibilityChanged,
    required TResult Function(_TodoDeleted value) todoDeleted,
    required TResult Function(_TodoToggled value) todoToggled,
  }) {
    return completedVisibilityChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TodosRequested value)? todosRequested,
    TResult Function(_CompletedVisibilityChanged value)?
        completedVisibilityChanged,
    TResult Function(_TodoDeleted value)? todoDeleted,
    TResult Function(_TodoToggled value)? todoToggled,
  }) {
    return completedVisibilityChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodosRequested value)? todosRequested,
    TResult Function(_CompletedVisibilityChanged value)?
        completedVisibilityChanged,
    TResult Function(_TodoDeleted value)? todoDeleted,
    TResult Function(_TodoToggled value)? todoToggled,
    required TResult orElse(),
  }) {
    if (completedVisibilityChanged != null) {
      return completedVisibilityChanged(this);
    }
    return orElse();
  }
}

abstract class _CompletedVisibilityChanged implements TodoWatcherEvent {
  const factory _CompletedVisibilityChanged() = _$_CompletedVisibilityChanged;
}

/// @nodoc
abstract class _$$_TodoDeletedCopyWith<$Res> {
  factory _$$_TodoDeletedCopyWith(
          _$_TodoDeleted value, $Res Function(_$_TodoDeleted) then) =
      __$$_TodoDeletedCopyWithImpl<$Res>;
  $Res call({Todo todo});

  $TodoCopyWith<$Res> get todo;
}

/// @nodoc
class __$$_TodoDeletedCopyWithImpl<$Res>
    extends _$TodoWatcherEventCopyWithImpl<$Res>
    implements _$$_TodoDeletedCopyWith<$Res> {
  __$$_TodoDeletedCopyWithImpl(
      _$_TodoDeleted _value, $Res Function(_$_TodoDeleted) _then)
      : super(_value, (v) => _then(v as _$_TodoDeleted));

  @override
  _$_TodoDeleted get _value => super._value as _$_TodoDeleted;

  @override
  $Res call({
    Object? todo = freezed,
  }) {
    return _then(_$_TodoDeleted(
      todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo,
    ));
  }

  @override
  $TodoCopyWith<$Res> get todo {
    return $TodoCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value));
    });
  }
}

/// @nodoc

class _$_TodoDeleted implements _TodoDeleted {
  const _$_TodoDeleted(this.todo);

  @override
  final Todo todo;

  @override
  String toString() {
    return 'TodoWatcherEvent.todoDeleted(todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoDeleted &&
            const DeepCollectionEquality().equals(other.todo, todo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(todo));

  @JsonKey(ignore: true)
  @override
  _$$_TodoDeletedCopyWith<_$_TodoDeleted> get copyWith =>
      __$$_TodoDeletedCopyWithImpl<_$_TodoDeleted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() todosRequested,
    required TResult Function() completedVisibilityChanged,
    required TResult Function(Todo todo) todoDeleted,
    required TResult Function(Todo todo) todoToggled,
  }) {
    return todoDeleted(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? todosRequested,
    TResult Function()? completedVisibilityChanged,
    TResult Function(Todo todo)? todoDeleted,
    TResult Function(Todo todo)? todoToggled,
  }) {
    return todoDeleted?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? todosRequested,
    TResult Function()? completedVisibilityChanged,
    TResult Function(Todo todo)? todoDeleted,
    TResult Function(Todo todo)? todoToggled,
    required TResult orElse(),
  }) {
    if (todoDeleted != null) {
      return todoDeleted(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodosRequested value) todosRequested,
    required TResult Function(_CompletedVisibilityChanged value)
        completedVisibilityChanged,
    required TResult Function(_TodoDeleted value) todoDeleted,
    required TResult Function(_TodoToggled value) todoToggled,
  }) {
    return todoDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TodosRequested value)? todosRequested,
    TResult Function(_CompletedVisibilityChanged value)?
        completedVisibilityChanged,
    TResult Function(_TodoDeleted value)? todoDeleted,
    TResult Function(_TodoToggled value)? todoToggled,
  }) {
    return todoDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodosRequested value)? todosRequested,
    TResult Function(_CompletedVisibilityChanged value)?
        completedVisibilityChanged,
    TResult Function(_TodoDeleted value)? todoDeleted,
    TResult Function(_TodoToggled value)? todoToggled,
    required TResult orElse(),
  }) {
    if (todoDeleted != null) {
      return todoDeleted(this);
    }
    return orElse();
  }
}

abstract class _TodoDeleted implements TodoWatcherEvent {
  const factory _TodoDeleted(final Todo todo) = _$_TodoDeleted;

  Todo get todo;
  @JsonKey(ignore: true)
  _$$_TodoDeletedCopyWith<_$_TodoDeleted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TodoToggledCopyWith<$Res> {
  factory _$$_TodoToggledCopyWith(
          _$_TodoToggled value, $Res Function(_$_TodoToggled) then) =
      __$$_TodoToggledCopyWithImpl<$Res>;
  $Res call({Todo todo});

  $TodoCopyWith<$Res> get todo;
}

/// @nodoc
class __$$_TodoToggledCopyWithImpl<$Res>
    extends _$TodoWatcherEventCopyWithImpl<$Res>
    implements _$$_TodoToggledCopyWith<$Res> {
  __$$_TodoToggledCopyWithImpl(
      _$_TodoToggled _value, $Res Function(_$_TodoToggled) _then)
      : super(_value, (v) => _then(v as _$_TodoToggled));

  @override
  _$_TodoToggled get _value => super._value as _$_TodoToggled;

  @override
  $Res call({
    Object? todo = freezed,
  }) {
    return _then(_$_TodoToggled(
      todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo,
    ));
  }

  @override
  $TodoCopyWith<$Res> get todo {
    return $TodoCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value));
    });
  }
}

/// @nodoc

class _$_TodoToggled implements _TodoToggled {
  const _$_TodoToggled(this.todo);

  @override
  final Todo todo;

  @override
  String toString() {
    return 'TodoWatcherEvent.todoToggled(todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoToggled &&
            const DeepCollectionEquality().equals(other.todo, todo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(todo));

  @JsonKey(ignore: true)
  @override
  _$$_TodoToggledCopyWith<_$_TodoToggled> get copyWith =>
      __$$_TodoToggledCopyWithImpl<_$_TodoToggled>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() todosRequested,
    required TResult Function() completedVisibilityChanged,
    required TResult Function(Todo todo) todoDeleted,
    required TResult Function(Todo todo) todoToggled,
  }) {
    return todoToggled(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? todosRequested,
    TResult Function()? completedVisibilityChanged,
    TResult Function(Todo todo)? todoDeleted,
    TResult Function(Todo todo)? todoToggled,
  }) {
    return todoToggled?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? todosRequested,
    TResult Function()? completedVisibilityChanged,
    TResult Function(Todo todo)? todoDeleted,
    TResult Function(Todo todo)? todoToggled,
    required TResult orElse(),
  }) {
    if (todoToggled != null) {
      return todoToggled(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodosRequested value) todosRequested,
    required TResult Function(_CompletedVisibilityChanged value)
        completedVisibilityChanged,
    required TResult Function(_TodoDeleted value) todoDeleted,
    required TResult Function(_TodoToggled value) todoToggled,
  }) {
    return todoToggled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TodosRequested value)? todosRequested,
    TResult Function(_CompletedVisibilityChanged value)?
        completedVisibilityChanged,
    TResult Function(_TodoDeleted value)? todoDeleted,
    TResult Function(_TodoToggled value)? todoToggled,
  }) {
    return todoToggled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodosRequested value)? todosRequested,
    TResult Function(_CompletedVisibilityChanged value)?
        completedVisibilityChanged,
    TResult Function(_TodoDeleted value)? todoDeleted,
    TResult Function(_TodoToggled value)? todoToggled,
    required TResult orElse(),
  }) {
    if (todoToggled != null) {
      return todoToggled(this);
    }
    return orElse();
  }
}

abstract class _TodoToggled implements TodoWatcherEvent {
  const factory _TodoToggled(final Todo todo) = _$_TodoToggled;

  Todo get todo;
  @JsonKey(ignore: true)
  _$$_TodoToggledCopyWith<_$_TodoToggled> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TodoWatcherState {
  Iterable<Todo> get todos => throw _privateConstructorUsedError;
  bool get hideCompleted => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get initial => throw _privateConstructorUsedError;
  Exception? get exception => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoWatcherStateCopyWith<TodoWatcherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoWatcherStateCopyWith<$Res> {
  factory $TodoWatcherStateCopyWith(
          TodoWatcherState value, $Res Function(TodoWatcherState) then) =
      _$TodoWatcherStateCopyWithImpl<$Res>;
  $Res call(
      {Iterable<Todo> todos,
      bool hideCompleted,
      bool isLoading,
      bool initial,
      Exception? exception});
}

/// @nodoc
class _$TodoWatcherStateCopyWithImpl<$Res>
    implements $TodoWatcherStateCopyWith<$Res> {
  _$TodoWatcherStateCopyWithImpl(this._value, this._then);

  final TodoWatcherState _value;
  // ignore: unused_field
  final $Res Function(TodoWatcherState) _then;

  @override
  $Res call({
    Object? todos = freezed,
    Object? hideCompleted = freezed,
    Object? isLoading = freezed,
    Object? initial = freezed,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as Iterable<Todo>,
      hideCompleted: hideCompleted == freezed
          ? _value.hideCompleted
          : hideCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      initial: initial == freezed
          ? _value.initial
          : initial // ignore: cast_nullable_to_non_nullable
              as bool,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc
abstract class _$$_TodoWatcherStateCopyWith<$Res>
    implements $TodoWatcherStateCopyWith<$Res> {
  factory _$$_TodoWatcherStateCopyWith(
          _$_TodoWatcherState value, $Res Function(_$_TodoWatcherState) then) =
      __$$_TodoWatcherStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Iterable<Todo> todos,
      bool hideCompleted,
      bool isLoading,
      bool initial,
      Exception? exception});
}

/// @nodoc
class __$$_TodoWatcherStateCopyWithImpl<$Res>
    extends _$TodoWatcherStateCopyWithImpl<$Res>
    implements _$$_TodoWatcherStateCopyWith<$Res> {
  __$$_TodoWatcherStateCopyWithImpl(
      _$_TodoWatcherState _value, $Res Function(_$_TodoWatcherState) _then)
      : super(_value, (v) => _then(v as _$_TodoWatcherState));

  @override
  _$_TodoWatcherState get _value => super._value as _$_TodoWatcherState;

  @override
  $Res call({
    Object? todos = freezed,
    Object? hideCompleted = freezed,
    Object? isLoading = freezed,
    Object? initial = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_TodoWatcherState(
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as Iterable<Todo>,
      hideCompleted: hideCompleted == freezed
          ? _value.hideCompleted
          : hideCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      initial: initial == freezed
          ? _value.initial
          : initial // ignore: cast_nullable_to_non_nullable
              as bool,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$_TodoWatcherState implements _TodoWatcherState {
  _$_TodoWatcherState(
      {required this.todos,
      required this.hideCompleted,
      this.isLoading = false,
      this.initial = false,
      this.exception});

  @override
  final Iterable<Todo> todos;
  @override
  final bool hideCompleted;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool initial;
  @override
  final Exception? exception;

  @override
  String toString() {
    return 'TodoWatcherState(todos: $todos, hideCompleted: $hideCompleted, isLoading: $isLoading, initial: $initial, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoWatcherState &&
            const DeepCollectionEquality().equals(other.todos, todos) &&
            const DeepCollectionEquality()
                .equals(other.hideCompleted, hideCompleted) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.initial, initial) &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(todos),
      const DeepCollectionEquality().hash(hideCompleted),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(initial),
      const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$$_TodoWatcherStateCopyWith<_$_TodoWatcherState> get copyWith =>
      __$$_TodoWatcherStateCopyWithImpl<_$_TodoWatcherState>(this, _$identity);
}

abstract class _TodoWatcherState implements TodoWatcherState {
  factory _TodoWatcherState(
      {required final Iterable<Todo> todos,
      required final bool hideCompleted,
      final bool isLoading,
      final bool initial,
      final Exception? exception}) = _$_TodoWatcherState;

  @override
  Iterable<Todo> get todos;
  @override
  bool get hideCompleted;
  @override
  bool get isLoading;
  @override
  bool get initial;
  @override
  Exception? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_TodoWatcherStateCopyWith<_$_TodoWatcherState> get copyWith =>
      throw _privateConstructorUsedError;
}
