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

  @JsonKey(ignore: true)
  $BreakpointCopyWith<Breakpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreakpointCopyWith<$Res> {
  factory $BreakpointCopyWith(
          Breakpoint value, $Res Function(Breakpoint) then) =
      _$BreakpointCopyWithImpl<$Res, Breakpoint>;
  @useResult
  $Res call({LayoutType layoutType, WindowType windowType});

  $LayoutTypeCopyWith<$Res> get layoutType;
  $WindowTypeCopyWith<$Res> get windowType;
}

/// @nodoc
class _$BreakpointCopyWithImpl<$Res, $Val extends Breakpoint>
    implements $BreakpointCopyWith<$Res> {
  _$BreakpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? layoutType = null,
    Object? windowType = null,
  }) {
    return _then(_value.copyWith(
      layoutType: null == layoutType
          ? _value.layoutType
          : layoutType // ignore: cast_nullable_to_non_nullable
              as LayoutType,
      windowType: null == windowType
          ? _value.windowType
          : windowType // ignore: cast_nullable_to_non_nullable
              as WindowType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LayoutTypeCopyWith<$Res> get layoutType {
    return $LayoutTypeCopyWith<$Res>(_value.layoutType, (value) {
      return _then(_value.copyWith(layoutType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WindowTypeCopyWith<$Res> get windowType {
    return $WindowTypeCopyWith<$Res>(_value.windowType, (value) {
      return _then(_value.copyWith(windowType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BreakpointImplCopyWith<$Res>
    implements $BreakpointCopyWith<$Res> {
  factory _$$BreakpointImplCopyWith(
          _$BreakpointImpl value, $Res Function(_$BreakpointImpl) then) =
      __$$BreakpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LayoutType layoutType, WindowType windowType});

  @override
  $LayoutTypeCopyWith<$Res> get layoutType;
  @override
  $WindowTypeCopyWith<$Res> get windowType;
}

/// @nodoc
class __$$BreakpointImplCopyWithImpl<$Res>
    extends _$BreakpointCopyWithImpl<$Res, _$BreakpointImpl>
    implements _$$BreakpointImplCopyWith<$Res> {
  __$$BreakpointImplCopyWithImpl(
      _$BreakpointImpl _value, $Res Function(_$BreakpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? layoutType = null,
    Object? windowType = null,
  }) {
    return _then(_$BreakpointImpl(
      layoutType: null == layoutType
          ? _value.layoutType
          : layoutType // ignore: cast_nullable_to_non_nullable
              as LayoutType,
      windowType: null == windowType
          ? _value.windowType
          : windowType // ignore: cast_nullable_to_non_nullable
              as WindowType,
    ));
  }
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BreakpointImplCopyWith<_$BreakpointImpl> get copyWith =>
      __$$BreakpointImplCopyWithImpl<_$BreakpointImpl>(this, _$identity);
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
  @override
  @JsonKey(ignore: true)
  _$$BreakpointImplCopyWith<_$BreakpointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LayoutType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() smallHandset,
    required TResult Function() mediumHandset,
    required TResult Function() largeHandset,
    required TResult Function() smallTablet,
    required TResult Function() largeTablet,
    required TResult Function() desktop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? smallHandset,
    TResult? Function()? mediumHandset,
    TResult? Function()? largeHandset,
    TResult? Function()? smallTablet,
    TResult? Function()? largeTablet,
    TResult? Function()? desktop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? smallHandset,
    TResult Function()? mediumHandset,
    TResult Function()? largeHandset,
    TResult Function()? smallTablet,
    TResult Function()? largeTablet,
    TResult Function()? desktop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SmallHandsetLayoutType value) smallHandset,
    required TResult Function(MediumHandsetLayoutType value) mediumHandset,
    required TResult Function(LargeHandsetLayoutType value) largeHandset,
    required TResult Function(SmallTabletLayoutType value) smallTablet,
    required TResult Function(LargeTabletLayoutType value) largeTablet,
    required TResult Function(DesktopLayoutType value) desktop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SmallHandsetLayoutType value)? smallHandset,
    TResult? Function(MediumHandsetLayoutType value)? mediumHandset,
    TResult? Function(LargeHandsetLayoutType value)? largeHandset,
    TResult? Function(SmallTabletLayoutType value)? smallTablet,
    TResult? Function(LargeTabletLayoutType value)? largeTablet,
    TResult? Function(DesktopLayoutType value)? desktop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SmallHandsetLayoutType value)? smallHandset,
    TResult Function(MediumHandsetLayoutType value)? mediumHandset,
    TResult Function(LargeHandsetLayoutType value)? largeHandset,
    TResult Function(SmallTabletLayoutType value)? smallTablet,
    TResult Function(LargeTabletLayoutType value)? largeTablet,
    TResult Function(DesktopLayoutType value)? desktop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LayoutTypeCopyWith<$Res> {
  factory $LayoutTypeCopyWith(
          LayoutType value, $Res Function(LayoutType) then) =
      _$LayoutTypeCopyWithImpl<$Res, LayoutType>;
}

/// @nodoc
class _$LayoutTypeCopyWithImpl<$Res, $Val extends LayoutType>
    implements $LayoutTypeCopyWith<$Res> {
  _$LayoutTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SmallHandsetLayoutTypeImplCopyWith<$Res> {
  factory _$$SmallHandsetLayoutTypeImplCopyWith(
          _$SmallHandsetLayoutTypeImpl value,
          $Res Function(_$SmallHandsetLayoutTypeImpl) then) =
      __$$SmallHandsetLayoutTypeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SmallHandsetLayoutTypeImplCopyWithImpl<$Res>
    extends _$LayoutTypeCopyWithImpl<$Res, _$SmallHandsetLayoutTypeImpl>
    implements _$$SmallHandsetLayoutTypeImplCopyWith<$Res> {
  __$$SmallHandsetLayoutTypeImplCopyWithImpl(
      _$SmallHandsetLayoutTypeImpl _value,
      $Res Function(_$SmallHandsetLayoutTypeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SmallHandsetLayoutTypeImpl extends SmallHandsetLayoutType {
  const _$SmallHandsetLayoutTypeImpl() : super._();

  @override
  String toString() {
    return 'LayoutType.smallHandset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmallHandsetLayoutTypeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() smallHandset,
    required TResult Function() mediumHandset,
    required TResult Function() largeHandset,
    required TResult Function() smallTablet,
    required TResult Function() largeTablet,
    required TResult Function() desktop,
  }) {
    return smallHandset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? smallHandset,
    TResult? Function()? mediumHandset,
    TResult? Function()? largeHandset,
    TResult? Function()? smallTablet,
    TResult? Function()? largeTablet,
    TResult? Function()? desktop,
  }) {
    return smallHandset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? smallHandset,
    TResult Function()? mediumHandset,
    TResult Function()? largeHandset,
    TResult Function()? smallTablet,
    TResult Function()? largeTablet,
    TResult Function()? desktop,
    required TResult orElse(),
  }) {
    if (smallHandset != null) {
      return smallHandset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SmallHandsetLayoutType value) smallHandset,
    required TResult Function(MediumHandsetLayoutType value) mediumHandset,
    required TResult Function(LargeHandsetLayoutType value) largeHandset,
    required TResult Function(SmallTabletLayoutType value) smallTablet,
    required TResult Function(LargeTabletLayoutType value) largeTablet,
    required TResult Function(DesktopLayoutType value) desktop,
  }) {
    return smallHandset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SmallHandsetLayoutType value)? smallHandset,
    TResult? Function(MediumHandsetLayoutType value)? mediumHandset,
    TResult? Function(LargeHandsetLayoutType value)? largeHandset,
    TResult? Function(SmallTabletLayoutType value)? smallTablet,
    TResult? Function(LargeTabletLayoutType value)? largeTablet,
    TResult? Function(DesktopLayoutType value)? desktop,
  }) {
    return smallHandset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SmallHandsetLayoutType value)? smallHandset,
    TResult Function(MediumHandsetLayoutType value)? mediumHandset,
    TResult Function(LargeHandsetLayoutType value)? largeHandset,
    TResult Function(SmallTabletLayoutType value)? smallTablet,
    TResult Function(LargeTabletLayoutType value)? largeTablet,
    TResult Function(DesktopLayoutType value)? desktop,
    required TResult orElse(),
  }) {
    if (smallHandset != null) {
      return smallHandset(this);
    }
    return orElse();
  }
}

abstract class SmallHandsetLayoutType extends LayoutType {
  const factory SmallHandsetLayoutType() = _$SmallHandsetLayoutTypeImpl;
  const SmallHandsetLayoutType._() : super._();
}

/// @nodoc
abstract class _$$MediumHandsetLayoutTypeImplCopyWith<$Res> {
  factory _$$MediumHandsetLayoutTypeImplCopyWith(
          _$MediumHandsetLayoutTypeImpl value,
          $Res Function(_$MediumHandsetLayoutTypeImpl) then) =
      __$$MediumHandsetLayoutTypeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MediumHandsetLayoutTypeImplCopyWithImpl<$Res>
    extends _$LayoutTypeCopyWithImpl<$Res, _$MediumHandsetLayoutTypeImpl>
    implements _$$MediumHandsetLayoutTypeImplCopyWith<$Res> {
  __$$MediumHandsetLayoutTypeImplCopyWithImpl(
      _$MediumHandsetLayoutTypeImpl _value,
      $Res Function(_$MediumHandsetLayoutTypeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MediumHandsetLayoutTypeImpl extends MediumHandsetLayoutType {
  const _$MediumHandsetLayoutTypeImpl() : super._();

  @override
  String toString() {
    return 'LayoutType.mediumHandset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediumHandsetLayoutTypeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() smallHandset,
    required TResult Function() mediumHandset,
    required TResult Function() largeHandset,
    required TResult Function() smallTablet,
    required TResult Function() largeTablet,
    required TResult Function() desktop,
  }) {
    return mediumHandset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? smallHandset,
    TResult? Function()? mediumHandset,
    TResult? Function()? largeHandset,
    TResult? Function()? smallTablet,
    TResult? Function()? largeTablet,
    TResult? Function()? desktop,
  }) {
    return mediumHandset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? smallHandset,
    TResult Function()? mediumHandset,
    TResult Function()? largeHandset,
    TResult Function()? smallTablet,
    TResult Function()? largeTablet,
    TResult Function()? desktop,
    required TResult orElse(),
  }) {
    if (mediumHandset != null) {
      return mediumHandset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SmallHandsetLayoutType value) smallHandset,
    required TResult Function(MediumHandsetLayoutType value) mediumHandset,
    required TResult Function(LargeHandsetLayoutType value) largeHandset,
    required TResult Function(SmallTabletLayoutType value) smallTablet,
    required TResult Function(LargeTabletLayoutType value) largeTablet,
    required TResult Function(DesktopLayoutType value) desktop,
  }) {
    return mediumHandset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SmallHandsetLayoutType value)? smallHandset,
    TResult? Function(MediumHandsetLayoutType value)? mediumHandset,
    TResult? Function(LargeHandsetLayoutType value)? largeHandset,
    TResult? Function(SmallTabletLayoutType value)? smallTablet,
    TResult? Function(LargeTabletLayoutType value)? largeTablet,
    TResult? Function(DesktopLayoutType value)? desktop,
  }) {
    return mediumHandset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SmallHandsetLayoutType value)? smallHandset,
    TResult Function(MediumHandsetLayoutType value)? mediumHandset,
    TResult Function(LargeHandsetLayoutType value)? largeHandset,
    TResult Function(SmallTabletLayoutType value)? smallTablet,
    TResult Function(LargeTabletLayoutType value)? largeTablet,
    TResult Function(DesktopLayoutType value)? desktop,
    required TResult orElse(),
  }) {
    if (mediumHandset != null) {
      return mediumHandset(this);
    }
    return orElse();
  }
}

abstract class MediumHandsetLayoutType extends LayoutType {
  const factory MediumHandsetLayoutType() = _$MediumHandsetLayoutTypeImpl;
  const MediumHandsetLayoutType._() : super._();
}

/// @nodoc
abstract class _$$LargeHandsetLayoutTypeImplCopyWith<$Res> {
  factory _$$LargeHandsetLayoutTypeImplCopyWith(
          _$LargeHandsetLayoutTypeImpl value,
          $Res Function(_$LargeHandsetLayoutTypeImpl) then) =
      __$$LargeHandsetLayoutTypeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LargeHandsetLayoutTypeImplCopyWithImpl<$Res>
    extends _$LayoutTypeCopyWithImpl<$Res, _$LargeHandsetLayoutTypeImpl>
    implements _$$LargeHandsetLayoutTypeImplCopyWith<$Res> {
  __$$LargeHandsetLayoutTypeImplCopyWithImpl(
      _$LargeHandsetLayoutTypeImpl _value,
      $Res Function(_$LargeHandsetLayoutTypeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LargeHandsetLayoutTypeImpl extends LargeHandsetLayoutType {
  const _$LargeHandsetLayoutTypeImpl() : super._();

  @override
  String toString() {
    return 'LayoutType.largeHandset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LargeHandsetLayoutTypeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() smallHandset,
    required TResult Function() mediumHandset,
    required TResult Function() largeHandset,
    required TResult Function() smallTablet,
    required TResult Function() largeTablet,
    required TResult Function() desktop,
  }) {
    return largeHandset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? smallHandset,
    TResult? Function()? mediumHandset,
    TResult? Function()? largeHandset,
    TResult? Function()? smallTablet,
    TResult? Function()? largeTablet,
    TResult? Function()? desktop,
  }) {
    return largeHandset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? smallHandset,
    TResult Function()? mediumHandset,
    TResult Function()? largeHandset,
    TResult Function()? smallTablet,
    TResult Function()? largeTablet,
    TResult Function()? desktop,
    required TResult orElse(),
  }) {
    if (largeHandset != null) {
      return largeHandset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SmallHandsetLayoutType value) smallHandset,
    required TResult Function(MediumHandsetLayoutType value) mediumHandset,
    required TResult Function(LargeHandsetLayoutType value) largeHandset,
    required TResult Function(SmallTabletLayoutType value) smallTablet,
    required TResult Function(LargeTabletLayoutType value) largeTablet,
    required TResult Function(DesktopLayoutType value) desktop,
  }) {
    return largeHandset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SmallHandsetLayoutType value)? smallHandset,
    TResult? Function(MediumHandsetLayoutType value)? mediumHandset,
    TResult? Function(LargeHandsetLayoutType value)? largeHandset,
    TResult? Function(SmallTabletLayoutType value)? smallTablet,
    TResult? Function(LargeTabletLayoutType value)? largeTablet,
    TResult? Function(DesktopLayoutType value)? desktop,
  }) {
    return largeHandset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SmallHandsetLayoutType value)? smallHandset,
    TResult Function(MediumHandsetLayoutType value)? mediumHandset,
    TResult Function(LargeHandsetLayoutType value)? largeHandset,
    TResult Function(SmallTabletLayoutType value)? smallTablet,
    TResult Function(LargeTabletLayoutType value)? largeTablet,
    TResult Function(DesktopLayoutType value)? desktop,
    required TResult orElse(),
  }) {
    if (largeHandset != null) {
      return largeHandset(this);
    }
    return orElse();
  }
}

