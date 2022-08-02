// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) textChanged,
    required TResult Function(TodoImportance importance) importanceChanged,
    required TResult Function(DateTime? deadline) deadlineChanged,
    required TResult Function() savePressed,
    required TResult Function() deletePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function(TodoImportance importance)? importanceChanged,
    TResult Function(DateTime? deadline)? deadlineChanged,
    TResult Function()? savePressed,
    TResult Function()? deletePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function(TodoImportance importance)? importanceChanged,
    TResult Function(DateTime? deadline)? deadlineChanged,
    TResult Function()? savePressed,
    TResult Function()? deletePressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_ImportanceChanged value) importanceChanged,
    required TResult Function(_DeadlineChanged value) deadlineChanged,
    required TResult Function(_SavePressed value) savePressed,
    required TResult Function(_DeletePressed value) deletePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImportanceChanged value)? importanceChanged,
    TResult Function(_DeadlineChanged value)? deadlineChanged,
    TResult Function(_SavePressed value)? savePressed,
    TResult Function(_DeletePressed value)? deletePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImportanceChanged value)? importanceChanged,
    TResult Function(_DeadlineChanged value)? deadlineChanged,
    TResult Function(_SavePressed value)? savePressed,
    TResult Function(_DeletePressed value)? deletePressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoFormEventCopyWith<$Res> {
  factory $TodoFormEventCopyWith(
          TodoFormEvent value, $Res Function(TodoFormEvent) then) =
      _$TodoFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TodoFormEventCopyWithImpl<$Res>
    implements $TodoFormEventCopyWith<$Res> {
  _$TodoFormEventCopyWithImpl(this._value, this._then);

  final TodoFormEvent _value;
  // ignore: unused_field
  final $Res Function(TodoFormEvent) _then;
}

/// @nodoc
abstract class _$$_TextChangedCopyWith<$Res> {
  factory _$$_TextChangedCopyWith(
          _$_TextChanged value, $Res Function(_$_TextChanged) then) =
      __$$_TextChangedCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class __$$_TextChangedCopyWithImpl<$Res>
    extends _$TodoFormEventCopyWithImpl<$Res>
    implements _$$_TextChangedCopyWith<$Res> {
  __$$_TextChangedCopyWithImpl(
      _$_TextChanged _value, $Res Function(_$_TextChanged) _then)
      : super(_value, (v) => _then(v as _$_TextChanged));

  @override
  _$_TextChanged get _value => super._value as _$_TextChanged;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_TextChanged(
      text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TextChanged implements _TextChanged {
  const _$_TextChanged(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'TodoFormEvent.textChanged(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TextChanged &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$$_TextChangedCopyWith<_$_TextChanged> get copyWith =>
      __$$_TextChangedCopyWithImpl<_$_TextChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) textChanged,
    required TResult Function(TodoImportance importance) importanceChanged,
    required TResult Function(DateTime? deadline) deadlineChanged,
    required TResult Function() savePressed,
    required TResult Function() deletePressed,
  }) {
    return textChanged(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function(TodoImportance importance)? importanceChanged,
    TResult Function(DateTime? deadline)? deadlineChanged,
    TResult Function()? savePressed,
    TResult Function()? deletePressed,
  }) {
    return textChanged?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function(TodoImportance importance)? importanceChanged,
    TResult Function(DateTime? deadline)? deadlineChanged,
    TResult Function()? savePressed,
    TResult Function()? deletePressed,
    required TResult orElse(),
  }) {
    if (textChanged != null) {
      return textChanged(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_ImportanceChanged value) importanceChanged,
    required TResult Function(_DeadlineChanged value) deadlineChanged,
    required TResult Function(_SavePressed value) savePressed,
    required TResult Function(_DeletePressed value) deletePressed,
  }) {
    return textChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImportanceChanged value)? importanceChanged,
    TResult Function(_DeadlineChanged value)? deadlineChanged,
    TResult Function(_SavePressed value)? savePressed,
    TResult Function(_DeletePressed value)? deletePressed,
  }) {
    return textChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImportanceChanged value)? importanceChanged,
    TResult Function(_DeadlineChanged value)? deadlineChanged,
    TResult Function(_SavePressed value)? savePressed,
    TResult Function(_DeletePressed value)? deletePressed,
    required TResult orElse(),
  }) {
    if (textChanged != null) {
      return textChanged(this);
    }
    return orElse();
  }
}

