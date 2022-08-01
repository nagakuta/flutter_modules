// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LogOption {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object error, StackTrace? stackTrace) shout,
    required TResult Function(Object error, StackTrace? stackTrace) severe,
    required TResult Function(Exception exception, StackTrace? stackTrace)
        warning,
    required TResult Function(String message) info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Object error, StackTrace? stackTrace)? shout,
    TResult Function(Object error, StackTrace? stackTrace)? severe,
    TResult Function(Exception exception, StackTrace? stackTrace)? warning,
    TResult Function(String message)? info,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShoutLogOption value) shout,
    required TResult Function(SevereLogOption value) severe,
    required TResult Function(WarningLogOption value) warning,
    required TResult Function(InfoLogOption value) info,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShoutLogOption value)? shout,
    TResult Function(SevereLogOption value)? severe,
    TResult Function(WarningLogOption value)? warning,
    TResult Function(InfoLogOption value)? info,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogOptionCopyWith<$Res> {
  factory $LogOptionCopyWith(LogOption value, $Res Function(LogOption) then) =
      _$LogOptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$LogOptionCopyWithImpl<$Res> implements $LogOptionCopyWith<$Res> {
  _$LogOptionCopyWithImpl(this._value, this._then);

  final LogOption _value;
  // ignore: unused_field
  final $Res Function(LogOption) _then;
}

/// @nodoc
abstract class _$$ShoutLogOptionCopyWith<$Res> {
  factory _$$ShoutLogOptionCopyWith(
          _$ShoutLogOption value, $Res Function(_$ShoutLogOption) then) =
      __$$ShoutLogOptionCopyWithImpl<$Res>;
  $Res call({Object error, StackTrace? stackTrace});
}

/// @nodoc
class __$$ShoutLogOptionCopyWithImpl<$Res> extends _$LogOptionCopyWithImpl<$Res>
    implements _$$ShoutLogOptionCopyWith<$Res> {
  __$$ShoutLogOptionCopyWithImpl(
      _$ShoutLogOption _value, $Res Function(_$ShoutLogOption) _then)
      : super(_value, (v) => _then(v as _$ShoutLogOption));

  @override
  _$ShoutLogOption get _value => super._value as _$ShoutLogOption;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$ShoutLogOption(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$ShoutLogOption extends ShoutLogOption {
  const _$ShoutLogOption({required this.error, this.stackTrace}) : super._();

  @override
  final Object error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'LogOption.shout(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoutLogOption &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(stackTrace));

  @JsonKey(ignore: true)
  @override
  _$$ShoutLogOptionCopyWith<_$ShoutLogOption> get copyWith =>
      __$$ShoutLogOptionCopyWithImpl<_$ShoutLogOption>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object error, StackTrace? stackTrace) shout,
    required TResult Function(Object error, StackTrace? stackTrace) severe,
    required TResult Function(Exception exception, StackTrace? stackTrace)
        warning,
    required TResult Function(String message) info,
  }) {
    return shout(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Object error, StackTrace? stackTrace)? shout,
    TResult Function(Object error, StackTrace? stackTrace)? severe,
    TResult Function(Exception exception, StackTrace? stackTrace)? warning,
    TResult Function(String message)? info,
  }) {
    return shout?.call(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShoutLogOption value) shout,
    required TResult Function(SevereLogOption value) severe,
    required TResult Function(WarningLogOption value) warning,
    required TResult Function(InfoLogOption value) info,
  }) {
    return shout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShoutLogOption value)? shout,
    TResult Function(SevereLogOption value)? severe,
    TResult Function(WarningLogOption value)? warning,
    TResult Function(InfoLogOption value)? info,
  }) {
    return shout?.call(this);
  }
}

abstract class ShoutLogOption extends LogOption {
  const factory ShoutLogOption(
      {required final Object error,
      final StackTrace? stackTrace}) = _$ShoutLogOption;
  const ShoutLogOption._() : super._();