abstract class LargeHandsetLayoutType extends LayoutType {
  const factory LargeHandsetLayoutType() = _$LargeHandsetLayoutTypeImpl;
  const LargeHandsetLayoutType._() : super._();
}

/// @nodoc
abstract class _$$SmallTabletLayoutTypeImplCopyWith<$Res> {
  factory _$$SmallTabletLayoutTypeImplCopyWith(
          _$SmallTabletLayoutTypeImpl value,
          $Res Function(_$SmallTabletLayoutTypeImpl) then) =
      __$$SmallTabletLayoutTypeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SmallTabletLayoutTypeImplCopyWithImpl<$Res>
    extends _$LayoutTypeCopyWithImpl<$Res, _$SmallTabletLayoutTypeImpl>
    implements _$$SmallTabletLayoutTypeImplCopyWith<$Res> {
  __$$SmallTabletLayoutTypeImplCopyWithImpl(_$SmallTabletLayoutTypeImpl _value,
      $Res Function(_$SmallTabletLayoutTypeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SmallTabletLayoutTypeImpl extends SmallTabletLayoutType {
  const _$SmallTabletLayoutTypeImpl() : super._();

  @override
  String toString() {
    return 'LayoutType.smallTablet()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmallTabletLayoutTypeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() smallHandset,
    required TResult Function() mediumHandset,
    required TResult Function() largeHandset,
    required TResult Function() smallTablet,
    required TResult Function() largeTablet,
    required TResult Function() desktop,
  }) {
    return smallTablet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? smallHandset,
    TResult? Function()? mediumHandset,
    TResult? Function()? largeHandset,
    TResult? Function()? smallTablet,
    TResult? Function()? largeTablet,
    TResult? Function()? desktop,
  }) {
    return smallTablet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? smallHandset,
    TResult Function()? mediumHandset,
    TResult Function()? largeHandset,
    TResult Function()? smallTablet,
    TResult Function()? largeTablet,
    TResult Function()? desktop,
    required TResult orElse(),
  }) {
    if (smallTablet != null) {
      return smallTablet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SmallHandsetLayoutType value) smallHandset,
    required TResult Function(MediumHandsetLayoutType value) mediumHandset,
    required TResult Function(LargeHandsetLayoutType value) largeHandset,
    required TResult Function(SmallTabletLayoutType value) smallTablet,
    required TResult Function(LargeTabletLayoutType value) largeTablet,
    required TResult Function(DesktopLayoutType value) desktop,
  }) {
    return smallTablet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SmallHandsetLayoutType value)? smallHandset,
    TResult? Function(MediumHandsetLayoutType value)? mediumHandset,
    TResult? Function(LargeHandsetLayoutType value)? largeHandset,
    TResult? Function(SmallTabletLayoutType value)? smallTablet,
    TResult? Function(LargeTabletLayoutType value)? largeTablet,
    TResult? Function(DesktopLayoutType value)? desktop,
  }) {
    return smallTablet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SmallHandsetLayoutType value)? smallHandset,
    TResult Function(MediumHandsetLayoutType value)? mediumHandset,
    TResult Function(LargeHandsetLayoutType value)? largeHandset,
    TResult Function(SmallTabletLayoutType value)? smallTablet,
    TResult Function(LargeTabletLayoutType value)? largeTablet,
    TResult Function(DesktopLayoutType value)? desktop,
    required TResult orElse(),
  }) {
    if (smallTablet != null) {
      return smallTablet(this);
    }
    return orElse();
  }
}

