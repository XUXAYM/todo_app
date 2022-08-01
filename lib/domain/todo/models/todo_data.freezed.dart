// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoData _$TodoDataFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'collection':
      return CollectionTodoData.fromJson(json);
    case 'single':
      return SingleTodoData.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'TodoData',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$TodoData {
  int get revision => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonSerializable(explicitToJson: true)
            @JsonKey(name: 'list')
                Iterable<Todo> todos,
            int revision)
        collection,
    required TResult Function(@JsonKey(name: 'element') Todo todo, int revision)
        single,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @JsonSerializable(explicitToJson: true)
            @JsonKey(name: 'list')
                Iterable<Todo> todos,
            int revision)?
        collection,
    TResult Function(@JsonKey(name: 'element') Todo todo, int revision)? single,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonSerializable(explicitToJson: true)
            @JsonKey(name: 'list')
                Iterable<Todo> todos,
            int revision)?
        collection,
    TResult Function(@JsonKey(name: 'element') Todo todo, int revision)? single,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CollectionTodoData value) collection,
    required TResult Function(SingleTodoData value) single,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CollectionTodoData value)? collection,
    TResult Function(SingleTodoData value)? single,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CollectionTodoData value)? collection,
    TResult Function(SingleTodoData value)? single,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoDataCopyWith<TodoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoDataCopyWith<$Res> {
  factory $TodoDataCopyWith(TodoData value, $Res Function(TodoData) then) =
      _$TodoDataCopyWithImpl<$Res>;
  $Res call({int revision});
}

/// @nodoc
class _$TodoDataCopyWithImpl<$Res> implements $TodoDataCopyWith<$Res> {
  _$TodoDataCopyWithImpl(this._value, this._then);

  final TodoData _value;
  // ignore: unused_field
  final $Res Function(TodoData) _then;

  @override
  $Res call({
    Object? revision = freezed,
  }) {
    return _then(_value.copyWith(
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$CollectionTodoDataCopyWith<$Res>
    implements $TodoDataCopyWith<$Res> {
  factory _$$CollectionTodoDataCopyWith(_$CollectionTodoData value,
          $Res Function(_$CollectionTodoData) then) =
      __$$CollectionTodoDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonSerializable(explicitToJson: true)
      @JsonKey(name: 'list')
          Iterable<Todo> todos,
      int revision});
}

/// @nodoc
class __$$CollectionTodoDataCopyWithImpl<$Res>
    extends _$TodoDataCopyWithImpl<$Res>
    implements _$$CollectionTodoDataCopyWith<$Res> {
  __$$CollectionTodoDataCopyWithImpl(
      _$CollectionTodoData _value, $Res Function(_$CollectionTodoData) _then)
      : super(_value, (v) => _then(v as _$CollectionTodoData));

  @override
  _$CollectionTodoData get _value => super._value as _$CollectionTodoData;

  @override
  $Res call({
    Object? todos = freezed,
    Object? revision = freezed,
  }) {
    return _then(_$CollectionTodoData(
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as Iterable<Todo>,
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionTodoData implements CollectionTodoData {
  const _$CollectionTodoData(
      {@JsonSerializable(explicitToJson: true)
      @JsonKey(name: 'list')
          required this.todos,
      required this.revision,
      final String? $type})
      : $type = $type ?? 'collection';

  factory _$CollectionTodoData.fromJson(Map<String, dynamic> json) =>
      _$$CollectionTodoDataFromJson(json);

  @override
  @JsonSerializable(explicitToJson: true)
  @JsonKey(name: 'list')
  final Iterable<Todo> todos;
  @override
  final int revision;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TodoData.collection(todos: $todos, revision: $revision)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionTodoData &&
            const DeepCollectionEquality().equals(other.todos, todos) &&
            const DeepCollectionEquality().equals(other.revision, revision));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(todos),
      const DeepCollectionEquality().hash(revision));

  @JsonKey(ignore: true)
  @override
  _$$CollectionTodoDataCopyWith<_$CollectionTodoData> get copyWith =>
      __$$CollectionTodoDataCopyWithImpl<_$CollectionTodoData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonSerializable(explicitToJson: true)
            @JsonKey(name: 'list')
                Iterable<Todo> todos,
            int revision)
        collection,
    required TResult Function(@JsonKey(name: 'element') Todo todo, int revision)
        single,
  }) {
    return collection(todos, revision);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @JsonSerializable(explicitToJson: true)
            @JsonKey(name: 'list')
                Iterable<Todo> todos,
            int revision)?
        collection,
    TResult Function(@JsonKey(name: 'element') Todo todo, int revision)? single,
  }) {
    return collection?.call(todos, revision);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonSerializable(explicitToJson: true)
            @JsonKey(name: 'list')
                Iterable<Todo> todos,
            int revision)?
        collection,
    TResult Function(@JsonKey(name: 'element') Todo todo, int revision)? single,
    required TResult orElse(),
  }) {
    if (collection != null) {
      return collection(todos, revision);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CollectionTodoData value) collection,
    required TResult Function(SingleTodoData value) single,
  }) {
    return collection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CollectionTodoData value)? collection,
    TResult Function(SingleTodoData value)? single,
  }) {
    return collection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CollectionTodoData value)? collection,
    TResult Function(SingleTodoData value)? single,
    required TResult orElse(),
  }) {
    if (collection != null) {
      return collection(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionTodoDataToJson(
      this,
    );
  }
}

abstract class CollectionTodoData implements TodoData {
  const factory CollectionTodoData(
      {@JsonSerializable(explicitToJson: true)
      @JsonKey(name: 'list')
          required final Iterable<Todo> todos,
      required final int revision}) = _$CollectionTodoData;

  factory CollectionTodoData.fromJson(Map<String, dynamic> json) =
      _$CollectionTodoData.fromJson;

  @JsonSerializable(explicitToJson: true)
  @JsonKey(name: 'list')
  Iterable<Todo> get todos;
  @override
  int get revision;
  @override
  @JsonKey(ignore: true)
  _$$CollectionTodoDataCopyWith<_$CollectionTodoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SingleTodoDataCopyWith<$Res>
    implements $TodoDataCopyWith<$Res> {
  factory _$$SingleTodoDataCopyWith(
          _$SingleTodoData value, $Res Function(_$SingleTodoData) then) =
      __$$SingleTodoDataCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'element') Todo todo, int revision});

  $TodoCopyWith<$Res> get todo;
}