  Object get error;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  _$$ShoutLogOptionCopyWith<_$ShoutLogOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SevereLogOptionCopyWith<$Res> {
  factory _$$SevereLogOptionCopyWith(
          _$SevereLogOption value, $Res Function(_$SevereLogOption) then) =
      __$$SevereLogOptionCopyWithImpl<$Res>;
  $Res call({Object error, StackTrace? stackTrace});
}

/// @nodoc
class __$$SevereLogOptionCopyWithImpl<$Res>
    extends _$LogOptionCopyWithImpl<$Res>
    implements _$$SevereLogOptionCopyWith<$Res> {
  __$$SevereLogOptionCopyWithImpl(
      _$SevereLogOption _value, $Res Function(_$SevereLogOption) _then)
      : super(_value, (v) => _then(v as _$SevereLogOption));

  @override
  _$SevereLogOption get _value => super._value as _$SevereLogOption;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$SevereLogOption(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$SevereLogOption extends SevereLogOption {
  const _$SevereLogOption({required this.error, this.stackTrace}) : super._();

  @override
  final Object error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'LogOption.severe(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SevereLogOption &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(stackTrace));

  @JsonKey(ignore: true)
  @override
  _$$SevereLogOptionCopyWith<_$SevereLogOption> get copyWith =>
      __$$SevereLogOptionCopyWithImpl<_$SevereLogOption>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object error, StackTrace? stackTrace) shout,
    required TResult Function(Object error, StackTrace? stackTrace) severe,
    required TResult Function(Exception exception, StackTrace? stackTrace)
        warning,
    required TResult Function(String message) info,
  }) {
    return severe(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Object error, StackTrace? stackTrace)? shout,
    TResult Function(Object error, StackTrace? stackTrace)? severe,
    TResult Function(Exception exception, StackTrace? stackTrace)? warning,
    TResult Function(String message)? info,
  }) {
    return severe?.call(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShoutLogOption value) shout,
    required TResult Function(SevereLogOption value) severe,
    required TResult Function(WarningLogOption value) warning,
    required TResult Function(InfoLogOption value) info,
  }) {
    return severe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShoutLogOption value)? shout,
    TResult Function(SevereLogOption value)? severe,
    TResult Function(WarningLogOption value)? warning,
    TResult Function(InfoLogOption value)? info,
  }) {
    return severe?.call(this);
  }
}

abstract class SevereLogOption extends LogOption {
  const factory SevereLogOption(
      {required final Object error,
      final StackTrace? stackTrace}) = _$SevereLogOption;
  const SevereLogOption._() : super._();

