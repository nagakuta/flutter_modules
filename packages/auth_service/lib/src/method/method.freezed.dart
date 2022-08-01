// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthMethod {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() anonymous,
    required TResult Function(String email, String password) email,
    required TResult Function() google,
    required TResult Function() facebook,
    required TResult Function() apple,
    required TResult Function(
            String apiKey, String apiSecretKey, String redirectURI)
        twitter,
    required TResult Function(String verificationId, String smsCode) phone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? anonymous,
    TResult Function(String email, String password)? email,
    TResult Function()? google,
    TResult Function()? facebook,
    TResult Function()? apple,
    TResult Function(String apiKey, String apiSecretKey, String redirectURI)?
        twitter,
    TResult Function(String verificationId, String smsCode)? phone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? anonymous,
    TResult Function(String email, String password)? email,
    TResult Function()? google,
    TResult Function()? facebook,
    TResult Function()? apple,
    TResult Function(String apiKey, String apiSecretKey, String redirectURI)?
        twitter,
    TResult Function(String verificationId, String smsCode)? phone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AnonymousAuthMethod value) anonymous,
    required TResult Function(EmailAuthMethod value) email,
    required TResult Function(GoogleAuthMethod value) google,
    required TResult Function(FacebookAuthMethod value) facebook,
    required TResult Function(AppleAuthMethod value) apple,
    required TResult Function(TwitterAuthMethod value) twitter,
    required TResult Function(PhoneAuthMethod value) phone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AnonymousAuthMethod value)? anonymous,
    TResult Function(EmailAuthMethod value)? email,
    TResult Function(GoogleAuthMethod value)? google,
    TResult Function(FacebookAuthMethod value)? facebook,
    TResult Function(AppleAuthMethod value)? apple,
    TResult Function(TwitterAuthMethod value)? twitter,
    TResult Function(PhoneAuthMethod value)? phone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AnonymousAuthMethod value)? anonymous,
    TResult Function(EmailAuthMethod value)? email,
    TResult Function(GoogleAuthMethod value)? google,
    TResult Function(FacebookAuthMethod value)? facebook,
    TResult Function(AppleAuthMethod value)? apple,
    TResult Function(TwitterAuthMethod value)? twitter,
    TResult Function(PhoneAuthMethod value)? phone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthMethodCopyWith<$Res> {
  factory $AuthMethodCopyWith(
          AuthMethod value, $Res Function(AuthMethod) then) =
      _$AuthMethodCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthMethodCopyWithImpl<$Res> implements $AuthMethodCopyWith<$Res> {
  _$AuthMethodCopyWithImpl(this._value, this._then);

  final AuthMethod _value;
  // ignore: unused_field
  final $Res Function(AuthMethod) _then;
}

/// @nodoc
abstract class _$$AnonymousAuthMethodCopyWith<$Res> {
  factory _$$AnonymousAuthMethodCopyWith(_$AnonymousAuthMethod value,
          $Res Function(_$AnonymousAuthMethod) then) =
      __$$AnonymousAuthMethodCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AnonymousAuthMethodCopyWithImpl<$Res>
    extends _$AuthMethodCopyWithImpl<$Res>
    implements _$$AnonymousAuthMethodCopyWith<$Res> {
  __$$AnonymousAuthMethodCopyWithImpl(
      _$AnonymousAuthMethod _value, $Res Function(_$AnonymousAuthMethod) _then)
      : super(_value, (v) => _then(v as _$AnonymousAuthMethod));

  @override
  _$AnonymousAuthMethod get _value => super._value as _$AnonymousAuthMethod;
}

/// @nodoc

class _$AnonymousAuthMethod extends AnonymousAuthMethod {
  const _$AnonymousAuthMethod() : super._();

  @override
  String toString() {
    return 'AuthMethod.anonymous()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AnonymousAuthMethod);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() anonymous,
    required TResult Function(String email, String password) email,
    required TResult Function() google,
    required TResult Function() facebook,
    required TResult Function() apple,
    required TResult Function(
            String apiKey, String apiSecretKey, String redirectURI)
        twitter,
    required TResult Function(String verificationId, String smsCode) phone,
  }) {
    return anonymous();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? anonymous,
    TResult Function(String email, String password)? email,
    TResult Function()? google,
    TResult Function()? facebook,
    TResult Function()? apple,
    TResult Function(String apiKey, String apiSecretKey, String redirectURI)?
        twitter,
    TResult Function(String verificationId, String smsCode)? phone,
  }) {
    return anonymous?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? anonymous,
    TResult Function(String email, String password)? email,
    TResult Function()? google,
    TResult Function()? facebook,
    TResult Function()? apple,
    TResult Function(String apiKey, String apiSecretKey, String redirectURI)?
        twitter,
    TResult Function(String verificationId, String smsCode)? phone,
    required TResult orElse(),
  }) {
    if (anonymous != null) {
      return anonymous();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AnonymousAuthMethod value) anonymous,
    required TResult Function(EmailAuthMethod value) email,
    required TResult Function(GoogleAuthMethod value) google,
    required TResult Function(FacebookAuthMethod value) facebook,
    required TResult Function(AppleAuthMethod value) apple,
    required TResult Function(TwitterAuthMethod value) twitter,
    required TResult Function(PhoneAuthMethod value) phone,
  }) {
    return anonymous(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AnonymousAuthMethod value)? anonymous,
    TResult Function(EmailAuthMethod value)? email,
    TResult Function(GoogleAuthMethod value)? google,
    TResult Function(FacebookAuthMethod value)? facebook,
    TResult Function(AppleAuthMethod value)? apple,
    TResult Function(TwitterAuthMethod value)? twitter,
    TResult Function(PhoneAuthMethod value)? phone,
  }) {
    return anonymous?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AnonymousAuthMethod value)? anonymous,
    TResult Function(EmailAuthMethod value)? email,
    TResult Function(GoogleAuthMethod value)? google,
    TResult Function(FacebookAuthMethod value)? facebook,
    TResult Function(AppleAuthMethod value)? apple,
    TResult Function(TwitterAuthMethod value)? twitter,
    TResult Function(PhoneAuthMethod value)? phone,
    required TResult orElse(),
  }) {
    if (anonymous != null) {
      return anonymous(this);
    }
    return orElse();
  }
}