abstract class SmallTabletLayoutType extends LayoutType {
  const factory SmallTabletLayoutType() = _$SmallTabletLayoutTypeImpl;
  const SmallTabletLayoutType._() : super._();
}

/// @nodoc
abstract class _$$LargeTabletLayoutTypeImplCopyWith<$Res> {
  factory _$$LargeTabletLayoutTypeImplCopyWith(
          _$LargeTabletLayoutTypeImpl value,
          $Res Function(_$LargeTabletLayoutTypeImpl) then) =
      __$$LargeTabletLayoutTypeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LargeTabletLayoutTypeImplCopyWithImpl<$Res>
    extends _$LayoutTypeCopyWithImpl<$Res, _$LargeTabletLayoutTypeImpl>
    implements _$$LargeTabletLayoutTypeImplCopyWith<$Res> {
  __$$LargeTabletLayoutTypeImplCopyWithImpl(_$LargeTabletLayoutTypeImpl _value,
      $Res Function(_$LargeTabletLayoutTypeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LargeTabletLayoutTypeImpl extends LargeTabletLayoutType {
  const _$LargeTabletLayoutTypeImpl() : super._();

  @override
  String toString() {
    return 'LayoutType.largeTablet()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LargeTabletLayoutTypeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() smallHandset,
    required TResult Function() mediumHandset,
    required TResult Function() largeHandset,
    required TResult Function() smallTablet,
    required TResult Function() largeTablet,
    required TResult Function() desktop,
  }) {
    return largeTablet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? smallHandset,
    TResult? Function()? mediumHandset,
    TResult? Function()? largeHandset,
    TResult? Function()? smallTablet,
    TResult? Function()? largeTablet,
    TResult? Function()? desktop,
  }) {
    return largeTablet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? smallHandset,
    TResult Function()? mediumHandset,
    TResult Function()? largeHandset,
    TResult Function()? smallTablet,
    TResult Function()? largeTablet,
    TResult Function()? desktop,
    required TResult orElse(),
  }) {
    if (largeTablet != null) {
      return largeTablet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SmallHandsetLayoutType value) smallHandset,
    required TResult Function(MediumHandsetLayoutType value) mediumHandset,
    required TResult Function(LargeHandsetLayoutType value) largeHandset,
    required TResult Function(SmallTabletLayoutType value) smallTablet,
    required TResult Function(LargeTabletLayoutType value) largeTablet,
    required TResult Function(DesktopLayoutType value) desktop,
  }) {
    return largeTablet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SmallHandsetLayoutType value)? smallHandset,
    TResult? Function(MediumHandsetLayoutType value)? mediumHandset,
    TResult? Function(LargeHandsetLayoutType value)? largeHandset,
    TResult? Function(SmallTabletLayoutType value)? smallTablet,
    TResult? Function(LargeTabletLayoutType value)? largeTablet,
    TResult? Function(DesktopLayoutType value)? desktop,
  }) {
    return largeTablet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SmallHandsetLayoutType value)? smallHandset,
    TResult Function(MediumHandsetLayoutType value)? mediumHandset,
    TResult Function(LargeHandsetLayoutType value)? largeHandset,
    TResult Function(SmallTabletLayoutType value)? smallTablet,
    TResult Function(LargeTabletLayoutType value)? largeTablet,
    TResult Function(DesktopLayoutType value)? desktop,
    required TResult orElse(),
  }) {
    if (largeTablet != null) {
      return largeTablet(this);
    }
    return orElse();
  }
}