abstract class _TextChanged implements TodoFormEvent {
  const factory _TextChanged(final String text) = _$_TextChanged;

  String get text;
  @JsonKey(ignore: true)
  _$$_TextChangedCopyWith<_$_TextChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ImportanceChangedCopyWith<$Res> {
  factory _$$_ImportanceChangedCopyWith(_$_ImportanceChanged value,
          $Res Function(_$_ImportanceChanged) then) =
      __$$_ImportanceChangedCopyWithImpl<$Res>;
  $Res call({TodoImportance importance});
}

/// @nodoc
class __$$_ImportanceChangedCopyWithImpl<$Res>
    extends _$TodoFormEventCopyWithImpl<$Res>
    implements _$$_ImportanceChangedCopyWith<$Res> {
  __$$_ImportanceChangedCopyWithImpl(
      _$_ImportanceChanged _value, $Res Function(_$_ImportanceChanged) _then)
      : super(_value, (v) => _then(v as _$_ImportanceChanged));

  @override
  _$_ImportanceChanged get _value => super._value as _$_ImportanceChanged;

  @override
  $Res call({
    Object? importance = freezed,
  }) {
    return _then(_$_ImportanceChanged(
      importance == freezed
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as TodoImportance,
    ));
  }
}

/// @nodoc

class _$_ImportanceChanged implements _ImportanceChanged {
  const _$_ImportanceChanged(this.importance);

  @override
  final TodoImportance importance;

  @override
  String toString() {
    return 'TodoFormEvent.importanceChanged(importance: $importance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImportanceChanged &&
            const DeepCollectionEquality()
                .equals(other.importance, importance));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(importance));

  @JsonKey(ignore: true)
  @override
  _$$_ImportanceChangedCopyWith<_$_ImportanceChanged> get copyWith =>
      __$$_ImportanceChangedCopyWithImpl<_$_ImportanceChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) textChanged,
    required TResult Function(TodoImportance importance) importanceChanged,
    required TResult Function(DateTime? deadline) deadlineChanged,
    required TResult Function() savePressed,
    required TResult Function() deletePressed,
  }) {
    return importanceChanged(importance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function(TodoImportance importance)? importanceChanged,
    TResult Function(DateTime? deadline)? deadlineChanged,
    TResult Function()? savePressed,
    TResult Function()? deletePressed,
  }) {
    return importanceChanged?.call(importance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function(TodoImportance importance)? importanceChanged,
    TResult Function(DateTime? deadline)? deadlineChanged,
    TResult Function()? savePressed,
    TResult Function()? deletePressed,
    required TResult orElse(),
  }) {
    if (importanceChanged != null) {
      return importanceChanged(importance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_ImportanceChanged value) importanceChanged,
    required TResult Function(_DeadlineChanged value) deadlineChanged,
    required TResult Function(_SavePressed value) savePressed,
    required TResult Function(_DeletePressed value) deletePressed,
  }) {
    return importanceChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImportanceChanged value)? importanceChanged,
    TResult Function(_DeadlineChanged value)? deadlineChanged,
    TResult Function(_SavePressed value)? savePressed,
    TResult Function(_DeletePressed value)? deletePressed,
  }) {
    return importanceChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImportanceChanged value)? importanceChanged,
    TResult Function(_DeadlineChanged value)? deadlineChanged,
    TResult Function(_SavePressed value)? savePressed,
    TResult Function(_DeletePressed value)? deletePressed,
    required TResult orElse(),
  }) {
    if (importanceChanged != null) {
      return importanceChanged(this);
    }
    return orElse();
  }
}

abstract class _ImportanceChanged implements TodoFormEvent {
  const factory _ImportanceChanged(final TodoImportance importance) =
      _$_ImportanceChanged;