abstract class AnonymousAuthMethod extends AuthMethod {
  const factory AnonymousAuthMethod() = _$AnonymousAuthMethod;
  const AnonymousAuthMethod._() : super._();
}

/// @nodoc
abstract class _$$EmailAuthMethodCopyWith<$Res> {
  factory _$$EmailAuthMethodCopyWith(
          _$EmailAuthMethod value, $Res Function(_$EmailAuthMethod) then) =
      __$$EmailAuthMethodCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class __$$EmailAuthMethodCopyWithImpl<$Res>
    extends _$AuthMethodCopyWithImpl<$Res>
    implements _$$EmailAuthMethodCopyWith<$Res> {
  __$$EmailAuthMethodCopyWithImpl(
      _$EmailAuthMethod _value, $Res Function(_$EmailAuthMethod) _then)
      : super(_value, (v) => _then(v as _$EmailAuthMethod));

  @override
  _$EmailAuthMethod get _value => super._value as _$EmailAuthMethod;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$EmailAuthMethod(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailAuthMethod extends EmailAuthMethod {
  const _$EmailAuthMethod({required this.email, required this.password})
      : super._();

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthMethod.email(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailAuthMethod &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$EmailAuthMethodCopyWith<_$EmailAuthMethod> get copyWith =>
      __$$EmailAuthMethodCopyWithImpl<_$EmailAuthMethod>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() anonymous,
    required TResult Function(String email, String password) email,
    required TResult Function() google,
    required TResult Function() facebook,
    required TResult Function() apple,
    required TResult Function(
            String apiKey, String apiSecretKey, String redirectURI)
        twitter,
    required TResult Function(String verificationId, String smsCode) phone,
  }) {
    return email(this.email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? anonymous,
    TResult Function(String email, String password)? email,
    TResult Function()? google,
    TResult Function()? facebook,
    TResult Function()? apple,
    TResult Function(String apiKey, String apiSecretKey, String redirectURI)?
        twitter,
    TResult Function(String verificationId, String smsCode)? phone,
  }) {
    return email?.call(this.email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? anonymous,
    TResult Function(String email, String password)? email,
    TResult Function()? google,
    TResult Function()? facebook,
    TResult Function()? apple,
    TResult Function(String apiKey, String apiSecretKey, String redirectURI)?
        twitter,
    TResult Function(String verificationId, String smsCode)? phone,
    required TResult orElse(),
  }) {
    if (email != null) {
      return email(this.email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AnonymousAuthMethod value) anonymous,
    required TResult Function(EmailAuthMethod value) email,
    required TResult Function(GoogleAuthMethod value) google,
    required TResult Function(FacebookAuthMethod value) facebook,
    required TResult Function(AppleAuthMethod value) apple,
    required TResult Function(TwitterAuthMethod value) twitter,
    required TResult Function(PhoneAuthMethod value) phone,
  }) {
    return email(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AnonymousAuthMethod value)? anonymous,
    TResult Function(EmailAuthMethod value)? email,
    TResult Function(GoogleAuthMethod value)? google,
    TResult Function(FacebookAuthMethod value)? facebook,
    TResult Function(AppleAuthMethod value)? apple,
    TResult Function(TwitterAuthMethod value)? twitter,
    TResult Function(PhoneAuthMethod value)? phone,
  }) {
    return email?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AnonymousAuthMethod value)? anonymous,
    TResult Function(EmailAuthMethod value)? email,
    TResult Function(GoogleAuthMethod value)? google,
    TResult Function(FacebookAuthMethod value)? facebook,
    TResult Function(AppleAuthMethod value)? apple,
    TResult Function(TwitterAuthMethod value)? twitter,
    TResult Function(PhoneAuthMethod value)? phone,
    required TResult orElse(),
  }) {
    if (email != null) {
      return email(this);
    }
    return orElse();
  }
}

