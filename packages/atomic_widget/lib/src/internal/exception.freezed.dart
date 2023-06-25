// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AtomicWidgetException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() shouldUseTemplateWidget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? shouldUseTemplateWidget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? shouldUseTemplateWidget,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShouldUseTemplateWidgetException value)
        shouldUseTemplateWidget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShouldUseTemplateWidgetException value)?
        shouldUseTemplateWidget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShouldUseTemplateWidgetException value)?
        shouldUseTemplateWidget,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AtomicWidgetExceptionCopyWith<$Res> {
  factory $AtomicWidgetExceptionCopyWith(AtomicWidgetException value,
          $Res Function(AtomicWidgetException) then) =
      _$AtomicWidgetExceptionCopyWithImpl<$Res, AtomicWidgetException>;
}

/// @nodoc
class _$AtomicWidgetExceptionCopyWithImpl<$Res,
        $Val extends AtomicWidgetException>
    implements $AtomicWidgetExceptionCopyWith<$Res> {
  _$AtomicWidgetExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ShouldUseTemplateWidgetExceptionCopyWith<$Res> {
  factory _$$ShouldUseTemplateWidgetExceptionCopyWith(
          _$ShouldUseTemplateWidgetException value,
          $Res Function(_$ShouldUseTemplateWidgetException) then) =
      __$$ShouldUseTemplateWidgetExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShouldUseTemplateWidgetExceptionCopyWithImpl<$Res>
    extends _$AtomicWidgetExceptionCopyWithImpl<$Res,
        _$ShouldUseTemplateWidgetException>
    implements _$$ShouldUseTemplateWidgetExceptionCopyWith<$Res> {
  __$$ShouldUseTemplateWidgetExceptionCopyWithImpl(
      _$ShouldUseTemplateWidgetException _value,
      $Res Function(_$ShouldUseTemplateWidgetException) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShouldUseTemplateWidgetException
    extends ShouldUseTemplateWidgetException {
  const _$ShouldUseTemplateWidgetException() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShouldUseTemplateWidgetException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() shouldUseTemplateWidget,
  }) {
    return shouldUseTemplateWidget();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? shouldUseTemplateWidget,
  }) {
    return shouldUseTemplateWidget?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? shouldUseTemplateWidget,
    required TResult orElse(),
  }) {
    if (shouldUseTemplateWidget != null) {
      return shouldUseTemplateWidget();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShouldUseTemplateWidgetException value)
        shouldUseTemplateWidget,
  }) {
    return shouldUseTemplateWidget(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShouldUseTemplateWidgetException value)?
        shouldUseTemplateWidget,
  }) {
    return shouldUseTemplateWidget?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShouldUseTemplateWidgetException value)?
        shouldUseTemplateWidget,
    required TResult orElse(),
  }) {
    if (shouldUseTemplateWidget != null) {
      return shouldUseTemplateWidget(this);
    }
    return orElse();
  }
}

abstract class ShouldUseTemplateWidgetException extends AtomicWidgetException {
  const factory ShouldUseTemplateWidgetException() =
      _$ShouldUseTemplateWidgetException;
  const ShouldUseTemplateWidgetException._() : super._();
}
