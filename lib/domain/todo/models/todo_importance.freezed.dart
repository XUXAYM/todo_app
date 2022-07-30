// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_importance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoImportance _$TodoImportanceFromJson(Map<String, dynamic> json) {
  switch (json['importance']) {
    case 'low':
      return _Low.fromJson(json);
    case 'basic':
      return _Normal.fromJson(json);
    case 'important':
      return _High.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'importance', 'TodoImportance',
          'Invalid union type "${json['importance']}"!');
  }
}

/// @nodoc
mixin _$TodoImportance {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() low,
    required TResult Function() normal,
    required TResult Function() high,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? low,
    TResult Function()? normal,
    TResult Function()? high,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? low,
    TResult Function()? normal,
    TResult Function()? high,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Low value) low,
    required TResult Function(_Normal value) normal,
    required TResult Function(_High value) high,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Low value)? low,
    TResult Function(_Normal value)? normal,
    TResult Function(_High value)? high,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Low value)? low,
    TResult Function(_Normal value)? normal,
    TResult Function(_High value)? high,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoImportanceCopyWith<$Res> {
  factory $TodoImportanceCopyWith(
          TodoImportance value, $Res Function(TodoImportance) then) =
      _$TodoImportanceCopyWithImpl<$Res>;
}

/// @nodoc
class _$TodoImportanceCopyWithImpl<$Res>
    implements $TodoImportanceCopyWith<$Res> {
  _$TodoImportanceCopyWithImpl(this._value, this._then);

  final TodoImportance _value;
  // ignore: unused_field
  final $Res Function(TodoImportance) _then;
}

/// @nodoc
abstract class _$$_LowCopyWith<$Res> {
  factory _$$_LowCopyWith(_$_Low value, $Res Function(_$_Low) then) =
      __$$_LowCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LowCopyWithImpl<$Res> extends _$TodoImportanceCopyWithImpl<$Res>
    implements _$$_LowCopyWith<$Res> {
  __$$_LowCopyWithImpl(_$_Low _value, $Res Function(_$_Low) _then)
      : super(_value, (v) => _then(v as _$_Low));

  @override
  _$_Low get _value => super._value as _$_Low;
}

/// @nodoc
@JsonSerializable()
class _$_Low implements _Low {
  const _$_Low({final String? $type}) : $type = $type ?? 'low';

  factory _$_Low.fromJson(Map<String, dynamic> json) => _$$_LowFromJson(json);

  @JsonKey(name: 'importance')
  final String $type;

  @override
  String toString() {
    return 'TodoImportance.low()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Low);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() low,
    required TResult Function() normal,
    required TResult Function() high,
  }) {
    return low();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? low,
    TResult Function()? normal,
    TResult Function()? high,
  }) {
    return low?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? low,
    TResult Function()? normal,
    TResult Function()? high,
    required TResult orElse(),
  }) {
    if (low != null) {
      return low();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Low value) low,
    required TResult Function(_Normal value) normal,
    required TResult Function(_High value) high,
  }) {
    return low(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Low value)? low,
    TResult Function(_Normal value)? normal,
    TResult Function(_High value)? high,
  }) {
    return low?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Low value)? low,
    TResult Function(_Normal value)? normal,
    TResult Function(_High value)? high,
    required TResult orElse(),
  }) {
    if (low != null) {
      return low(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_LowToJson(
      this,
    );
  }
}

abstract class _Low implements TodoImportance {
  const factory _Low() = _$_Low;

  factory _Low.fromJson(Map<String, dynamic> json) = _$_Low.fromJson;
}

/// @nodoc
abstract class _$$_NormalCopyWith<$Res> {
  factory _$$_NormalCopyWith(_$_Normal value, $Res Function(_$_Normal) then) =
      __$$_NormalCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NormalCopyWithImpl<$Res> extends _$TodoImportanceCopyWithImpl<$Res>
    implements _$$_NormalCopyWith<$Res> {
  __$$_NormalCopyWithImpl(_$_Normal _value, $Res Function(_$_Normal) _then)
      : super(_value, (v) => _then(v as _$_Normal));

  @override
  _$_Normal get _value => super._value as _$_Normal;
}

/// @nodoc
@JsonSerializable()
class _$_Normal implements _Normal {
  const _$_Normal({final String? $type}) : $type = $type ?? 'basic';

  factory _$_Normal.fromJson(Map<String, dynamic> json) =>
      _$$_NormalFromJson(json);

  @JsonKey(name: 'importance')
  final String $type;

  @override
  String toString() {
    return 'TodoImportance.normal()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Normal);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() low,
    required TResult Function() normal,
    required TResult Function() high,
  }) {
    return normal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? low,
    TResult Function()? normal,
    TResult Function()? high,
  }) {
    return normal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? low,
    TResult Function()? normal,
    TResult Function()? high,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Low value) low,
    required TResult Function(_Normal value) normal,
    required TResult Function(_High value) high,
  }) {
    return normal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Low value)? low,
    TResult Function(_Normal value)? normal,
    TResult Function(_High value)? high,
  }) {
    return normal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Low value)? low,
    TResult Function(_Normal value)? normal,
    TResult Function(_High value)? high,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_NormalToJson(
      this,
    );
  }
}

abstract class _Normal implements TodoImportance {
  const factory _Normal() = _$_Normal;

  factory _Normal.fromJson(Map<String, dynamic> json) = _$_Normal.fromJson;
}

/// @nodoc
abstract class _$$_HighCopyWith<$Res> {
  factory _$$_HighCopyWith(_$_High value, $Res Function(_$_High) then) =
      __$$_HighCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_HighCopyWithImpl<$Res> extends _$TodoImportanceCopyWithImpl<$Res>
    implements _$$_HighCopyWith<$Res> {
  __$$_HighCopyWithImpl(_$_High _value, $Res Function(_$_High) _then)
      : super(_value, (v) => _then(v as _$_High));

  @override
  _$_High get _value => super._value as _$_High;
}

/// @nodoc
@JsonSerializable()
class _$_High implements _High {
  const _$_High({final String? $type}) : $type = $type ?? 'important';

  factory _$_High.fromJson(Map<String, dynamic> json) => _$$_HighFromJson(json);

  @JsonKey(name: 'importance')
  final String $type;

  @override
  String toString() {
    return 'TodoImportance.high()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_High);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() low,
    required TResult Function() normal,
    required TResult Function() high,
  }) {
    return high();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? low,
    TResult Function()? normal,
    TResult Function()? high,
  }) {
    return high?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? low,
    TResult Function()? normal,
    TResult Function()? high,
    required TResult orElse(),
  }) {
    if (high != null) {
      return high();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Low value) low,
    required TResult Function(_Normal value) normal,
    required TResult Function(_High value) high,
  }) {
    return high(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Low value)? low,
    TResult Function(_Normal value)? normal,
    TResult Function(_High value)? high,
  }) {
    return high?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Low value)? low,
    TResult Function(_Normal value)? normal,
    TResult Function(_High value)? high,
    required TResult orElse(),
  }) {
    if (high != null) {
      return high(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_HighToJson(
      this,
    );
  }
}

abstract class _High implements TodoImportance {
  const factory _High() = _$_High;

  factory _High.fromJson(Map<String, dynamic> json) = _$_High.fromJson;
}