abstract class EmailAuthMethod extends AuthMethod {
  const factory EmailAuthMethod(
      {required final String email,
      required final String password}) = _$EmailAuthMethod;
  const EmailAuthMethod._() : super._();

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$EmailAuthMethodCopyWith<_$EmailAuthMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GoogleAuthMethodCopyWith<$Res> {
  factory _$$GoogleAuthMethodCopyWith(
          _$GoogleAuthMethod value, $Res Function(_$GoogleAuthMethod) then) =
      __$$GoogleAuthMethodCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleAuthMethodCopyWithImpl<$Res>
    extends _$AuthMethodCopyWithImpl<$Res>
    implements _$$GoogleAuthMethodCopyWith<$Res> {
  __$$GoogleAuthMethodCopyWithImpl(
      _$GoogleAuthMethod _value, $Res Function(_$GoogleAuthMethod) _then)
      : super(_value, (v) => _then(v as _$GoogleAuthMethod));

  @override
  _$GoogleAuthMethod get _value => super._value as _$GoogleAuthMethod;
}

/// @nodoc

class _$GoogleAuthMethod extends GoogleAuthMethod {
  const _$GoogleAuthMethod() : super._();

  @override
  String toString() {
    return 'AuthMethod.google()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleAuthMethod);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() anonymous,
    required TResult Function(String email, String password) email,
    required TResult Function() google,
    required TResult Function() facebook,
    required TResult Function() apple,
    required TResult Function(
            String apiKey, String apiSecretKey, String redirectURI)
        twitter,
    required TResult Function(String verificationId, String smsCode) phone,
  }) {
    return google();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? anonymous,
    TResult Function(String email, String password)? email,
    TResult Function()? google,
    TResult Function()? facebook,
    TResult Function()? apple,
    TResult Function(String apiKey, String apiSecretKey, String redirectURI)?
        twitter,
    TResult Function(String verificationId, String smsCode)? phone,
  }) {
    return google?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? anonymous,
    TResult Function(String email, String password)? email,
    TResult Function()? google,
    TResult Function()? facebook,
    TResult Function()? apple,
    TResult Function(String apiKey, String apiSecretKey, String redirectURI)?
        twitter,
    TResult Function(String verificationId, String smsCode)? phone,
    required TResult orElse(),
  }) {
    if (google != null) {
      return google();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AnonymousAuthMethod value) anonymous,
    required TResult Function(EmailAuthMethod value) email,
    required TResult Function(GoogleAuthMethod value) google,
    required TResult Function(FacebookAuthMethod value) facebook,
    required TResult Function(AppleAuthMethod value) apple,
    required TResult Function(TwitterAuthMethod value) twitter,
    required TResult Function(PhoneAuthMethod value) phone,
  }) {
    return google(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AnonymousAuthMethod value)? anonymous,
    TResult Function(EmailAuthMethod value)? email,
    TResult Function(GoogleAuthMethod value)? google,
    TResult Function(FacebookAuthMethod value)? facebook,
    TResult Function(AppleAuthMethod value)? apple,
    TResult Function(TwitterAuthMethod value)? twitter,
    TResult Function(PhoneAuthMethod value)? phone,
  }) {
    return google?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AnonymousAuthMethod value)? anonymous,
    TResult Function(EmailAuthMethod value)? email,
    TResult Function(GoogleAuthMethod value)? google,
    TResult Function(FacebookAuthMethod value)? facebook,
    TResult Function(AppleAuthMethod value)? apple,
    TResult Function(TwitterAuthMethod value)? twitter,
    TResult Function(PhoneAuthMethod value)? phone,
    required TResult orElse(),
  }) {
    if (google != null) {
      return google(this);
    }
    return orElse();
  }
}

