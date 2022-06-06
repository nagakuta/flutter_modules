import 'package:riverpod/riverpod.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

/// TwitterAuth Client
abstract class TwitterAuthClient {
  /// Logs the user Forces the user to enter their credentials to ensure
  /// the correct users account is authorized
  Future<AuthResult> login({
    required final String apiKey,
    required final String apiSecretKey,
    required final String redirectURI,
    final bool forceLogin = false,
  });
}

// ignore: public_member_api_docs
class TwitterAuthClientImpl implements TwitterAuthClient {
  // ignore: public_member_api_docs
  const TwitterAuthClientImpl();

  @override
  Future<AuthResult> login({
    required final String apiKey,
    required final String apiSecretKey,
    required final String redirectURI,
    final bool forceLogin = false,
  }) =>
      TwitterLogin(
        apiKey: apiKey,
        apiSecretKey: apiSecretKey,
        redirectURI: redirectURI,
      ).login(forceLogin: forceLogin);
}

/// TwitterAuthClient Provider
final Provider<TwitterAuthClient> twitterAuthClientProvider =
    Provider<TwitterAuthClient>(
  (final _) => const TwitterAuthClientImpl(),
);
