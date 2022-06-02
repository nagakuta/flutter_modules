// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PermissionServiceException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cannotOpenAppSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cannotOpenAppSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cannotOpenAppSettings,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PermissionCannotOpenAppSettingsException value)
        cannotOpenAppSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PermissionCannotOpenAppSettingsException value)?
        cannotOpenAppSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionCannotOpenAppSettingsException value)?
        cannotOpenAppSettings,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionServiceExceptionCopyWith<$Res> {
  factory $PermissionServiceExceptionCopyWith(PermissionServiceException value,
          $Res Function(PermissionServiceException) then) =
      _$PermissionServiceExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$PermissionServiceExceptionCopyWithImpl<$Res>
    implements $PermissionServiceExceptionCopyWith<$Res> {
  _$PermissionServiceExceptionCopyWithImpl(this._value, this._then);

  final PermissionServiceException _value;
  // ignore: unused_field
  final $Res Function(PermissionServiceException) _then;
}

/// @nodoc
abstract class _$$PermissionCannotOpenAppSettingsExceptionCopyWith<$Res> {
  factory _$$PermissionCannotOpenAppSettingsExceptionCopyWith(
          _$PermissionCannotOpenAppSettingsException value,
          $Res Function(_$PermissionCannotOpenAppSettingsException) then) =
      __$$PermissionCannotOpenAppSettingsExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PermissionCannotOpenAppSettingsExceptionCopyWithImpl<$Res>
    extends _$PermissionServiceExceptionCopyWithImpl<$Res>
    implements _$$PermissionCannotOpenAppSettingsExceptionCopyWith<$Res> {
  __$$PermissionCannotOpenAppSettingsExceptionCopyWithImpl(
      _$PermissionCannotOpenAppSettingsException _value,
      $Res Function(_$PermissionCannotOpenAppSettingsException) _then)
      : super(_value,
            (v) => _then(v as _$PermissionCannotOpenAppSettingsException));

  @override
  _$PermissionCannotOpenAppSettingsException get _value =>
      super._value as _$PermissionCannotOpenAppSettingsException;
}

/// @nodoc

class _$PermissionCannotOpenAppSettingsException
    extends PermissionCannotOpenAppSettingsException {
  const _$PermissionCannotOpenAppSettingsException() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionCannotOpenAppSettingsException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cannotOpenAppSettings,
  }) {
    return cannotOpenAppSettings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cannotOpenAppSettings,
  }) {
    return cannotOpenAppSettings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cannotOpenAppSettings,
    required TResult orElse(),
  }) {
    if (cannotOpenAppSettings != null) {
      return cannotOpenAppSettings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PermissionCannotOpenAppSettingsException value)
        cannotOpenAppSettings,
  }) {
    return cannotOpenAppSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PermissionCannotOpenAppSettingsException value)?
        cannotOpenAppSettings,
  }) {
    return cannotOpenAppSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionCannotOpenAppSettingsException value)?
        cannotOpenAppSettings,
    required TResult orElse(),
  }) {
    if (cannotOpenAppSettings != null) {
      return cannotOpenAppSettings(this);
    }
    return orElse();
  }
}

abstract class PermissionCannotOpenAppSettingsException
    extends PermissionServiceException {
  const factory PermissionCannotOpenAppSettingsException() =
      _$PermissionCannotOpenAppSettingsException;
  const PermissionCannotOpenAppSettingsException._() : super._();
}