abstract class GoogleAuthMethod extends AuthMethod {
  const factory GoogleAuthMethod() = _$GoogleAuthMethod;
  const GoogleAuthMethod._() : super._();
}

/// @nodoc
abstract class _$$FacebookAuthMethodCopyWith<$Res> {
  factory _$$FacebookAuthMethodCopyWith(_$FacebookAuthMethod value,
          $Res Function(_$FacebookAuthMethod) then) =
      __$$FacebookAuthMethodCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FacebookAuthMethodCopyWithImpl<$Res>
    extends _$AuthMethodCopyWithImpl<$Res>
    implements _$$FacebookAuthMethodCopyWith<$Res> {
  __$$FacebookAuthMethodCopyWithImpl(
      _$FacebookAuthMethod _value, $Res Function(_$FacebookAuthMethod) _then)
      : super(_value, (v) => _then(v as _$FacebookAuthMethod));

  @override
  _$FacebookAuthMethod get _value => super._value as _$FacebookAuthMethod;
}

/// @nodoc

class _$FacebookAuthMethod extends FacebookAuthMethod {
  const _$FacebookAuthMethod() : super._();

  @override
  String toString() {
    return 'AuthMethod.facebook()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FacebookAuthMethod);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() anonymous,
    required TResult Function(String email, String password) email,
    required TResult Function() google,
    required TResult Function() facebook,
    required TResult Function() apple,
    required TResult Function(
            String apiKey, String apiSecretKey, String redirectURI)
        twitter,
    required TResult Function(String verificationId, String smsCode) phone,
  }) {
    return facebook();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? anonymous,
    TResult Function(String email, String password)? email,
    TResult Function()? google,
    TResult Function()? facebook,
    TResult Function()? apple,
    TResult Function(String apiKey, String apiSecretKey, String redirectURI)?
        twitter,
    TResult Function(String verificationId, String smsCode)? phone,
  }) {
    return facebook?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? anonymous,
    TResult Function(String email, String password)? email,
    TResult Function()? google,
    TResult Function()? facebook,
    TResult Function()? apple,
    TResult Function(String apiKey, String apiSecretKey, String redirectURI)?
        twitter,
    TResult Function(String verificationId, String smsCode)? phone,
    required TResult orElse(),
  }) {
    if (facebook != null) {
      return facebook();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AnonymousAuthMethod value) anonymous,
    required TResult Function(EmailAuthMethod value) email,
    required TResult Function(GoogleAuthMethod value) google,
    required TResult Function(FacebookAuthMethod value) facebook,
    required TResult Function(AppleAuthMethod value) apple,
    required TResult Function(TwitterAuthMethod value) twitter,
    required TResult Function(PhoneAuthMethod value) phone,
  }) {
    return facebook(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AnonymousAuthMethod value)? anonymous,
    TResult Function(EmailAuthMethod value)? email,
    TResult Function(GoogleAuthMethod value)? google,
    TResult Function(FacebookAuthMethod value)? facebook,
    TResult Function(AppleAuthMethod value)? apple,
    TResult Function(TwitterAuthMethod value)? twitter,
    TResult Function(PhoneAuthMethod value)? phone,
  }) {
    return facebook?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AnonymousAuthMethod value)? anonymous,
    TResult Function(EmailAuthMethod value)? email,
    TResult Function(GoogleAuthMethod value)? google,
    TResult Function(FacebookAuthMethod value)? facebook,
    TResult Function(AppleAuthMethod value)? apple,
    TResult Function(TwitterAuthMethod value)? twitter,
    TResult Function(PhoneAuthMethod value)? phone,
    required TResult orElse(),
  }) {
    if (facebook != null) {
      return facebook(this);
    }
    return orElse();
  }
}