  TodoImportance get importance;
  @JsonKey(ignore: true)
  _$$_ImportanceChangedCopyWith<_$_ImportanceChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeadlineChangedCopyWith<$Res> {
  factory _$$_DeadlineChangedCopyWith(
          _$_DeadlineChanged value, $Res Function(_$_DeadlineChanged) then) =
      __$$_DeadlineChangedCopyWithImpl<$Res>;
  $Res call({DateTime? deadline});
}

/// @nodoc
class __$$_DeadlineChangedCopyWithImpl<$Res>
    extends _$TodoFormEventCopyWithImpl<$Res>
    implements _$$_DeadlineChangedCopyWith<$Res> {
  __$$_DeadlineChangedCopyWithImpl(
      _$_DeadlineChanged _value, $Res Function(_$_DeadlineChanged) _then)
      : super(_value, (v) => _then(v as _$_DeadlineChanged));

  @override
  _$_DeadlineChanged get _value => super._value as _$_DeadlineChanged;

  @override
  $Res call({
    Object? deadline = freezed,
  }) {
    return _then(_$_DeadlineChanged(
      deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_DeadlineChanged implements _DeadlineChanged {
  const _$_DeadlineChanged(this.deadline);

  @override
  final DateTime? deadline;

  @override
  String toString() {
    return 'TodoFormEvent.deadlineChanged(deadline: $deadline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeadlineChanged &&
            const DeepCollectionEquality().equals(other.deadline, deadline));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(deadline));

  @JsonKey(ignore: true)
  @override
  _$$_DeadlineChangedCopyWith<_$_DeadlineChanged> get copyWith =>
      __$$_DeadlineChangedCopyWithImpl<_$_DeadlineChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) textChanged,
    required TResult Function(TodoImportance importance) importanceChanged,
    required TResult Function(DateTime? deadline) deadlineChanged,
    required TResult Function() savePressed,
    required TResult Function() deletePressed,
  }) {
    return deadlineChanged(deadline);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function(TodoImportance importance)? importanceChanged,
    TResult Function(DateTime? deadline)? deadlineChanged,
    TResult Function()? savePressed,
    TResult Function()? deletePressed,
  }) {
    return deadlineChanged?.call(deadline);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function(TodoImportance importance)? importanceChanged,
    TResult Function(DateTime? deadline)? deadlineChanged,
    TResult Function()? savePressed,
    TResult Function()? deletePressed,
    required TResult orElse(),
  }) {
    if (deadlineChanged != null) {
      return deadlineChanged(deadline);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_ImportanceChanged value) importanceChanged,
    required TResult Function(_DeadlineChanged value) deadlineChanged,
    required TResult Function(_SavePressed value) savePressed,
    required TResult Function(_DeletePressed value) deletePressed,
  }) {
    return deadlineChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImportanceChanged value)? importanceChanged,
    TResult Function(_DeadlineChanged value)? deadlineChanged,
    TResult Function(_SavePressed value)? savePressed,
    TResult Function(_DeletePressed value)? deletePressed,
  }) {
    return deadlineChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImportanceChanged value)? importanceChanged,
    TResult Function(_DeadlineChanged value)? deadlineChanged,
    TResult Function(_SavePressed value)? savePressed,
    TResult Function(_DeletePressed value)? deletePressed,
    required TResult orElse(),
  }) {
    if (deadlineChanged != null) {
      return deadlineChanged(this);
    }
    return orElse();
  }
}

abstract class _DeadlineChanged implements TodoFormEvent {
  const factory _DeadlineChanged(final DateTime? deadline) = _$_DeadlineChanged;

