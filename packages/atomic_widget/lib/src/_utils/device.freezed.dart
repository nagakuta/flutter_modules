// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GoldenDevice {
  double get textScale => throw _privateConstructorUsedError;
  Brightness get brightness => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoldenDeviceCopyWith<GoldenDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoldenDeviceCopyWith<$Res> {
  factory $GoldenDeviceCopyWith(
          GoldenDevice value, $Res Function(GoldenDevice) then) =
      _$GoldenDeviceCopyWithImpl<$Res, GoldenDevice>;
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class _$GoldenDeviceCopyWithImpl<$Res, $Val extends GoldenDevice>
    implements $GoldenDeviceCopyWith<$Res> {
  _$GoldenDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_value.copyWith(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IPhoneSEImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$IPhoneSEImplCopyWith(
          _$IPhoneSEImpl value, $Res Function(_$IPhoneSEImpl) then) =
      __$$IPhoneSEImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$IPhoneSEImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$IPhoneSEImpl>
    implements _$$IPhoneSEImplCopyWith<$Res> {
  __$$IPhoneSEImplCopyWithImpl(
      _$IPhoneSEImpl _value, $Res Function(_$IPhoneSEImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$IPhoneSEImpl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$IPhoneSEImpl extends IPhoneSE {
  const _$IPhoneSEImpl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.iPhoneSE(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IPhoneSEImpl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IPhoneSEImplCopyWith<_$IPhoneSEImpl> get copyWith =>
      __$$IPhoneSEImplCopyWithImpl<_$IPhoneSEImpl>(this, _$identity);
}

abstract class IPhoneSE extends GoldenDevice {
  const factory IPhoneSE(
      {final double textScale, final Brightness brightness}) = _$IPhoneSEImpl;
  const IPhoneSE._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$IPhoneSEImplCopyWith<_$IPhoneSEImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IPhoneXRImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$IPhoneXRImplCopyWith(
          _$IPhoneXRImpl value, $Res Function(_$IPhoneXRImpl) then) =
      __$$IPhoneXRImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$IPhoneXRImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$IPhoneXRImpl>
    implements _$$IPhoneXRImplCopyWith<$Res> {
  __$$IPhoneXRImplCopyWithImpl(
      _$IPhoneXRImpl _value, $Res Function(_$IPhoneXRImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$IPhoneXRImpl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$IPhoneXRImpl extends IPhoneXR {
  const _$IPhoneXRImpl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.iPhoneXR(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IPhoneXRImpl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IPhoneXRImplCopyWith<_$IPhoneXRImpl> get copyWith =>
      __$$IPhoneXRImplCopyWithImpl<_$IPhoneXRImpl>(this, _$identity);
}

abstract class IPhoneXR extends GoldenDevice {
  const factory IPhoneXR(
      {final double textScale, final Brightness brightness}) = _$IPhoneXRImpl;
  const IPhoneXR._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$IPhoneXRImplCopyWith<_$IPhoneXRImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IPhone12ProImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$IPhone12ProImplCopyWith(
          _$IPhone12ProImpl value, $Res Function(_$IPhone12ProImpl) then) =
      __$$IPhone12ProImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$IPhone12ProImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$IPhone12ProImpl>
    implements _$$IPhone12ProImplCopyWith<$Res> {
  __$$IPhone12ProImplCopyWithImpl(
      _$IPhone12ProImpl _value, $Res Function(_$IPhone12ProImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$IPhone12ProImpl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$IPhone12ProImpl extends IPhone12Pro {
  const _$IPhone12ProImpl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.iPhone12Pro(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IPhone12ProImpl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IPhone12ProImplCopyWith<_$IPhone12ProImpl> get copyWith =>
      __$$IPhone12ProImplCopyWithImpl<_$IPhone12ProImpl>(this, _$identity);
}

abstract class IPhone12Pro extends GoldenDevice {
  const factory IPhone12Pro(
      {final double textScale,
      final Brightness brightness}) = _$IPhone12ProImpl;
  const IPhone12Pro._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$IPhone12ProImplCopyWith<_$IPhone12ProImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IPhone14ProMaxImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$IPhone14ProMaxImplCopyWith(_$IPhone14ProMaxImpl value,
          $Res Function(_$IPhone14ProMaxImpl) then) =
      __$$IPhone14ProMaxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$IPhone14ProMaxImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$IPhone14ProMaxImpl>
    implements _$$IPhone14ProMaxImplCopyWith<$Res> {
  __$$IPhone14ProMaxImplCopyWithImpl(
      _$IPhone14ProMaxImpl _value, $Res Function(_$IPhone14ProMaxImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$IPhone14ProMaxImpl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$IPhone14ProMaxImpl extends IPhone14ProMax {
  const _$IPhone14ProMaxImpl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.iPhone14ProMax(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IPhone14ProMaxImpl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IPhone14ProMaxImplCopyWith<_$IPhone14ProMaxImpl> get copyWith =>
      __$$IPhone14ProMaxImplCopyWithImpl<_$IPhone14ProMaxImpl>(
          this, _$identity);
}

abstract class IPhone14ProMax extends GoldenDevice {
  const factory IPhone14ProMax(
      {final double textScale,
      final Brightness brightness}) = _$IPhone14ProMaxImpl;
  const IPhone14ProMax._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$IPhone14ProMaxImplCopyWith<_$IPhone14ProMaxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Pixel7ImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$Pixel7ImplCopyWith(
          _$Pixel7Impl value, $Res Function(_$Pixel7Impl) then) =
      __$$Pixel7ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$Pixel7ImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$Pixel7Impl>
    implements _$$Pixel7ImplCopyWith<$Res> {
  __$$Pixel7ImplCopyWithImpl(
      _$Pixel7Impl _value, $Res Function(_$Pixel7Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$Pixel7Impl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$Pixel7Impl extends Pixel7 {
  const _$Pixel7Impl({this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.pixel7(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Pixel7Impl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Pixel7ImplCopyWith<_$Pixel7Impl> get copyWith =>
      __$$Pixel7ImplCopyWithImpl<_$Pixel7Impl>(this, _$identity);
}

abstract class Pixel7 extends GoldenDevice {
  const factory Pixel7({final double textScale, final Brightness brightness}) =
      _$Pixel7Impl;
  const Pixel7._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$Pixel7ImplCopyWith<_$Pixel7Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GalaxyS8PlusImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$GalaxyS8PlusImplCopyWith(
          _$GalaxyS8PlusImpl value, $Res Function(_$GalaxyS8PlusImpl) then) =
      __$$GalaxyS8PlusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$GalaxyS8PlusImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$GalaxyS8PlusImpl>
    implements _$$GalaxyS8PlusImplCopyWith<$Res> {
  __$$GalaxyS8PlusImplCopyWithImpl(
      _$GalaxyS8PlusImpl _value, $Res Function(_$GalaxyS8PlusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$GalaxyS8PlusImpl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$GalaxyS8PlusImpl extends GalaxyS8Plus {
  const _$GalaxyS8PlusImpl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.galaxyS8Plus(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalaxyS8PlusImpl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GalaxyS8PlusImplCopyWith<_$GalaxyS8PlusImpl> get copyWith =>
      __$$GalaxyS8PlusImplCopyWithImpl<_$GalaxyS8PlusImpl>(this, _$identity);
}

abstract class GalaxyS8Plus extends GoldenDevice {
  const factory GalaxyS8Plus(
      {final double textScale,
      final Brightness brightness}) = _$GalaxyS8PlusImpl;
  const GalaxyS8Plus._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$GalaxyS8PlusImplCopyWith<_$GalaxyS8PlusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GalaxyS20UltraImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$GalaxyS20UltraImplCopyWith(_$GalaxyS20UltraImpl value,
          $Res Function(_$GalaxyS20UltraImpl) then) =
      __$$GalaxyS20UltraImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$GalaxyS20UltraImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$GalaxyS20UltraImpl>
    implements _$$GalaxyS20UltraImplCopyWith<$Res> {
  __$$GalaxyS20UltraImplCopyWithImpl(
      _$GalaxyS20UltraImpl _value, $Res Function(_$GalaxyS20UltraImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$GalaxyS20UltraImpl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$GalaxyS20UltraImpl extends GalaxyS20Ultra {
  const _$GalaxyS20UltraImpl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.galaxyS20Ultra(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalaxyS20UltraImpl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GalaxyS20UltraImplCopyWith<_$GalaxyS20UltraImpl> get copyWith =>
      __$$GalaxyS20UltraImplCopyWithImpl<_$GalaxyS20UltraImpl>(
          this, _$identity);
}

abstract class GalaxyS20Ultra extends GoldenDevice {
  const factory GalaxyS20Ultra(
      {final double textScale,
      final Brightness brightness}) = _$GalaxyS20UltraImpl;
  const GalaxyS20Ultra._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$GalaxyS20UltraImplCopyWith<_$GalaxyS20UltraImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IPadAirImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$IPadAirImplCopyWith(
          _$IPadAirImpl value, $Res Function(_$IPadAirImpl) then) =
      __$$IPadAirImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$IPadAirImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$IPadAirImpl>
    implements _$$IPadAirImplCopyWith<$Res> {
  __$$IPadAirImplCopyWithImpl(
      _$IPadAirImpl _value, $Res Function(_$IPadAirImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$IPadAirImpl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$IPadAirImpl extends IPadAir {
  const _$IPadAirImpl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.iPadAir(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IPadAirImpl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IPadAirImplCopyWith<_$IPadAirImpl> get copyWith =>
      __$$IPadAirImplCopyWithImpl<_$IPadAirImpl>(this, _$identity);
}

abstract class IPadAir extends GoldenDevice {
  const factory IPadAir({final double textScale, final Brightness brightness}) =
      _$IPadAirImpl;
  const IPadAir._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$IPadAirImplCopyWith<_$IPadAirImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IPadMiniImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$IPadMiniImplCopyWith(
          _$IPadMiniImpl value, $Res Function(_$IPadMiniImpl) then) =
      __$$IPadMiniImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$IPadMiniImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$IPadMiniImpl>
    implements _$$IPadMiniImplCopyWith<$Res> {
  __$$IPadMiniImplCopyWithImpl(
      _$IPadMiniImpl _value, $Res Function(_$IPadMiniImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$IPadMiniImpl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$IPadMiniImpl extends IPadMini {
  const _$IPadMiniImpl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.iPadMini(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IPadMiniImpl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IPadMiniImplCopyWith<_$IPadMiniImpl> get copyWith =>
      __$$IPadMiniImplCopyWithImpl<_$IPadMiniImpl>(this, _$identity);
}

abstract class IPadMini extends GoldenDevice {
  const factory IPadMini(
      {final double textScale, final Brightness brightness}) = _$IPadMiniImpl;
  const IPadMini._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$IPadMiniImplCopyWith<_$IPadMiniImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IPadProImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$IPadProImplCopyWith(
          _$IPadProImpl value, $Res Function(_$IPadProImpl) then) =
      __$$IPadProImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$IPadProImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$IPadProImpl>
    implements _$$IPadProImplCopyWith<$Res> {
  __$$IPadProImplCopyWithImpl(
      _$IPadProImpl _value, $Res Function(_$IPadProImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$IPadProImpl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$IPadProImpl extends IPadPro {
  const _$IPadProImpl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.iPadPro(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IPadProImpl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IPadProImplCopyWith<_$IPadProImpl> get copyWith =>
      __$$IPadProImplCopyWithImpl<_$IPadProImpl>(this, _$identity);
}

abstract class IPadPro extends GoldenDevice {
  const factory IPadPro({final double textScale, final Brightness brightness}) =
      _$IPadProImpl;
  const IPadPro._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$IPadProImplCopyWith<_$IPadProImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SurfacePro7ImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$SurfacePro7ImplCopyWith(
          _$SurfacePro7Impl value, $Res Function(_$SurfacePro7Impl) then) =
      __$$SurfacePro7ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$SurfacePro7ImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$SurfacePro7Impl>
    implements _$$SurfacePro7ImplCopyWith<$Res> {
  __$$SurfacePro7ImplCopyWithImpl(
      _$SurfacePro7Impl _value, $Res Function(_$SurfacePro7Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$SurfacePro7Impl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$SurfacePro7Impl extends SurfacePro7 {
  const _$SurfacePro7Impl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.surfacePro7(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurfacePro7Impl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SurfacePro7ImplCopyWith<_$SurfacePro7Impl> get copyWith =>
      __$$SurfacePro7ImplCopyWithImpl<_$SurfacePro7Impl>(this, _$identity);
}

abstract class SurfacePro7 extends GoldenDevice {
  const factory SurfacePro7(
      {final double textScale,
      final Brightness brightness}) = _$SurfacePro7Impl;
  const SurfacePro7._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$SurfacePro7ImplCopyWith<_$SurfacePro7Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SurfaceDuoImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$SurfaceDuoImplCopyWith(
          _$SurfaceDuoImpl value, $Res Function(_$SurfaceDuoImpl) then) =
      __$$SurfaceDuoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$SurfaceDuoImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$SurfaceDuoImpl>
    implements _$$SurfaceDuoImplCopyWith<$Res> {
  __$$SurfaceDuoImplCopyWithImpl(
      _$SurfaceDuoImpl _value, $Res Function(_$SurfaceDuoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$SurfaceDuoImpl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$SurfaceDuoImpl extends SurfaceDuo {
  const _$SurfaceDuoImpl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.surfaceDuo(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurfaceDuoImpl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SurfaceDuoImplCopyWith<_$SurfaceDuoImpl> get copyWith =>
      __$$SurfaceDuoImplCopyWithImpl<_$SurfaceDuoImpl>(this, _$identity);
}

abstract class SurfaceDuo extends GoldenDevice {
  const factory SurfaceDuo(
      {final double textScale, final Brightness brightness}) = _$SurfaceDuoImpl;
  const SurfaceDuo._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$SurfaceDuoImplCopyWith<_$SurfaceDuoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GalaxyFoldImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$GalaxyFoldImplCopyWith(
          _$GalaxyFoldImpl value, $Res Function(_$GalaxyFoldImpl) then) =
      __$$GalaxyFoldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$GalaxyFoldImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$GalaxyFoldImpl>
    implements _$$GalaxyFoldImplCopyWith<$Res> {
  __$$GalaxyFoldImplCopyWithImpl(
      _$GalaxyFoldImpl _value, $Res Function(_$GalaxyFoldImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$GalaxyFoldImpl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$GalaxyFoldImpl extends GalaxyFold {
  const _$GalaxyFoldImpl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.galaxyFold(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalaxyFoldImpl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GalaxyFoldImplCopyWith<_$GalaxyFoldImpl> get copyWith =>
      __$$GalaxyFoldImplCopyWithImpl<_$GalaxyFoldImpl>(this, _$identity);
}

abstract class GalaxyFold extends GoldenDevice {
  const factory GalaxyFold(
      {final double textScale, final Brightness brightness}) = _$GalaxyFoldImpl;
  const GalaxyFold._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$GalaxyFoldImplCopyWith<_$GalaxyFoldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GalaxyA51ImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$GalaxyA51ImplCopyWith(
          _$GalaxyA51Impl value, $Res Function(_$GalaxyA51Impl) then) =
      __$$GalaxyA51ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$GalaxyA51ImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$GalaxyA51Impl>
    implements _$$GalaxyA51ImplCopyWith<$Res> {
  __$$GalaxyA51ImplCopyWithImpl(
      _$GalaxyA51Impl _value, $Res Function(_$GalaxyA51Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$GalaxyA51Impl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$GalaxyA51Impl extends GalaxyA51 {
  const _$GalaxyA51Impl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.galaxyA51(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalaxyA51Impl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GalaxyA51ImplCopyWith<_$GalaxyA51Impl> get copyWith =>
      __$$GalaxyA51ImplCopyWithImpl<_$GalaxyA51Impl>(this, _$identity);
}

abstract class GalaxyA51 extends GoldenDevice {
  const factory GalaxyA51(
      {final double textScale, final Brightness brightness}) = _$GalaxyA51Impl;
  const GalaxyA51._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$GalaxyA51ImplCopyWith<_$GalaxyA51Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NestHubImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$NestHubImplCopyWith(
          _$NestHubImpl value, $Res Function(_$NestHubImpl) then) =
      __$$NestHubImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$NestHubImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$NestHubImpl>
    implements _$$NestHubImplCopyWith<$Res> {
  __$$NestHubImplCopyWithImpl(
      _$NestHubImpl _value, $Res Function(_$NestHubImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$NestHubImpl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$NestHubImpl extends NestHub {
  const _$NestHubImpl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.nestHub(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NestHubImpl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NestHubImplCopyWith<_$NestHubImpl> get copyWith =>
      __$$NestHubImplCopyWithImpl<_$NestHubImpl>(this, _$identity);
}

abstract class NestHub extends GoldenDevice {
  const factory NestHub({final double textScale, final Brightness brightness}) =
      _$NestHubImpl;
  const NestHub._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$NestHubImplCopyWith<_$NestHubImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NestHubMaxImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$NestHubMaxImplCopyWith(
          _$NestHubMaxImpl value, $Res Function(_$NestHubMaxImpl) then) =
      __$$NestHubMaxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$NestHubMaxImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$NestHubMaxImpl>
    implements _$$NestHubMaxImplCopyWith<$Res> {
  __$$NestHubMaxImplCopyWithImpl(
      _$NestHubMaxImpl _value, $Res Function(_$NestHubMaxImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$NestHubMaxImpl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$NestHubMaxImpl extends NestHubMax {
  const _$NestHubMaxImpl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.nestHubMax(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NestHubMaxImpl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NestHubMaxImplCopyWith<_$NestHubMaxImpl> get copyWith =>
      __$$NestHubMaxImplCopyWithImpl<_$NestHubMaxImpl>(this, _$identity);
}

abstract class NestHubMax extends GoldenDevice {
  const factory NestHubMax(
      {final double textScale, final Brightness brightness}) = _$NestHubMaxImpl;
  const NestHubMax._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$NestHubMaxImplCopyWith<_$NestHubMaxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WebBrowserImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$WebBrowserImplCopyWith(
          _$WebBrowserImpl value, $Res Function(_$WebBrowserImpl) then) =
      __$$WebBrowserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$WebBrowserImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$WebBrowserImpl>
    implements _$$WebBrowserImplCopyWith<$Res> {
  __$$WebBrowserImplCopyWithImpl(
      _$WebBrowserImpl _value, $Res Function(_$WebBrowserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$WebBrowserImpl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$WebBrowserImpl extends WebBrowser {
  const _$WebBrowserImpl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.webBrowser(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebBrowserImpl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WebBrowserImplCopyWith<_$WebBrowserImpl> get copyWith =>
      __$$WebBrowserImplCopyWithImpl<_$WebBrowserImpl>(this, _$identity);
}

abstract class WebBrowser extends GoldenDevice {
  const factory WebBrowser(
      {final double textScale, final Brightness brightness}) = _$WebBrowserImpl;
  const WebBrowser._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$WebBrowserImplCopyWith<_$WebBrowserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FullScreenWebBrowserImplCopyWith<$Res>
    implements $GoldenDeviceCopyWith<$Res> {
  factory _$$FullScreenWebBrowserImplCopyWith(_$FullScreenWebBrowserImpl value,
          $Res Function(_$FullScreenWebBrowserImpl) then) =
      __$$FullScreenWebBrowserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double textScale, Brightness brightness});
}

/// @nodoc
class __$$FullScreenWebBrowserImplCopyWithImpl<$Res>
    extends _$GoldenDeviceCopyWithImpl<$Res, _$FullScreenWebBrowserImpl>
    implements _$$FullScreenWebBrowserImplCopyWith<$Res> {
  __$$FullScreenWebBrowserImplCopyWithImpl(_$FullScreenWebBrowserImpl _value,
      $Res Function(_$FullScreenWebBrowserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textScale = null,
    Object? brightness = null,
  }) {
    return _then(_$FullScreenWebBrowserImpl(
      textScale: null == textScale
          ? _value.textScale
          : textScale // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc

class _$FullScreenWebBrowserImpl extends FullScreenWebBrowser {
  const _$FullScreenWebBrowserImpl(
      {this.textScale = 1.0, this.brightness = Brightness.light})
      : super._();

  @override
  @JsonKey()
  final double textScale;
  @override
  @JsonKey()
  final Brightness brightness;

  @override
  String toString() {
    return 'GoldenDevice.fullScreenWebBrowser(textScale: $textScale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FullScreenWebBrowserImpl &&
            (identical(other.textScale, textScale) ||
                other.textScale == textScale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textScale, brightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FullScreenWebBrowserImplCopyWith<_$FullScreenWebBrowserImpl>
      get copyWith =>
          __$$FullScreenWebBrowserImplCopyWithImpl<_$FullScreenWebBrowserImpl>(
              this, _$identity);
}

abstract class FullScreenWebBrowser extends GoldenDevice {
  const factory FullScreenWebBrowser(
      {final double textScale,
      final Brightness brightness}) = _$FullScreenWebBrowserImpl;
  const FullScreenWebBrowser._() : super._();

  @override
  double get textScale;
  @override
  Brightness get brightness;
  @override
  @JsonKey(ignore: true)
  _$$FullScreenWebBrowserImplCopyWith<_$FullScreenWebBrowserImpl>
      get copyWith => throw _privateConstructorUsedError;
}
