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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_BreakpointCopyWith<$Res>
    implements $BreakpointCopyWith<$Res> {
  factory _$$_BreakpointCopyWith(
          _$_Breakpoint value, $Res Function(_$_Breakpoint) then) =
      __$$_BreakpointCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LayoutType layoutType, WindowType windowType});

  @override
  $LayoutTypeCopyWith<$Res> get layoutType;
  @override
  $WindowTypeCopyWith<$Res> get windowType;
}

/// @nodoc
class __$$_BreakpointCopyWithImpl<$Res>
    extends _$BreakpointCopyWithImpl<$Res, _$_Breakpoint>
    implements _$$_BreakpointCopyWith<$Res> {
  __$$_BreakpointCopyWithImpl(
      _$_Breakpoint _value, $Res Function(_$_Breakpoint) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? layoutType = null,
    Object? windowType = null,
  }) {
    return _then(_$_Breakpoint(
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

class _$_Breakpoint extends _Breakpoint {
  const _$_Breakpoint({required this.layoutType, required this.windowType})
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Breakpoint &&
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
  _$$_BreakpointCopyWith<_$_Breakpoint> get copyWith =>
      __$$_BreakpointCopyWithImpl<_$_Breakpoint>(this, _$identity);
}

abstract class _Breakpoint extends Breakpoint {
  const factory _Breakpoint(
      {required final LayoutType layoutType,
      required final WindowType windowType}) = _$_Breakpoint;
  const _Breakpoint._() : super._();

  @override
  LayoutType get layoutType;
  @override
  WindowType get windowType;
  @override
  @JsonKey(ignore: true)
  _$$_BreakpointCopyWith<_$_Breakpoint> get copyWith =>
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
abstract class _$$SmallHandsetLayoutTypeCopyWith<$Res> {
  factory _$$SmallHandsetLayoutTypeCopyWith(_$SmallHandsetLayoutType value,
          $Res Function(_$SmallHandsetLayoutType) then) =
      __$$SmallHandsetLayoutTypeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SmallHandsetLayoutTypeCopyWithImpl<$Res>
    extends _$LayoutTypeCopyWithImpl<$Res, _$SmallHandsetLayoutType>
    implements _$$SmallHandsetLayoutTypeCopyWith<$Res> {
  __$$SmallHandsetLayoutTypeCopyWithImpl(_$SmallHandsetLayoutType _value,
      $Res Function(_$SmallHandsetLayoutType) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SmallHandsetLayoutType extends SmallHandsetLayoutType {
  const _$SmallHandsetLayoutType() : super._();

  @override
  String toString() {
    return 'LayoutType.smallHandset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SmallHandsetLayoutType);
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
  const factory SmallHandsetLayoutType() = _$SmallHandsetLayoutType;
  const SmallHandsetLayoutType._() : super._();
}

/// @nodoc
abstract class _$$MediumHandsetLayoutTypeCopyWith<$Res> {
  factory _$$MediumHandsetLayoutTypeCopyWith(_$MediumHandsetLayoutType value,
          $Res Function(_$MediumHandsetLayoutType) then) =
      __$$MediumHandsetLayoutTypeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MediumHandsetLayoutTypeCopyWithImpl<$Res>
    extends _$LayoutTypeCopyWithImpl<$Res, _$MediumHandsetLayoutType>
    implements _$$MediumHandsetLayoutTypeCopyWith<$Res> {
  __$$MediumHandsetLayoutTypeCopyWithImpl(_$MediumHandsetLayoutType _value,
      $Res Function(_$MediumHandsetLayoutType) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MediumHandsetLayoutType extends MediumHandsetLayoutType {
  const _$MediumHandsetLayoutType() : super._();

  @override
  String toString() {
    return 'LayoutType.mediumHandset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediumHandsetLayoutType);
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
  const factory MediumHandsetLayoutType() = _$MediumHandsetLayoutType;
  const MediumHandsetLayoutType._() : super._();
}

/// @nodoc
abstract class _$$LargeHandsetLayoutTypeCopyWith<$Res> {
  factory _$$LargeHandsetLayoutTypeCopyWith(_$LargeHandsetLayoutType value,
          $Res Function(_$LargeHandsetLayoutType) then) =
      __$$LargeHandsetLayoutTypeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LargeHandsetLayoutTypeCopyWithImpl<$Res>
    extends _$LayoutTypeCopyWithImpl<$Res, _$LargeHandsetLayoutType>
    implements _$$LargeHandsetLayoutTypeCopyWith<$Res> {
  __$$LargeHandsetLayoutTypeCopyWithImpl(_$LargeHandsetLayoutType _value,
      $Res Function(_$LargeHandsetLayoutType) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LargeHandsetLayoutType extends LargeHandsetLayoutType {
  const _$LargeHandsetLayoutType() : super._();

  @override
  String toString() {
    return 'LayoutType.largeHandset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LargeHandsetLayoutType);
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
  const factory LargeHandsetLayoutType() = _$LargeHandsetLayoutType;
  const LargeHandsetLayoutType._() : super._();
}

/// @nodoc
abstract class _$$SmallTabletLayoutTypeCopyWith<$Res> {
  factory _$$SmallTabletLayoutTypeCopyWith(_$SmallTabletLayoutType value,
          $Res Function(_$SmallTabletLayoutType) then) =
      __$$SmallTabletLayoutTypeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SmallTabletLayoutTypeCopyWithImpl<$Res>
    extends _$LayoutTypeCopyWithImpl<$Res, _$SmallTabletLayoutType>
    implements _$$SmallTabletLayoutTypeCopyWith<$Res> {
  __$$SmallTabletLayoutTypeCopyWithImpl(_$SmallTabletLayoutType _value,
      $Res Function(_$SmallTabletLayoutType) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SmallTabletLayoutType extends SmallTabletLayoutType {
  const _$SmallTabletLayoutType() : super._();

  @override
  String toString() {
    return 'LayoutType.smallTablet()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SmallTabletLayoutType);
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
  const factory SmallTabletLayoutType() = _$SmallTabletLayoutType;
  const SmallTabletLayoutType._() : super._();
}

/// @nodoc
abstract class _$$LargeTabletLayoutTypeCopyWith<$Res> {
  factory _$$LargeTabletLayoutTypeCopyWith(_$LargeTabletLayoutType value,
          $Res Function(_$LargeTabletLayoutType) then) =
      __$$LargeTabletLayoutTypeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LargeTabletLayoutTypeCopyWithImpl<$Res>
    extends _$LayoutTypeCopyWithImpl<$Res, _$LargeTabletLayoutType>
    implements _$$LargeTabletLayoutTypeCopyWith<$Res> {
  __$$LargeTabletLayoutTypeCopyWithImpl(_$LargeTabletLayoutType _value,
      $Res Function(_$LargeTabletLayoutType) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LargeTabletLayoutType extends LargeTabletLayoutType {
  const _$LargeTabletLayoutType() : super._();

  @override
  String toString() {
    return 'LayoutType.largeTablet()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LargeTabletLayoutType);
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
  const factory LargeTabletLayoutType() = _$LargeTabletLayoutType;
  const LargeTabletLayoutType._() : super._();
}

/// @nodoc
abstract class _$$DesktopLayoutTypeCopyWith<$Res> {
  factory _$$DesktopLayoutTypeCopyWith(
          _$DesktopLayoutType value, $Res Function(_$DesktopLayoutType) then) =
      __$$DesktopLayoutTypeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DesktopLayoutTypeCopyWithImpl<$Res>
    extends _$LayoutTypeCopyWithImpl<$Res, _$DesktopLayoutType>
    implements _$$DesktopLayoutTypeCopyWith<$Res> {
  __$$DesktopLayoutTypeCopyWithImpl(
      _$DesktopLayoutType _value, $Res Function(_$DesktopLayoutType) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DesktopLayoutType extends DesktopLayoutType {
  const _$DesktopLayoutType() : super._();

  @override
  String toString() {
    return 'LayoutType.desktop()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DesktopLayoutType);
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
  const factory DesktopLayoutType() = _$DesktopLayoutType;
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
abstract class _$$XSmallWindowTypeCopyWith<$Res> {
  factory _$$XSmallWindowTypeCopyWith(
          _$XSmallWindowType value, $Res Function(_$XSmallWindowType) then) =
      __$$XSmallWindowTypeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$XSmallWindowTypeCopyWithImpl<$Res>
    extends _$WindowTypeCopyWithImpl<$Res, _$XSmallWindowType>
    implements _$$XSmallWindowTypeCopyWith<$Res> {
  __$$XSmallWindowTypeCopyWithImpl(
      _$XSmallWindowType _value, $Res Function(_$XSmallWindowType) _then)
      : super(_value, _then);
}

/// @nodoc

class _$XSmallWindowType extends XSmallWindowType {
  const _$XSmallWindowType() : super._();

  @override
  String toString() {
    return 'WindowType.xsmall()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$XSmallWindowType);
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
  const factory XSmallWindowType() = _$XSmallWindowType;
  const XSmallWindowType._() : super._();
}

/// @nodoc
abstract class _$$SmallWindowTypeCopyWith<$Res> {
  factory _$$SmallWindowTypeCopyWith(
          _$SmallWindowType value, $Res Function(_$SmallWindowType) then) =
      __$$SmallWindowTypeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SmallWindowTypeCopyWithImpl<$Res>
    extends _$WindowTypeCopyWithImpl<$Res, _$SmallWindowType>
    implements _$$SmallWindowTypeCopyWith<$Res> {
  __$$SmallWindowTypeCopyWithImpl(
      _$SmallWindowType _value, $Res Function(_$SmallWindowType) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SmallWindowType extends SmallWindowType {
  const _$SmallWindowType() : super._();

  @override
  String toString() {
    return 'WindowType.small()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SmallWindowType);
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
  const factory SmallWindowType() = _$SmallWindowType;
  const SmallWindowType._() : super._();
}

/// @nodoc
abstract class _$$MediumWindowTypeCopyWith<$Res> {
  factory _$$MediumWindowTypeCopyWith(
          _$MediumWindowType value, $Res Function(_$MediumWindowType) then) =
      __$$MediumWindowTypeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MediumWindowTypeCopyWithImpl<$Res>
    extends _$WindowTypeCopyWithImpl<$Res, _$MediumWindowType>
    implements _$$MediumWindowTypeCopyWith<$Res> {
  __$$MediumWindowTypeCopyWithImpl(
      _$MediumWindowType _value, $Res Function(_$MediumWindowType) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MediumWindowType extends MediumWindowType {
  const _$MediumWindowType() : super._();

  @override
  String toString() {
    return 'WindowType.medium()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MediumWindowType);
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
  const factory MediumWindowType() = _$MediumWindowType;
  const MediumWindowType._() : super._();
}

/// @nodoc
abstract class _$$LargeWindowTypeCopyWith<$Res> {
  factory _$$LargeWindowTypeCopyWith(
          _$LargeWindowType value, $Res Function(_$LargeWindowType) then) =
      __$$LargeWindowTypeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LargeWindowTypeCopyWithImpl<$Res>
    extends _$WindowTypeCopyWithImpl<$Res, _$LargeWindowType>
    implements _$$LargeWindowTypeCopyWith<$Res> {
  __$$LargeWindowTypeCopyWithImpl(
      _$LargeWindowType _value, $Res Function(_$LargeWindowType) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LargeWindowType extends LargeWindowType {
  const _$LargeWindowType() : super._();

  @override
  String toString() {
    return 'WindowType.large()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LargeWindowType);
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
  const factory LargeWindowType() = _$LargeWindowType;
  const LargeWindowType._() : super._();
}

/// @nodoc
abstract class _$$XLargeWindowTypeCopyWith<$Res> {
  factory _$$XLargeWindowTypeCopyWith(
          _$XLargeWindowType value, $Res Function(_$XLargeWindowType) then) =
      __$$XLargeWindowTypeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$XLargeWindowTypeCopyWithImpl<$Res>
    extends _$WindowTypeCopyWithImpl<$Res, _$XLargeWindowType>
    implements _$$XLargeWindowTypeCopyWith<$Res> {
  __$$XLargeWindowTypeCopyWithImpl(
      _$XLargeWindowType _value, $Res Function(_$XLargeWindowType) _then)
      : super(_value, _then);
}

/// @nodoc

class _$XLargeWindowType extends XLargeWindowType {
  const _$XLargeWindowType() : super._();

  @override
  String toString() {
    return 'WindowType.xlarge()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$XLargeWindowType);
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
  const factory XLargeWindowType() = _$XLargeWindowType;
  const XLargeWindowType._() : super._();
}
