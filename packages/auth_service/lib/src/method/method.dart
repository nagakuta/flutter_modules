import 'package:freezed_annotation/freezed_annotation.dart';

part 'method.freezed.dart';

/// AuthMethod
@freezed
class AuthMethod with _$AuthMethod {
  // ignore: public_member_api_docs
  const factory AuthMethod.anonymous() = AnonymousAuthMethod;

  // ignore: public_member_api_docs
  const factory AuthMethod.email({
    required final String email,
    required final String password,
  }) = EmailAuthMethod;

  // ignore: public_member_api_docs
  const factory AuthMethod.google() = GoogleAuthMethod;

  // ignore: public_member_api_docs
  const factory AuthMethod.facebook() = FacebookAuthMethod;

  // ignore: public_member_api_docs
  const factory AuthMethod.apple() = AppleAuthMethod;

  // ignore: public_member_api_docs
  const factory AuthMethod.twitter({
    required final String apiKey,
    required final String apiSecretKey,
    required final String redirectURI,
  }) = TwitterAuthMethod;

  // ignore: public_member_api_docs
  const factory AuthMethod.phone({
    required final String verificationId,
    required final String smsCode,
  }) = PhoneAuthMethod;

  const AuthMethod._();
}

// ignore: public_member_api_docs
extension AuthMethodExtension on AuthMethod {
  /// メソッド名
  String get name => map(
        anonymous: (final _) => "anonymous",
        email: (final _) => "email",
        google: (final _) => "google",
        facebook: (final _) => "facebook",
        apple: (final _) => "apple",
        twitter: (final _) => "twitter",
        phone: (final _) => "phone",
      );
}