abstract class FacebookAuthMethod extends AuthMethod {
  const factory FacebookAuthMethod() = _$FacebookAuthMethod;
  const FacebookAuthMethod._() : super._();
}

/// @nodoc
abstract class _$$AppleAuthMethodCopyWith<$Res> {
  factory _$$AppleAuthMethodCopyWith(
          _$AppleAuthMethod value, $Res Function(_$AppleAuthMethod) then) =
      __$$AppleAuthMethodCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppleAuthMethodCopyWithImpl<$Res>
    extends _$AuthMethodCopyWithImpl<$Res>
    implements _$$AppleAuthMethodCopyWith<$Res> {
  __$$AppleAuthMethodCopyWithImpl(
      _$AppleAuthMethod _value, $Res Function(_$AppleAuthMethod) _then)
      : super(_value, (v) => _then(v as _$AppleAuthMethod));

  @override
  _$AppleAuthMethod get _value => super._value as _$AppleAuthMethod;
}

/// @nodoc

class _$AppleAuthMethod extends AppleAuthMethod {
  const _$AppleAuthMethod() : super._();

  @override
  String toString() {
    return 'AuthMethod.apple()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppleAuthMethod);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() anonymous,
    required TResult Function(String email, String password) email,
    required TResult Function() google,
    required TResult Function() facebook,
    required TResult Function() apple,
    required TResult Function(
            String apiKey, String apiSecretKey, String redirectURI)
        twitter,
    required TResult Function(String verificationId, String smsCode) phone,
  }) {
    return apple();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? anonymous,
    TResult Function(String email, String password)? email,
    TResult Function()? google,
    TResult Function()? facebook,
    TResult Function()? apple,
    TResult Function(String apiKey, String apiSecretKey, String redirectURI)?
        twitter,
    TResult Function(String verificationId, String smsCode)? phone,
  }) {
    return apple?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? anonymous,
    TResult Function(String email, String password)? email,
    TResult Function()? google,
    TResult Function()? facebook,
    TResult Function()? apple,
    TResult Function(String apiKey, String apiSecretKey, String redirectURI)?
        twitter,
    TResult Function(String verificationId, String smsCode)? phone,
    required TResult orElse(),
  }) {
    if (apple != null) {
      return apple();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AnonymousAuthMethod value) anonymous,
    required TResult Function(EmailAuthMethod value) email,
    required TResult Function(GoogleAuthMethod value) google,
    required TResult Function(FacebookAuthMethod value) facebook,
    required TResult Function(AppleAuthMethod value) apple,
    required TResult Function(TwitterAuthMethod value) twitter,
    required TResult Function(PhoneAuthMethod value) phone,
  }) {
    return apple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AnonymousAuthMethod value)? anonymous,
    TResult Function(EmailAuthMethod value)? email,
    TResult Function(GoogleAuthMethod value)? google,
    TResult Function(FacebookAuthMethod value)? facebook,
    TResult Function(AppleAuthMethod value)? apple,
    TResult Function(TwitterAuthMethod value)? twitter,
    TResult Function(PhoneAuthMethod value)? phone,
  }) {
    return apple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AnonymousAuthMethod value)? anonymous,
    TResult Function(EmailAuthMethod value)? email,
    TResult Function(GoogleAuthMethod value)? google,
    TResult Function(FacebookAuthMethod value)? facebook,
    TResult Function(AppleAuthMethod value)? apple,
    TResult Function(TwitterAuthMethod value)? twitter,
    TResult Function(PhoneAuthMethod value)? phone,
    required TResult orElse(),
  }) {
    if (apple != null) {
      return apple(this);
    }
    return orElse();
  }
}

