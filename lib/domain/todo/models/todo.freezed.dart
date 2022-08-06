// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return _Todo.fromJson(json);
}

/// @nodoc
mixin _$Todo {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get text => throw _privateConstructorUsedError;
  @HiveField(2)
  TodoImportance get importance => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get done => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'changed_at')
  @TimestampConverter()
  DateTime get changedAt => throw _privateConstructorUsedError;
  @HiveField(6)
  @TimestampOrNullConverter()
  DateTime? get deadline => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: 'last_updated_by')
  String? get lastUpdatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoCopyWith<Todo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
      _$TodoCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          String text,
      @HiveField(2)
          TodoImportance importance,
      @HiveField(3)
          bool done,
      @HiveField(4)
      @JsonKey(name: 'created_at')
      @TimestampConverter()
          DateTime createdAt,
      @HiveField(5)
      @JsonKey(name: 'changed_at')
      @TimestampConverter()
          DateTime changedAt,
      @HiveField(6)
      @TimestampOrNullConverter()
          DateTime? deadline,
      @HiveField(7)
      @JsonKey(name: 'last_updated_by')
          String? lastUpdatedBy});
}

/// @nodoc
class _$TodoCopyWithImpl<$Res> implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  final Todo _value;
  // ignore: unused_field
  final $Res Function(Todo) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? importance = freezed,
    Object? done = freezed,
    Object? createdAt = freezed,
    Object? changedAt = freezed,
    Object? deadline = freezed,
    Object? lastUpdatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      importance: importance == freezed
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as TodoImportance,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      changedAt: changedAt == freezed
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdatedBy: lastUpdatedBy == freezed
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$$_TodoCopyWith(_$_Todo value, $Res Function(_$_Todo) then) =
      __$$_TodoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          String text,
      @HiveField(2)
          TodoImportance importance,
      @HiveField(3)
          bool done,
      @HiveField(4)
      @JsonKey(name: 'created_at')
      @TimestampConverter()
          DateTime createdAt,
      @HiveField(5)
      @JsonKey(name: 'changed_at')
      @TimestampConverter()
          DateTime changedAt,
      @HiveField(6)
      @TimestampOrNullConverter()
          DateTime? deadline,
      @HiveField(7)
      @JsonKey(name: 'last_updated_by')
          String? lastUpdatedBy});
}

/// @nodoc
class __$$_TodoCopyWithImpl<$Res> extends _$TodoCopyWithImpl<$Res>
    implements _$$_TodoCopyWith<$Res> {
  __$$_TodoCopyWithImpl(_$_Todo _value, $Res Function(_$_Todo) _then)
      : super(_value, (v) => _then(v as _$_Todo));

  @override
  _$_Todo get _value => super._value as _$_Todo;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? importance = freezed,
    Object? done = freezed,
    Object? createdAt = freezed,
    Object? changedAt = freezed,
    Object? deadline = freezed,
    Object? lastUpdatedBy = freezed,
  }) {
    return _then(_$_Todo(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      importance: importance == freezed
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as TodoImportance,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      changedAt: changedAt == freezed
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdatedBy: lastUpdatedBy == freezed
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Todo extends _Todo {
  const _$_Todo(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
          required this.text,
      @HiveField(2)
          required this.importance,
      @HiveField(3)
          required this.done,
      @HiveField(4)
      @JsonKey(name: 'created_at')
      @TimestampConverter()
          required this.createdAt,
      @HiveField(5)
      @JsonKey(name: 'changed_at')
      @TimestampConverter()
          required this.changedAt,
      @HiveField(6)
      @TimestampOrNullConverter()
          this.deadline,
      @HiveField(7)
      @JsonKey(name: 'last_updated_by')
          this.lastUpdatedBy})
      : super._();

  factory _$_Todo.fromJson(Map<String, dynamic> json) => _$$_TodoFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String text;
  @override
  @HiveField(2)
  final TodoImportance importance;
  @override
  @HiveField(3)
  final bool done;
  @override
  @HiveField(4)
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @HiveField(5)
  @JsonKey(name: 'changed_at')
  @TimestampConverter()
  final DateTime changedAt;
  @override
  @HiveField(6)
  @TimestampOrNullConverter()
  final DateTime? deadline;
  @override
  @HiveField(7)
  @JsonKey(name: 'last_updated_by')
  final String? lastUpdatedBy;

  @override
  String toString() {
    return 'Todo(id: $id, text: $text, importance: $importance, done: $done, createdAt: $createdAt, changedAt: $changedAt, deadline: $deadline, lastUpdatedBy: $lastUpdatedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Todo &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality()
                .equals(other.importance, importance) &&
            const DeepCollectionEquality().equals(other.done, done) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.changedAt, changedAt) &&
            const DeepCollectionEquality().equals(other.deadline, deadline) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdatedBy, lastUpdatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(importance),
      const DeepCollectionEquality().hash(done),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(changedAt),
      const DeepCollectionEquality().hash(deadline),
      const DeepCollectionEquality().hash(lastUpdatedBy));

  @JsonKey(ignore: true)
  @override
  _$$_TodoCopyWith<_$_Todo> get copyWith =>
      __$$_TodoCopyWithImpl<_$_Todo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoToJson(
      this,
    );
  }
}

abstract class _Todo extends Todo {
  const factory _Todo(
      {@HiveField(0)
          required final String id,
      @HiveField(1)
          required final String text,
      @HiveField(2)
          required final TodoImportance importance,
      @HiveField(3)
          required final bool done,
      @HiveField(4)
      @JsonKey(name: 'created_at')
      @TimestampConverter()
          required final DateTime createdAt,
      @HiveField(5)
      @JsonKey(name: 'changed_at')
      @TimestampConverter()
          required final DateTime changedAt,
      @HiveField(6)
      @TimestampOrNullConverter()
          final DateTime? deadline,
      @HiveField(7)
      @JsonKey(name: 'last_updated_by')
          final String? lastUpdatedBy}) = _$_Todo;
  const _Todo._() : super._();

  factory _Todo.fromJson(Map<String, dynamic> json) = _$_Todo.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get text;
  @override
  @HiveField(2)
  TodoImportance get importance;
  @override
  @HiveField(3)
  bool get done;
  @override
  @HiveField(4)
  @JsonKey(name: 'created_at')
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @HiveField(5)
  @JsonKey(name: 'changed_at')
  @TimestampConverter()
  DateTime get changedAt;
  @override
  @HiveField(6)
  @TimestampOrNullConverter()
  DateTime? get deadline;
  @override
  @HiveField(7)
  @JsonKey(name: 'last_updated_by')
  String? get lastUpdatedBy;
  @override
  @JsonKey(ignore: true)
  _$$_TodoCopyWith<_$_Todo> get copyWith => throw _privateConstructorUsedError;
}
