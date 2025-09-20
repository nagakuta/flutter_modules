// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Breakpoint {
  LayoutType get layoutType;
  WindowType get windowType;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Breakpoint &&
            (identical(other.layoutType, layoutType) ||
                other.layoutType == layoutType) &&
            (identical(other.windowType, windowType) ||
                other.windowType == windowType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, layoutType, windowType);

  @override
  String toString() {
    return 'Breakpoint(layoutType: $layoutType, windowType: $windowType)';
  }
}

/// @nodoc

class _Breakpoint extends Breakpoint {
  const _Breakpoint({required this.layoutType, required this.windowType})
    : super._();

  @override
  final LayoutType layoutType;
  @override
  final WindowType windowType;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Breakpoint &&
            (identical(other.layoutType, layoutType) ||
                other.layoutType == layoutType) &&
            (identical(other.windowType, windowType) ||
                other.windowType == windowType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, layoutType, windowType);

  @override
  String toString() {
    return 'Breakpoint(layoutType: $layoutType, windowType: $windowType)';
  }
}
