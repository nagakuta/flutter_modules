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
mixin _$GalleryServiceException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fileNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fileNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fileNotFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GalleryFileNotFoundException value) fileNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GalleryFileNotFoundException value)? fileNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GalleryFileNotFoundException value)? fileNotFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryServiceExceptionCopyWith<$Res> {
  factory $GalleryServiceExceptionCopyWith(GalleryServiceException value,
          $Res Function(GalleryServiceException) then) =
      _$GalleryServiceExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$GalleryServiceExceptionCopyWithImpl<$Res>
    implements $GalleryServiceExceptionCopyWith<$Res> {
  _$GalleryServiceExceptionCopyWithImpl(this._value, this._then);

  final GalleryServiceException _value;
  // ignore: unused_field
  final $Res Function(GalleryServiceException) _then;
}

/// @nodoc
abstract class _$$GalleryFileNotFoundExceptionCopyWith<$Res> {
  factory _$$GalleryFileNotFoundExceptionCopyWith(
          _$GalleryFileNotFoundException value,
          $Res Function(_$GalleryFileNotFoundException) then) =
      __$$GalleryFileNotFoundExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GalleryFileNotFoundExceptionCopyWithImpl<$Res>
    extends _$GalleryServiceExceptionCopyWithImpl<$Res>
    implements _$$GalleryFileNotFoundExceptionCopyWith<$Res> {
  __$$GalleryFileNotFoundExceptionCopyWithImpl(
      _$GalleryFileNotFoundException _value,
      $Res Function(_$GalleryFileNotFoundException) _then)
      : super(_value, (v) => _then(v as _$GalleryFileNotFoundException));

  @override
  _$GalleryFileNotFoundException get _value =>
      super._value as _$GalleryFileNotFoundException;
}

/// @nodoc

class _$GalleryFileNotFoundException extends GalleryFileNotFoundException {
  const _$GalleryFileNotFoundException() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryFileNotFoundException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fileNotFound,
  }) {
    return fileNotFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fileNotFound,
  }) {
    return fileNotFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fileNotFound,
    required TResult orElse(),
  }) {
    if (fileNotFound != null) {
      return fileNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GalleryFileNotFoundException value) fileNotFound,
  }) {
    return fileNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GalleryFileNotFoundException value)? fileNotFound,
  }) {
    return fileNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GalleryFileNotFoundException value)? fileNotFound,
    required TResult orElse(),
  }) {
    if (fileNotFound != null) {
      return fileNotFound(this);
    }
    return orElse();
  }
}

abstract class GalleryFileNotFoundException extends GalleryServiceException {
  const factory GalleryFileNotFoundException() = _$GalleryFileNotFoundException;
  const GalleryFileNotFoundException._() : super._();
}
