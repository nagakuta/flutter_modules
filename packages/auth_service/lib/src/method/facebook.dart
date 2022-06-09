import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:riverpod/riverpod.dart';

/// FacebookAuth Client
abstract class FacebookAuthClient {
  /// Make a login request using the facebook SDK
  Future<LoginResult> login({
    final List<String> permissions = const <String>['email', 'public_profile'],
    final LoginBehavior loginBehavior = LoginBehavior.dialogOnly,
  });
}

// ignore: public_member_api_docs
class FacebookAuthClientImpl implements FacebookAuthClient {
  // ignore: public_member_api_docs
  const FacebookAuthClientImpl({
    required final FacebookAuth facebookAuth,
  }) : _facebookAuth = facebookAuth;

  final FacebookAuth _facebookAuth;

  @override
  Future<LoginResult> login({
    final List<String> permissions = const <String>['email', 'public_profile'],
    final LoginBehavior loginBehavior = LoginBehavior.dialogOnly,
  }) =>
      _facebookAuth.login(
        permissions: permissions,
        loginBehavior: loginBehavior,
      );
}

/// FacebookAuthClient Provider
final Provider<FacebookAuthClient> facebookAuthClientProvider =
    Provider<FacebookAuthClient>(
  (final _) {
    final FacebookAuth facebookAuth = FacebookAuth.instance;
    return FacebookAuthClientImpl(facebookAuth: facebookAuth);
  },
);