abstract class AppleAuthMethod extends AuthMethod {
  const factory AppleAuthMethod() = _$AppleAuthMethod;
  const AppleAuthMethod._() : super._();
}

/// @nodoc
abstract class _$$TwitterAuthMethodCopyWith<$Res> {
  factory _$$TwitterAuthMethodCopyWith(
          _$TwitterAuthMethod value, $Res Function(_$TwitterAuthMethod) then) =
      __$$TwitterAuthMethodCopyWithImpl<$Res>;
  $Res call({String apiKey, String apiSecretKey, String redirectURI});
}

/// @nodoc
class __$$TwitterAuthMethodCopyWithImpl<$Res>
    extends _$AuthMethodCopyWithImpl<$Res>
    implements _$$TwitterAuthMethodCopyWith<$Res> {
  __$$TwitterAuthMethodCopyWithImpl(
      _$TwitterAuthMethod _value, $Res Function(_$TwitterAuthMethod) _then)
      : super(_value, (v) => _then(v as _$TwitterAuthMethod));

  @override
  _$TwitterAuthMethod get _value => super._value as _$TwitterAuthMethod;

  @override
  $Res call({
    Object? apiKey = freezed,
    Object? apiSecretKey = freezed,
    Object? redirectURI = freezed,
  }) {
    return _then(_$TwitterAuthMethod(
      apiKey: apiKey == freezed
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      apiSecretKey: apiSecretKey == freezed
          ? _value.apiSecretKey
          : apiSecretKey // ignore: cast_nullable_to_non_nullable
              as String,
      redirectURI: redirectURI == freezed
          ? _value.redirectURI
          : redirectURI // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TwitterAuthMethod extends TwitterAuthMethod {
  const _$TwitterAuthMethod(
      {required this.apiKey,
      required this.apiSecretKey,
      required this.redirectURI})
      : super._();

  @override
  final String apiKey;
  @override
  final String apiSecretKey;
  @override
  final String redirectURI;

  @override
  String toString() {
    return 'AuthMethod.twitter(apiKey: $apiKey, apiSecretKey: $apiSecretKey, redirectURI: $redirectURI)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TwitterAuthMethod &&
            const DeepCollectionEquality().equals(other.apiKey, apiKey) &&
            const DeepCollectionEquality()
                .equals(other.apiSecretKey, apiSecretKey) &&
            const DeepCollectionEquality()
                .equals(other.redirectURI, redirectURI));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(apiKey),
      const DeepCollectionEquality().hash(apiSecretKey),
      const DeepCollectionEquality().hash(redirectURI));

  @JsonKey(ignore: true)
  @override
  _$$TwitterAuthMethodCopyWith<_$TwitterAuthMethod> get copyWith =>
      __$$TwitterAuthMethodCopyWithImpl<_$TwitterAuthMethod>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() anonymous,
    required TResult Function(String email, String password) email,
    required TResult Function() google,
    required TResult Function() facebook,
    required TResult Function() apple,
    required TResult Function(
            String apiKey, String apiSecretKey, String redirectURI)
        twitter,
    required TResult Function(String verificationId, String smsCode) phone,
  }) {
    return twitter(apiKey, apiSecretKey, redirectURI);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? anonymous,
    TResult Function(String email, String password)? email,
    TResult Function()? google,
    TResult Function()? facebook,
    TResult Function()? apple,
    TResult Function(String apiKey, String apiSecretKey, String redirectURI)?
        twitter,
    TResult Function(String verificationId, String smsCode)? phone,
  }) {
    return twitter?.call(apiKey, apiSecretKey, redirectURI);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? anonymous,
    TResult Function(String email, String password)? email,
    TResult Function()? google,
    TResult Function()? facebook,
    TResult Function()? apple,
    TResult Function(String apiKey, String apiSecretKey, String redirectURI)?
        twitter,
    TResult Function(String verificationId, String smsCode)? phone,
    required TResult orElse(),
  }) {
    if (twitter != null) {
      return twitter(apiKey, apiSecretKey, redirectURI);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AnonymousAuthMethod value) anonymous,
    required TResult Function(EmailAuthMethod value) email,
    required TResult Function(GoogleAuthMethod value) google,
    required TResult Function(FacebookAuthMethod value) facebook,
    required TResult Function(AppleAuthMethod value) apple,
    required TResult Function(TwitterAuthMethod value) twitter,
    required TResult Function(PhoneAuthMethod value) phone,
  }) {
    return twitter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AnonymousAuthMethod value)? anonymous,
    TResult Function(EmailAuthMethod value)? email,
    TResult Function(GoogleAuthMethod value)? google,
    TResult Function(FacebookAuthMethod value)? facebook,
    TResult Function(AppleAuthMethod value)? apple,
    TResult Function(TwitterAuthMethod value)? twitter,
    TResult Function(PhoneAuthMethod value)? phone,
  }) {
    return twitter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AnonymousAuthMethod value)? anonymous,
    TResult Function(EmailAuthMethod value)? email,
    TResult Function(GoogleAuthMethod value)? google,
    TResult Function(FacebookAuthMethod value)? facebook,
    TResult Function(AppleAuthMethod value)? apple,
    TResult Function(TwitterAuthMethod value)? twitter,
    TResult Function(PhoneAuthMethod value)? phone,
    required TResult orElse(),
  }) {
    if (twitter != null) {
      return twitter(this);
    }
    return orElse();
  }
}

