import 'package:freezed_annotation/freezed_annotation.dart';

part 'exception.freezed.dart';

/// AuthService Exception
@freezed
class AuthServiceException with _$AuthServiceException implements Exception {
  // ignore: public_member_api_docs
  const factory AuthServiceException.failedToSignInWithSocialService() =
      AuthFailedToSignInWithSocialServiceException;

  // ignore: public_member_api_docs
  const factory AuthServiceException.failedToGetAuthCredential() =
      AuthFailedToGetAuthCredentialException;

  // ignore: public_member_api_docs
  const factory AuthServiceException.notLogInYet() = AuthNotLogInYetException;

  // ignore: public_member_api_docs
  const factory AuthServiceException.alreadyLoggedIn() =
      AuthAlreadyLoggedInException;

  const AuthServiceException._();

  @override
  String toString() => when(
        failedToSignInWithSocialService: () =>
            "AuthServiceException: Failed to sign in with social service.",
        failedToGetAuthCredential: () =>
            "AuthServiceException: Failed to get auth credential.",
        notLogInYet: () => "AuthServiceException: Not log in yet.",
        alreadyLoggedIn: () => "AuthServiceException: Already logged in.",
      );
}