  DateTime? get deadline;
  @JsonKey(ignore: true)
  _$$_DeadlineChangedCopyWith<_$_DeadlineChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SavePressedCopyWith<$Res> {
  factory _$$_SavePressedCopyWith(
          _$_SavePressed value, $Res Function(_$_SavePressed) then) =
      __$$_SavePressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SavePressedCopyWithImpl<$Res>
    extends _$TodoFormEventCopyWithImpl<$Res>
    implements _$$_SavePressedCopyWith<$Res> {
  __$$_SavePressedCopyWithImpl(
      _$_SavePressed _value, $Res Function(_$_SavePressed) _then)
      : super(_value, (v) => _then(v as _$_SavePressed));

  @override
  _$_SavePressed get _value => super._value as _$_SavePressed;
}

/// @nodoc

class _$_SavePressed implements _SavePressed {
  const _$_SavePressed();

  @override
  String toString() {
    return 'TodoFormEvent.savePressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SavePressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) textChanged,
    required TResult Function(TodoImportance importance) importanceChanged,
    required TResult Function(DateTime? deadline) deadlineChanged,
    required TResult Function() savePressed,
    required TResult Function() deletePressed,
  }) {
    return savePressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function(TodoImportance importance)? importanceChanged,
    TResult Function(DateTime? deadline)? deadlineChanged,
    TResult Function()? savePressed,
    TResult Function()? deletePressed,
  }) {
    return savePressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function(TodoImportance importance)? importanceChanged,
    TResult Function(DateTime? deadline)? deadlineChanged,
    TResult Function()? savePressed,
    TResult Function()? deletePressed,
    required TResult orElse(),
  }) {
    if (savePressed != null) {
      return savePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_ImportanceChanged value) importanceChanged,
    required TResult Function(_DeadlineChanged value) deadlineChanged,
    required TResult Function(_SavePressed value) savePressed,
    required TResult Function(_DeletePressed value) deletePressed,
  }) {
    return savePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImportanceChanged value)? importanceChanged,
    TResult Function(_DeadlineChanged value)? deadlineChanged,
    TResult Function(_SavePressed value)? savePressed,
    TResult Function(_DeletePressed value)? deletePressed,
  }) {
    return savePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImportanceChanged value)? importanceChanged,
    TResult Function(_DeadlineChanged value)? deadlineChanged,
    TResult Function(_SavePressed value)? savePressed,
    TResult Function(_DeletePressed value)? deletePressed,
    required TResult orElse(),
  }) {
    if (savePressed != null) {
      return savePressed(this);
    }
    return orElse();
  }
}

abstract class _SavePressed implements TodoFormEvent {
  const factory _SavePressed() = _$_SavePressed;
}

/// @nodoc
abstract class _$$_DeletePressedCopyWith<$Res> {
  factory _$$_DeletePressedCopyWith(
          _$_DeletePressed value, $Res Function(_$_DeletePressed) then) =
      __$$_DeletePressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeletePressedCopyWithImpl<$Res>
    extends _$TodoFormEventCopyWithImpl<$Res>
    implements _$$_DeletePressedCopyWith<$Res> {
  __$$_DeletePressedCopyWithImpl(
      _$_DeletePressed _value, $Res Function(_$_DeletePressed) _then)
      : super(_value, (v) => _then(v as _$_DeletePressed));

  @override
  _$_DeletePressed get _value => super._value as _$_DeletePressed;
}

/// @nodoc

class _$_DeletePressed implements _DeletePressed {
  const _$_DeletePressed();

  @override
  String toString() {
    return 'TodoFormEvent.deletePressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DeletePressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) textChanged,
    required TResult Function(TodoImportance importance) importanceChanged,
    required TResult Function(DateTime? deadline) deadlineChanged,
    required TResult Function() savePressed,
    required TResult Function() deletePressed,
  }) {
    return deletePressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function(TodoImportance importance)? importanceChanged,
    TResult Function(DateTime? deadline)? deadlineChanged,
    TResult Function()? savePressed,
    TResult Function()? deletePressed,
  }) {
    return deletePressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function(TodoImportance importance)? importanceChanged,
    TResult Function(DateTime? deadline)? deadlineChanged,
    TResult Function()? savePressed,
    TResult Function()? deletePressed,
    required TResult orElse(),
  }) {
    if (deletePressed != null) {
      return deletePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_ImportanceChanged value) importanceChanged,
    required TResult Function(_DeadlineChanged value) deadlineChanged,
    required TResult Function(_SavePressed value) savePressed,
    required TResult Function(_DeletePressed value) deletePressed,
  }) {
    return deletePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImportanceChanged value)? importanceChanged,
    TResult Function(_DeadlineChanged value)? deadlineChanged,
    TResult Function(_SavePressed value)? savePressed,
    TResult Function(_DeletePressed value)? deletePressed,
  }) {
    return deletePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_ImportanceChanged value)? importanceChanged,
    TResult Function(_DeadlineChanged value)? deadlineChanged,
    TResult Function(_SavePressed value)? savePressed,
    TResult Function(_DeletePressed value)? deletePressed,
    required TResult orElse(),
  }) {
    if (deletePressed != null) {
      return deletePressed(this);
    }
    return orElse();
  }
}