abstract class LargeTabletLayoutType extends LayoutType {
  const factory LargeTabletLayoutType() = _$LargeTabletLayoutTypeImpl;
  const LargeTabletLayoutType._() : super._();
}

/// @nodoc
abstract class _$$DesktopLayoutTypeImplCopyWith<$Res> {
  factory _$$DesktopLayoutTypeImplCopyWith(_$DesktopLayoutTypeImpl value,
          $Res Function(_$DesktopLayoutTypeImpl) then) =
      __$$DesktopLayoutTypeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DesktopLayoutTypeImplCopyWithImpl<$Res>
    extends _$LayoutTypeCopyWithImpl<$Res, _$DesktopLayoutTypeImpl>
    implements _$$DesktopLayoutTypeImplCopyWith<$Res> {
  __$$DesktopLayoutTypeImplCopyWithImpl(_$DesktopLayoutTypeImpl _value,
      $Res Function(_$DesktopLayoutTypeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DesktopLayoutTypeImpl extends DesktopLayoutType {
  const _$DesktopLayoutTypeImpl() : super._();

  @override
  String toString() {
    return 'LayoutType.desktop()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DesktopLayoutTypeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() smallHandset,
    required TResult Function() mediumHandset,
    required TResult Function() largeHandset,
    required TResult Function() smallTablet,
    required TResult Function() largeTablet,
    required TResult Function() desktop,
  }) {
    return desktop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? smallHandset,
    TResult? Function()? mediumHandset,
    TResult? Function()? largeHandset,
    TResult? Function()? smallTablet,
    TResult? Function()? largeTablet,
    TResult? Function()? desktop,
  }) {
    return desktop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? smallHandset,
    TResult Function()? mediumHandset,
    TResult Function()? largeHandset,
    TResult Function()? smallTablet,
    TResult Function()? largeTablet,
    TResult Function()? desktop,
    required TResult orElse(),
  }) {
    if (desktop != null) {
      return desktop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SmallHandsetLayoutType value) smallHandset,
    required TResult Function(MediumHandsetLayoutType value) mediumHandset,
    required TResult Function(LargeHandsetLayoutType value) largeHandset,
    required TResult Function(SmallTabletLayoutType value) smallTablet,
    required TResult Function(LargeTabletLayoutType value) largeTablet,
    required TResult Function(DesktopLayoutType value) desktop,
  }) {
    return desktop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SmallHandsetLayoutType value)? smallHandset,
    TResult? Function(MediumHandsetLayoutType value)? mediumHandset,
    TResult? Function(LargeHandsetLayoutType value)? largeHandset,
    TResult? Function(SmallTabletLayoutType value)? smallTablet,
    TResult? Function(LargeTabletLayoutType value)? largeTablet,
    TResult? Function(DesktopLayoutType value)? desktop,
  }) {
    return desktop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SmallHandsetLayoutType value)? smallHandset,
    TResult Function(MediumHandsetLayoutType value)? mediumHandset,
    TResult Function(LargeHandsetLayoutType value)? largeHandset,
    TResult Function(SmallTabletLayoutType value)? smallTablet,
    TResult Function(LargeTabletLayoutType value)? largeTablet,
    TResult Function(DesktopLayoutType value)? desktop,
    required TResult orElse(),
  }) {
    if (desktop != null) {
      return desktop(this);
    }
    return orElse();
  }
}