abstract class TwitterAuthMethod extends AuthMethod {
  const factory TwitterAuthMethod(
      {required final String apiKey,
      required final String apiSecretKey,
      required final String redirectURI}) = _$TwitterAuthMethod;
  const TwitterAuthMethod._() : super._();

  String get apiKey;
  String get apiSecretKey;
  String get redirectURI;
  @JsonKey(ignore: true)
  _$$TwitterAuthMethodCopyWith<_$TwitterAuthMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PhoneAuthMethodCopyWith<$Res> {
  factory _$$PhoneAuthMethodCopyWith(
          _$PhoneAuthMethod value, $Res Function(_$PhoneAuthMethod) then) =
      __$$PhoneAuthMethodCopyWithImpl<$Res>;
  $Res call({String verificationId, String smsCode});
}

/// @nodoc
class __$$PhoneAuthMethodCopyWithImpl<$Res>
    extends _$AuthMethodCopyWithImpl<$Res>
    implements _$$PhoneAuthMethodCopyWith<$Res> {
  __$$PhoneAuthMethodCopyWithImpl(
      _$PhoneAuthMethod _value, $Res Function(_$PhoneAuthMethod) _then)
      : super(_value, (v) => _then(v as _$PhoneAuthMethod));

  @override
  _$PhoneAuthMethod get _value => super._value as _$PhoneAuthMethod;

  @override
  $Res call({
    Object? verificationId = freezed,
    Object? smsCode = freezed,
  }) {
    return _then(_$PhoneAuthMethod(
      verificationId: verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      smsCode: smsCode == freezed
          ? _value.smsCode
          : smsCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneAuthMethod extends PhoneAuthMethod {
  const _$PhoneAuthMethod({required this.verificationId, required this.smsCode})
      : super._();

  @override
  final String verificationId;
  @override
  final String smsCode;

  @override
  String toString() {
    return 'AuthMethod.phone(verificationId: $verificationId, smsCode: $smsCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneAuthMethod &&
            const DeepCollectionEquality()
                .equals(other.verificationId, verificationId) &&
            const DeepCollectionEquality().equals(other.smsCode, smsCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(verificationId),
      const DeepCollectionEquality().hash(smsCode));

  @JsonKey(ignore: true)
  @override
  _$$PhoneAuthMethodCopyWith<_$PhoneAuthMethod> get copyWith =>
      __$$PhoneAuthMethodCopyWithImpl<_$PhoneAuthMethod>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() anonymous,
    required TResult Function(String email, String password) email,
    required TResult Function() google,
    required TResult Function() facebook,
    required TResult Function() apple,
    required TResult Function(
            String apiKey, String apiSecretKey, String redirectURI)
        twitter,
    required TResult Function(String verificationId, String smsCode) phone,
  }) {
    return phone(verificationId, smsCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? anonymous,
    TResult Function(String email, String password)? email,
    TResult Function()? google,
    TResult Function()? facebook,
    TResult Function()? apple,
    TResult Function(String apiKey, String apiSecretKey, String redirectURI)?
        twitter,
    TResult Function(String verificationId, String smsCode)? phone,
  }) {
    return phone?.call(verificationId, smsCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? anonymous,
    TResult Function(String email, String password)? email,
    TResult Function()? google,
    TResult Function()? facebook,
    TResult Function()? apple,
    TResult Function(String apiKey, String apiSecretKey, String redirectURI)?
        twitter,
    TResult Function(String verificationId, String smsCode)? phone,
    required TResult orElse(),
  }) {
    if (phone != null) {
      return phone(verificationId, smsCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AnonymousAuthMethod value) anonymous,
    required TResult Function(EmailAuthMethod value) email,
    required TResult Function(GoogleAuthMethod value) google,
    required TResult Function(FacebookAuthMethod value) facebook,
    required TResult Function(AppleAuthMethod value) apple,
    required TResult Function(TwitterAuthMethod value) twitter,
    required TResult Function(PhoneAuthMethod value) phone,
  }) {
    return phone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AnonymousAuthMethod value)? anonymous,
    TResult Function(EmailAuthMethod value)? email,
    TResult Function(GoogleAuthMethod value)? google,
    TResult Function(FacebookAuthMethod value)? facebook,
    TResult Function(AppleAuthMethod value)? apple,
    TResult Function(TwitterAuthMethod value)? twitter,
    TResult Function(PhoneAuthMethod value)? phone,
  }) {
    return phone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AnonymousAuthMethod value)? anonymous,
    TResult Function(EmailAuthMethod value)? email,
    TResult Function(GoogleAuthMethod value)? google,
    TResult Function(FacebookAuthMethod value)? facebook,
    TResult Function(AppleAuthMethod value)? apple,
    TResult Function(TwitterAuthMethod value)? twitter,
    TResult Function(PhoneAuthMethod value)? phone,
    required TResult orElse(),
  }) {
    if (phone != null) {
      return phone(this);
    }
    return orElse();
  }
}

abstract class PhoneAuthMethod extends AuthMethod {
  const factory PhoneAuthMethod(
      {required final String verificationId,
      required final String smsCode}) = _$PhoneAuthMethod;
  const PhoneAuthMethod._() : super._();

  String get verificationId;
  String get smsCode;
  @JsonKey(ignore: true)
  _$$PhoneAuthMethodCopyWith<_$PhoneAuthMethod> get copyWith =>
      throw _privateConstructorUsedError;
}
