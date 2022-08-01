// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_todo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddTodoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) textChanged,
    required TResult Function() addTodoPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function()? addTodoPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function()? addTodoPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_AddTodoPressed value) addTodoPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_AddTodoPressed value)? addTodoPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_AddTodoPressed value)? addTodoPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTodoEventCopyWith<$Res> {
  factory $AddTodoEventCopyWith(
          AddTodoEvent value, $Res Function(AddTodoEvent) then) =
      _$AddTodoEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AddTodoEventCopyWithImpl<$Res> implements $AddTodoEventCopyWith<$Res> {
  _$AddTodoEventCopyWithImpl(this._value, this._then);

  final AddTodoEvent _value;
  // ignore: unused_field
  final $Res Function(AddTodoEvent) _then;
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
    extends _$AddTodoEventCopyWithImpl<$Res>
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
    return 'AddTodoEvent.textChanged(text: $text)';
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
    required TResult Function() addTodoPressed,
  }) {
    return textChanged(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function()? addTodoPressed,
  }) {
    return textChanged?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function()? addTodoPressed,
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
    required TResult Function(_AddTodoPressed value) addTodoPressed,
  }) {
    return textChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_AddTodoPressed value)? addTodoPressed,
  }) {
    return textChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_AddTodoPressed value)? addTodoPressed,
    required TResult orElse(),
  }) {
    if (textChanged != null) {
      return textChanged(this);
    }
    return orElse();
  }
}

abstract class _TextChanged implements AddTodoEvent {
  const factory _TextChanged(final String text) = _$_TextChanged;

  String get text;
  @JsonKey(ignore: true)
  _$$_TextChangedCopyWith<_$_TextChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddTodoPressedCopyWith<$Res> {
  factory _$$_AddTodoPressedCopyWith(
          _$_AddTodoPressed value, $Res Function(_$_AddTodoPressed) then) =
      __$$_AddTodoPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AddTodoPressedCopyWithImpl<$Res>
    extends _$AddTodoEventCopyWithImpl<$Res>
    implements _$$_AddTodoPressedCopyWith<$Res> {
  __$$_AddTodoPressedCopyWithImpl(
      _$_AddTodoPressed _value, $Res Function(_$_AddTodoPressed) _then)
      : super(_value, (v) => _then(v as _$_AddTodoPressed));

  @override
  _$_AddTodoPressed get _value => super._value as _$_AddTodoPressed;
}

/// @nodoc

class _$_AddTodoPressed implements _AddTodoPressed {
  const _$_AddTodoPressed();

  @override
  String toString() {
    return 'AddTodoEvent.addTodoPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AddTodoPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) textChanged,
    required TResult Function() addTodoPressed,
  }) {
    return addTodoPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function()? addTodoPressed,
  }) {
    return addTodoPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function()? addTodoPressed,
    required TResult orElse(),
  }) {
    if (addTodoPressed != null) {
      return addTodoPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TextChanged value) textChanged,
    required TResult Function(_AddTodoPressed value) addTodoPressed,
  }) {
    return addTodoPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_AddTodoPressed value)? addTodoPressed,
  }) {
    return addTodoPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TextChanged value)? textChanged,
    TResult Function(_AddTodoPressed value)? addTodoPressed,
    required TResult orElse(),
  }) {
    if (addTodoPressed != null) {
      return addTodoPressed(this);
    }
    return orElse();
  }
}

abstract class _AddTodoPressed implements AddTodoEvent {
  const factory _AddTodoPressed() = _$_AddTodoPressed;
}

/// @nodoc
mixin _$AddTodoState {
  String get text => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get canCreate => throw _privateConstructorUsedError;
  Exception? get exception => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddTodoStateCopyWith<AddTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTodoStateCopyWith<$Res> {
  factory $AddTodoStateCopyWith(
          AddTodoState value, $Res Function(AddTodoState) then) =
      _$AddTodoStateCopyWithImpl<$Res>;
  $Res call(
      {String text, bool isLoading, bool canCreate, Exception? exception});
}

/// @nodoc
class _$AddTodoStateCopyWithImpl<$Res> implements $AddTodoStateCopyWith<$Res> {
  _$AddTodoStateCopyWithImpl(this._value, this._then);

  final AddTodoState _value;
  // ignore: unused_field
  final $Res Function(AddTodoState) _then;

  @override
  $Res call({
    Object? text = freezed,
    Object? isLoading = freezed,
    Object? canCreate = freezed,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      canCreate: canCreate == freezed
          ? _value.canCreate
          : canCreate // ignore: cast_nullable_to_non_nullable
              as bool,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc
abstract class _$$_AddTodoTileStateCopyWith<$Res>
    implements $AddTodoStateCopyWith<$Res> {
  factory _$$_AddTodoTileStateCopyWith(
          _$_AddTodoTileState value, $Res Function(_$_AddTodoTileState) then) =
      __$$_AddTodoTileStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String text, bool isLoading, bool canCreate, Exception? exception});
}

/// @nodoc
class __$$_AddTodoTileStateCopyWithImpl<$Res>
    extends _$AddTodoStateCopyWithImpl<$Res>
    implements _$$_AddTodoTileStateCopyWith<$Res> {
  __$$_AddTodoTileStateCopyWithImpl(
      _$_AddTodoTileState _value, $Res Function(_$_AddTodoTileState) _then)
      : super(_value, (v) => _then(v as _$_AddTodoTileState));

  @override
  _$_AddTodoTileState get _value => super._value as _$_AddTodoTileState;

  @override
  $Res call({
    Object? text = freezed,
    Object? isLoading = freezed,
    Object? canCreate = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_AddTodoTileState(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      canCreate: canCreate == freezed
          ? _value.canCreate
          : canCreate // ignore: cast_nullable_to_non_nullable
              as bool,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$_AddTodoTileState implements _AddTodoTileState {
  const _$_AddTodoTileState(
      {required this.text,
      required this.isLoading,
      required this.canCreate,
      this.exception});

  @override
  final String text;
  @override
  final bool isLoading;
  @override
  final bool canCreate;
  @override
  final Exception? exception;

  @override
  String toString() {
    return 'AddTodoState(text: $text, isLoading: $isLoading, canCreate: $canCreate, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddTodoTileState &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.canCreate, canCreate) &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(canCreate),
      const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$$_AddTodoTileStateCopyWith<_$_AddTodoTileState> get copyWith =>
      __$$_AddTodoTileStateCopyWithImpl<_$_AddTodoTileState>(this, _$identity);
}

abstract class _AddTodoTileState implements AddTodoState {
  const factory _AddTodoTileState(
      {required final String text,
      required final bool isLoading,
      required final bool canCreate,
      final Exception? exception}) = _$_AddTodoTileState;

  @override
  String get text;
  @override
  bool get isLoading;
  @override
  bool get canCreate;
  @override
  Exception? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_AddTodoTileStateCopyWith<_$_AddTodoTileState> get copyWith =>
      throw _privateConstructorUsedError;
}