abstract class _DeletePressed implements TodoFormEvent {
  const factory _DeletePressed() = _$_DeletePressed;
}

/// @nodoc
mixin _$TodoFormState {
  Todo get todo => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoFormStateCopyWith<TodoFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoFormStateCopyWith<$Res> {
  factory $TodoFormStateCopyWith(
          TodoFormState value, $Res Function(TodoFormState) then) =
      _$TodoFormStateCopyWithImpl<$Res>;
  $Res call({Todo todo, bool isEditing});

  $TodoCopyWith<$Res> get todo;
}

/// @nodoc
class _$TodoFormStateCopyWithImpl<$Res>
    implements $TodoFormStateCopyWith<$Res> {
  _$TodoFormStateCopyWithImpl(this._value, this._then);

  final TodoFormState _value;
  // ignore: unused_field
  final $Res Function(TodoFormState) _then;

  @override
  $Res call({
    Object? todo = freezed,
    Object? isEditing = freezed,
  }) {
    return _then(_value.copyWith(
      todo: todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$_TodoFormStateCopyWith<$Res>
    implements $TodoFormStateCopyWith<$Res> {
  factory _$$_TodoFormStateCopyWith(
          _$_TodoFormState value, $Res Function(_$_TodoFormState) then) =
      __$$_TodoFormStateCopyWithImpl<$Res>;
  @override
  $Res call({Todo todo, bool isEditing});

  @override
  $TodoCopyWith<$Res> get todo;
}

/// @nodoc
class __$$_TodoFormStateCopyWithImpl<$Res>
    extends _$TodoFormStateCopyWithImpl<$Res>
    implements _$$_TodoFormStateCopyWith<$Res> {
  __$$_TodoFormStateCopyWithImpl(
      _$_TodoFormState _value, $Res Function(_$_TodoFormState) _then)
      : super(_value, (v) => _then(v as _$_TodoFormState));

  @override
  _$_TodoFormState get _value => super._value as _$_TodoFormState;

  @override
  $Res call({
    Object? todo = freezed,
    Object? isEditing = freezed,
  }) {
    return _then(_$_TodoFormState(
      todo: todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TodoFormState implements _TodoFormState {
  const _$_TodoFormState({required this.todo, required this.isEditing});

  @override
  final Todo todo;
  @override
  final bool isEditing;

  @override
  String toString() {
    return 'TodoFormState(todo: $todo, isEditing: $isEditing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoFormState &&
            const DeepCollectionEquality().equals(other.todo, todo) &&
            const DeepCollectionEquality().equals(other.isEditing, isEditing));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(todo),
      const DeepCollectionEquality().hash(isEditing));

  @JsonKey(ignore: true)
  @override
  _$$_TodoFormStateCopyWith<_$_TodoFormState> get copyWith =>
      __$$_TodoFormStateCopyWithImpl<_$_TodoFormState>(this, _$identity);
}

abstract class _TodoFormState implements TodoFormState {
  const factory _TodoFormState(
      {required final Todo todo,
      required final bool isEditing}) = _$_TodoFormState;

  @override
  Todo get todo;
  @override
  bool get isEditing;
  @override
  @JsonKey(ignore: true)
  _$$_TodoFormStateCopyWith<_$_TodoFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