/// @nodoc
class __$$SingleTodoDataCopyWithImpl<$Res> extends _$TodoDataCopyWithImpl<$Res>
    implements _$$SingleTodoDataCopyWith<$Res> {
  __$$SingleTodoDataCopyWithImpl(
      _$SingleTodoData _value, $Res Function(_$SingleTodoData) _then)
      : super(_value, (v) => _then(v as _$SingleTodoData));

  @override
  _$SingleTodoData get _value => super._value as _$SingleTodoData;

  @override
  $Res call({
    Object? todo = freezed,
    Object? revision = freezed,
  }) {
    return _then(_$SingleTodoData(
      todo: todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo,
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
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
@JsonSerializable()
class _$SingleTodoData implements SingleTodoData {
  const _$SingleTodoData(
      {@JsonKey(name: 'element') required this.todo,
      required this.revision,
      final String? $type})
      : $type = $type ?? 'single';

  factory _$SingleTodoData.fromJson(Map<String, dynamic> json) =>
      _$$SingleTodoDataFromJson(json);

  @override
  @JsonKey(name: 'element')
  final Todo todo;
  @override
  final int revision;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TodoData.single(todo: $todo, revision: $revision)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleTodoData &&
            const DeepCollectionEquality().equals(other.todo, todo) &&
            const DeepCollectionEquality().equals(other.revision, revision));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(todo),
      const DeepCollectionEquality().hash(revision));

  @JsonKey(ignore: true)
  @override
  _$$SingleTodoDataCopyWith<_$SingleTodoData> get copyWith =>
      __$$SingleTodoDataCopyWithImpl<_$SingleTodoData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonSerializable(explicitToJson: true)
            @JsonKey(name: 'list')
                Iterable<Todo> todos,
            int revision)
        collection,
    required TResult Function(@JsonKey(name: 'element') Todo todo, int revision)
        single,
  }) {
    return single(todo, revision);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @JsonSerializable(explicitToJson: true)
            @JsonKey(name: 'list')
                Iterable<Todo> todos,
            int revision)?
        collection,
    TResult Function(@JsonKey(name: 'element') Todo todo, int revision)? single,
  }) {
    return single?.call(todo, revision);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonSerializable(explicitToJson: true)
            @JsonKey(name: 'list')
                Iterable<Todo> todos,
            int revision)?
        collection,
    TResult Function(@JsonKey(name: 'element') Todo todo, int revision)? single,
    required TResult orElse(),
  }) {
    if (single != null) {
      return single(todo, revision);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CollectionTodoData value) collection,
    required TResult Function(SingleTodoData value) single,
  }) {
    return single(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CollectionTodoData value)? collection,
    TResult Function(SingleTodoData value)? single,
  }) {
    return single?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CollectionTodoData value)? collection,
    TResult Function(SingleTodoData value)? single,
    required TResult orElse(),
  }) {
    if (single != null) {
      return single(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleTodoDataToJson(
      this,
    );
  }
}

abstract class SingleTodoData implements TodoData {
  const factory SingleTodoData(
      {@JsonKey(name: 'element') required final Todo todo,
      required final int revision}) = _$SingleTodoData;

  factory SingleTodoData.fromJson(Map<String, dynamic> json) =
      _$SingleTodoData.fromJson;

  @JsonKey(name: 'element')
  Todo get todo;
  @override
  int get revision;
  @override
  @JsonKey(ignore: true)
  _$$SingleTodoDataCopyWith<_$SingleTodoData> get copyWith =>
      throw _privateConstructorUsedError;
}