abstract class DesktopLayoutType extends LayoutType {
  const factory DesktopLayoutType() = _$DesktopLayoutTypeImpl;
  const DesktopLayoutType._() : super._();
}

/// @nodoc
mixin _$WindowType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() xsmall,
    required TResult Function() small,
    required TResult Function() medium,
    required TResult Function() large,
    required TResult Function() xlarge,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? xsmall,
    TResult? Function()? small,
    TResult? Function()? medium,
    TResult? Function()? large,
    TResult? Function()? xlarge,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? xsmall,
    TResult Function()? small,
    TResult Function()? medium,
    TResult Function()? large,
    TResult Function()? xlarge,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(XSmallWindowType value) xsmall,
    required TResult Function(SmallWindowType value) small,
    required TResult Function(MediumWindowType value) medium,
    required TResult Function(LargeWindowType value) large,
    required TResult Function(XLargeWindowType value) xlarge,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(XSmallWindowType value)? xsmall,
    TResult? Function(SmallWindowType value)? small,
    TResult? Function(MediumWindowType value)? medium,
    TResult? Function(LargeWindowType value)? large,
    TResult? Function(XLargeWindowType value)? xlarge,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(XSmallWindowType value)? xsmall,
    TResult Function(SmallWindowType value)? small,
    TResult Function(MediumWindowType value)? medium,
    TResult Function(LargeWindowType value)? large,
    TResult Function(XLargeWindowType value)? xlarge,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WindowTypeCopyWith<$Res> {
  factory $WindowTypeCopyWith(
          WindowType value, $Res Function(WindowType) then) =
      _$WindowTypeCopyWithImpl<$Res, WindowType>;
}

