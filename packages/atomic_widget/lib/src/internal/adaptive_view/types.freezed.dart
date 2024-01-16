// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Breakpoint {
  LayoutType get layoutType => throw _privateConstructorUsedError;
  WindowType get windowType => throw _privateConstructorUsedError;
}

/// @nodoc

class _$BreakpointImpl extends _Breakpoint {
  const _$BreakpointImpl({required this.layoutType, required this.windowType})
      : super._();

  @override
  final LayoutType layoutType;
  @override
  final WindowType windowType;

  @override
  String toString() {
    return 'Breakpoint(layoutType: $layoutType, windowType: $windowType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreakpointImpl &&
            (identical(other.layoutType, layoutType) ||
                other.layoutType == layoutType) &&
            (identical(other.windowType, windowType) ||
                other.windowType == windowType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, layoutType, windowType);
}

abstract class _Breakpoint extends Breakpoint {
  const factory _Breakpoint(
      {required final LayoutType layoutType,
      required final WindowType windowType}) = _$BreakpointImpl;
  const _Breakpoint._() : super._();

  @override
  LayoutType get layoutType;
  @override
  WindowType get windowType;
}