  Object get error;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  _$$SevereLogOptionCopyWith<_$SevereLogOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WarningLogOptionCopyWith<$Res> {
  factory _$$WarningLogOptionCopyWith(
          _$WarningLogOption value, $Res Function(_$WarningLogOption) then) =
      __$$WarningLogOptionCopyWithImpl<$Res>;
  $Res call({Exception exception, StackTrace? stackTrace});
}

/// @nodoc
class __$$WarningLogOptionCopyWithImpl<$Res>
    extends _$LogOptionCopyWithImpl<$Res>
    implements _$$WarningLogOptionCopyWith<$Res> {
  __$$WarningLogOptionCopyWithImpl(
      _$WarningLogOption _value, $Res Function(_$WarningLogOption) _then)
      : super(_value, (v) => _then(v as _$WarningLogOption));

  @override
  _$WarningLogOption get _value => super._value as _$WarningLogOption;

  @override
  $Res call({
    Object? exception = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$WarningLogOption(
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$WarningLogOption extends WarningLogOption {
  const _$WarningLogOption({required this.exception, this.stackTrace})
      : super._();

  @override
  final Exception exception;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'LogOption.warning(exception: $exception, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WarningLogOption &&
            const DeepCollectionEquality().equals(other.exception, exception) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(exception),
      const DeepCollectionEquality().hash(stackTrace));

  @JsonKey(ignore: true)
  @override
  _$$WarningLogOptionCopyWith<_$WarningLogOption> get copyWith =>
      __$$WarningLogOptionCopyWithImpl<_$WarningLogOption>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object error, StackTrace? stackTrace) shout,
    required TResult Function(Object error, StackTrace? stackTrace) severe,
    required TResult Function(Exception exception, StackTrace? stackTrace)
        warning,
    required TResult Function(String message) info,
  }) {
    return warning(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Object error, StackTrace? stackTrace)? shout,
    TResult Function(Object error, StackTrace? stackTrace)? severe,
    TResult Function(Exception exception, StackTrace? stackTrace)? warning,
    TResult Function(String message)? info,
  }) {
    return warning?.call(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShoutLogOption value) shout,
    required TResult Function(SevereLogOption value) severe,
    required TResult Function(WarningLogOption value) warning,
    required TResult Function(InfoLogOption value) info,
  }) {
    return warning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShoutLogOption value)? shout,
    TResult Function(SevereLogOption value)? severe,
    TResult Function(WarningLogOption value)? warning,
    TResult Function(InfoLogOption value)? info,
  }) {
    return warning?.call(this);
  }
}

abstract class WarningLogOption extends LogOption {
  const factory WarningLogOption(
      {required final Exception exception,
      final StackTrace? stackTrace}) = _$WarningLogOption;
  const WarningLogOption._() : super._();

  Exception get exception;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  _$$WarningLogOptionCopyWith<_$WarningLogOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InfoLogOptionCopyWith<$Res> {
  factory _$$InfoLogOptionCopyWith(
          _$InfoLogOption value, $Res Function(_$InfoLogOption) then) =
      __$$InfoLogOptionCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$InfoLogOptionCopyWithImpl<$Res> extends _$LogOptionCopyWithImpl<$Res>
    implements _$$InfoLogOptionCopyWith<$Res> {
  __$$InfoLogOptionCopyWithImpl(
      _$InfoLogOption _value, $Res Function(_$InfoLogOption) _then)
      : super(_value, (v) => _then(v as _$InfoLogOption));

  @override
  _$InfoLogOption get _value => super._value as _$InfoLogOption;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$InfoLogOption(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InfoLogOption extends InfoLogOption {
  const _$InfoLogOption({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'LogOption.info(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoLogOption &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$InfoLogOptionCopyWith<_$InfoLogOption> get copyWith =>
      __$$InfoLogOptionCopyWithImpl<_$InfoLogOption>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object error, StackTrace? stackTrace) shout,
    required TResult Function(Object error, StackTrace? stackTrace) severe,
    required TResult Function(Exception exception, StackTrace? stackTrace)
        warning,
    required TResult Function(String message) info,
  }) {
    return info(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Object error, StackTrace? stackTrace)? shout,
    TResult Function(Object error, StackTrace? stackTrace)? severe,
    TResult Function(Exception exception, StackTrace? stackTrace)? warning,
    TResult Function(String message)? info,
  }) {
    return info?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShoutLogOption value) shout,
    required TResult Function(SevereLogOption value) severe,
    required TResult Function(WarningLogOption value) warning,
    required TResult Function(InfoLogOption value) info,
  }) {
    return info(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShoutLogOption value)? shout,
    TResult Function(SevereLogOption value)? severe,
    TResult Function(WarningLogOption value)? warning,
    TResult Function(InfoLogOption value)? info,
  }) {
    return info?.call(this);
  }
}

abstract class InfoLogOption extends LogOption {
  const factory InfoLogOption({required final String message}) =
      _$InfoLogOption;
  const InfoLogOption._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$InfoLogOptionCopyWith<_$InfoLogOption> get copyWith =>
      throw _privateConstructorUsedError;
}