/// @nodoc
class _$WindowTypeCopyWithImpl<$Res, $Val extends WindowType>
    implements $WindowTypeCopyWith<$Res> {
  _$WindowTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$XSmallWindowTypeImplCopyWith<$Res> {
  factory _$$XSmallWindowTypeImplCopyWith(_$XSmallWindowTypeImpl value,
          $Res Function(_$XSmallWindowTypeImpl) then) =
      __$$XSmallWindowTypeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$XSmallWindowTypeImplCopyWithImpl<$Res>
    extends _$WindowTypeCopyWithImpl<$Res, _$XSmallWindowTypeImpl>
    implements _$$XSmallWindowTypeImplCopyWith<$Res> {
  __$$XSmallWindowTypeImplCopyWithImpl(_$XSmallWindowTypeImpl _value,
      $Res Function(_$XSmallWindowTypeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$XSmallWindowTypeImpl extends XSmallWindowType {
  const _$XSmallWindowTypeImpl() : super._();

  @override
  String toString() {
    return 'WindowType.xsmall()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$XSmallWindowTypeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() xsmall,
    required TResult Function() small,
    required TResult Function() medium,
    required TResult Function() large,
    required TResult Function() xlarge,
  }) {
    return xsmall();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? xsmall,
    TResult? Function()? small,
    TResult? Function()? medium,
    TResult? Function()? large,
    TResult? Function()? xlarge,
  }) {
    return xsmall?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? xsmall,
    TResult Function()? small,
    TResult Function()? medium,
    TResult Function()? large,
    TResult Function()? xlarge,
    required TResult orElse(),
  }) {
    if (xsmall != null) {
      return xsmall();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(XSmallWindowType value) xsmall,
    required TResult Function(SmallWindowType value) small,
    required TResult Function(MediumWindowType value) medium,
    required TResult Function(LargeWindowType value) large,
    required TResult Function(XLargeWindowType value) xlarge,
  }) {
    return xsmall(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(XSmallWindowType value)? xsmall,
    TResult? Function(SmallWindowType value)? small,
    TResult? Function(MediumWindowType value)? medium,
    TResult? Function(LargeWindowType value)? large,
    TResult? Function(XLargeWindowType value)? xlarge,
  }) {
    return xsmall?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(XSmallWindowType value)? xsmall,
    TResult Function(SmallWindowType value)? small,
    TResult Function(MediumWindowType value)? medium,
    TResult Function(LargeWindowType value)? large,
    TResult Function(XLargeWindowType value)? xlarge,
    required TResult orElse(),
  }) {
    if (xsmall != null) {
      return xsmall(this);
    }
    return orElse();
  }
}

abstract class XSmallWindowType extends WindowType {
  const factory XSmallWindowType() = _$XSmallWindowTypeImpl;
  const XSmallWindowType._() : super._();
}

/// @nodoc
abstract class _$$SmallWindowTypeImplCopyWith<$Res> {
  factory _$$SmallWindowTypeImplCopyWith(_$SmallWindowTypeImpl value,
          $Res Function(_$SmallWindowTypeImpl) then) =
      __$$SmallWindowTypeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SmallWindowTypeImplCopyWithImpl<$Res>
    extends _$WindowTypeCopyWithImpl<$Res, _$SmallWindowTypeImpl>
    implements _$$SmallWindowTypeImplCopyWith<$Res> {
  __$$SmallWindowTypeImplCopyWithImpl(
      _$SmallWindowTypeImpl _value, $Res Function(_$SmallWindowTypeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SmallWindowTypeImpl extends SmallWindowType {
  const _$SmallWindowTypeImpl() : super._();

  @override
  String toString() {
    return 'WindowType.small()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SmallWindowTypeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() xsmall,
    required TResult Function() small,
    required TResult Function() medium,
    required TResult Function() large,
    required TResult Function() xlarge,
  }) {
    return small();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? xsmall,
    TResult? Function()? small,
    TResult? Function()? medium,
    TResult? Function()? large,
    TResult? Function()? xlarge,
  }) {
    return small?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? xsmall,
    TResult Function()? small,
    TResult Function()? medium,
    TResult Function()? large,
    TResult Function()? xlarge,
    required TResult orElse(),
  }) {
    if (small != null) {
      return small();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(XSmallWindowType value) xsmall,
    required TResult Function(SmallWindowType value) small,
    required TResult Function(MediumWindowType value) medium,
    required TResult Function(LargeWindowType value) large,
    required TResult Function(XLargeWindowType value) xlarge,
  }) {
    return small(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(XSmallWindowType value)? xsmall,
    TResult? Function(SmallWindowType value)? small,
    TResult? Function(MediumWindowType value)? medium,
    TResult? Function(LargeWindowType value)? large,
    TResult? Function(XLargeWindowType value)? xlarge,
  }) {
    return small?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(XSmallWindowType value)? xsmall,
    TResult Function(SmallWindowType value)? small,
    TResult Function(MediumWindowType value)? medium,
    TResult Function(LargeWindowType value)? large,
    TResult Function(XLargeWindowType value)? xlarge,
    required TResult orElse(),
  }) {
    if (small != null) {
      return small(this);
    }
    return orElse();
  }
}

abstract class SmallWindowType extends WindowType {
  const factory SmallWindowType() = _$SmallWindowTypeImpl;
  const SmallWindowType._() : super._();
}

/// @nodoc
abstract class _$$MediumWindowTypeImplCopyWith<$Res> {
  factory _$$MediumWindowTypeImplCopyWith(_$MediumWindowTypeImpl value,
          $Res Function(_$MediumWindowTypeImpl) then) =
      __$$MediumWindowTypeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MediumWindowTypeImplCopyWithImpl<$Res>
    extends _$WindowTypeCopyWithImpl<$Res, _$MediumWindowTypeImpl>
    implements _$$MediumWindowTypeImplCopyWith<$Res> {
  __$$MediumWindowTypeImplCopyWithImpl(_$MediumWindowTypeImpl _value,
      $Res Function(_$MediumWindowTypeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MediumWindowTypeImpl extends MediumWindowType {
  const _$MediumWindowTypeImpl() : super._();

  @override
  String toString() {
    return 'WindowType.medium()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MediumWindowTypeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() xsmall,
    required TResult Function() small,
    required TResult Function() medium,
    required TResult Function() large,
    required TResult Function() xlarge,
  }) {
    return medium();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? xsmall,
    TResult? Function()? small,
    TResult? Function()? medium,
    TResult? Function()? large,
    TResult? Function()? xlarge,
  }) {
    return medium?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? xsmall,
    TResult Function()? small,
    TResult Function()? medium,
    TResult Function()? large,
    TResult Function()? xlarge,
    required TResult orElse(),
  }) {
    if (medium != null) {
      return medium();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(XSmallWindowType value) xsmall,
    required TResult Function(SmallWindowType value) small,
    required TResult Function(MediumWindowType value) medium,
    required TResult Function(LargeWindowType value) large,
    required TResult Function(XLargeWindowType value) xlarge,
  }) {
    return medium(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(XSmallWindowType value)? xsmall,
    TResult? Function(SmallWindowType value)? small,
    TResult? Function(MediumWindowType value)? medium,
    TResult? Function(LargeWindowType value)? large,
    TResult? Function(XLargeWindowType value)? xlarge,
  }) {
    return medium?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(XSmallWindowType value)? xsmall,
    TResult Function(SmallWindowType value)? small,
    TResult Function(MediumWindowType value)? medium,
    TResult Function(LargeWindowType value)? large,
    TResult Function(XLargeWindowType value)? xlarge,
    required TResult orElse(),
  }) {
    if (medium != null) {
      return medium(this);
    }
    return orElse();
  }
}

abstract class MediumWindowType extends WindowType {
  const factory MediumWindowType() = _$MediumWindowTypeImpl;
  const MediumWindowType._() : super._();
}

/// @nodoc
abstract class _$$LargeWindowTypeImplCopyWith<$Res> {
  factory _$$LargeWindowTypeImplCopyWith(_$LargeWindowTypeImpl value,
          $Res Function(_$LargeWindowTypeImpl) then) =
      __$$LargeWindowTypeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LargeWindowTypeImplCopyWithImpl<$Res>
    extends _$WindowTypeCopyWithImpl<$Res, _$LargeWindowTypeImpl>
    implements _$$LargeWindowTypeImplCopyWith<$Res> {
  __$$LargeWindowTypeImplCopyWithImpl(
      _$LargeWindowTypeImpl _value, $Res Function(_$LargeWindowTypeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LargeWindowTypeImpl extends LargeWindowType {
  const _$LargeWindowTypeImpl() : super._();

  @override
  String toString() {
    return 'WindowType.large()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LargeWindowTypeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() xsmall,
    required TResult Function() small,
    required TResult Function() medium,
    required TResult Function() large,
    required TResult Function() xlarge,
  }) {
    return large();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? xsmall,
    TResult? Function()? small,
    TResult? Function()? medium,
    TResult? Function()? large,
    TResult? Function()? xlarge,
  }) {
    return large?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? xsmall,
    TResult Function()? small,
    TResult Function()? medium,
    TResult Function()? large,
    TResult Function()? xlarge,
    required TResult orElse(),
  }) {
    if (large != null) {
      return large();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(XSmallWindowType value) xsmall,
    required TResult Function(SmallWindowType value) small,
    required TResult Function(MediumWindowType value) medium,
    required TResult Function(LargeWindowType value) large,
    required TResult Function(XLargeWindowType value) xlarge,
  }) {
    return large(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(XSmallWindowType value)? xsmall,
    TResult? Function(SmallWindowType value)? small,
    TResult? Function(MediumWindowType value)? medium,
    TResult? Function(LargeWindowType value)? large,
    TResult? Function(XLargeWindowType value)? xlarge,
  }) {
    return large?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(XSmallWindowType value)? xsmall,
    TResult Function(SmallWindowType value)? small,
    TResult Function(MediumWindowType value)? medium,
    TResult Function(LargeWindowType value)? large,
    TResult Function(XLargeWindowType value)? xlarge,
    required TResult orElse(),
  }) {
    if (large != null) {
      return large(this);
    }
    return orElse();
  }
}

abstract class LargeWindowType extends WindowType {
  const factory LargeWindowType() = _$LargeWindowTypeImpl;
  const LargeWindowType._() : super._();
}

/// @nodoc
abstract class _$$XLargeWindowTypeImplCopyWith<$Res> {
  factory _$$XLargeWindowTypeImplCopyWith(_$XLargeWindowTypeImpl value,
          $Res Function(_$XLargeWindowTypeImpl) then) =
      __$$XLargeWindowTypeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$XLargeWindowTypeImplCopyWithImpl<$Res>
    extends _$WindowTypeCopyWithImpl<$Res, _$XLargeWindowTypeImpl>
    implements _$$XLargeWindowTypeImplCopyWith<$Res> {
  __$$XLargeWindowTypeImplCopyWithImpl(_$XLargeWindowTypeImpl _value,
      $Res Function(_$XLargeWindowTypeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$XLargeWindowTypeImpl extends XLargeWindowType {
  const _$XLargeWindowTypeImpl() : super._();

  @override
  String toString() {
    return 'WindowType.xlarge()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$XLargeWindowTypeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() xsmall,
    required TResult Function() small,
    required TResult Function() medium,
    required TResult Function() large,
    required TResult Function() xlarge,
  }) {
    return xlarge();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? xsmall,
    TResult? Function()? small,
    TResult? Function()? medium,
    TResult? Function()? large,
    TResult? Function()? xlarge,
  }) {
    return xlarge?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? xsmall,
    TResult Function()? small,
    TResult Function()? medium,
    TResult Function()? large,
    TResult Function()? xlarge,
    required TResult orElse(),
  }) {
    if (xlarge != null) {
      return xlarge();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(XSmallWindowType value) xsmall,
    required TResult Function(SmallWindowType value) small,
    required TResult Function(MediumWindowType value) medium,
    required TResult Function(LargeWindowType value) large,
    required TResult Function(XLargeWindowType value) xlarge,
  }) {
    return xlarge(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(XSmallWindowType value)? xsmall,
    TResult? Function(SmallWindowType value)? small,
    TResult? Function(MediumWindowType value)? medium,
    TResult? Function(LargeWindowType value)? large,
    TResult? Function(XLargeWindowType value)? xlarge,
  }) {
    return xlarge?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(XSmallWindowType value)? xsmall,
    TResult Function(SmallWindowType value)? small,
    TResult Function(MediumWindowType value)? medium,
    TResult Function(LargeWindowType value)? large,
    TResult Function(XLargeWindowType value)? xlarge,
    required TResult orElse(),
  }) {
    if (xlarge != null) {
      return xlarge(this);
    }
    return orElse();
  }
}

abstract class XLargeWindowType extends WindowType {
  const factory XLargeWindowType() = _$XLargeWindowTypeImpl;
  const XLargeWindowType._() : super._();
}
