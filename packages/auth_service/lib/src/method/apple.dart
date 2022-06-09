import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// AppleAuth Client
abstract class AppleAuthClient {
  /// Requests an Apple ID credential
  Future<AuthorizationCredentialAppleID> getAppleIDCredential({
    required final String rawNonce,
  });
}

// ignore: public_member_api_docs
class AppleAuthClientImpl implements AppleAuthClient {
  // ignore: public_member_api_docs
  const AppleAuthClientImpl();

  @override
  Future<AuthorizationCredentialAppleID> getAppleIDCredential({
    required final String rawNonce,
  }) async {
    // Generate nonce
    final List<int> rawNonceBytes = utf8.encode(rawNonce);
    final Digest rawNonceDigest = sha256.convert(rawNonceBytes);
    final String nonce = rawNonceDigest.toString();

    // Sign in with apple
    return SignInWithApple.getAppleIDCredential(
      scopes: <AppleIDAuthorizationScopes>[
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );
  }
}

/// AppleAuthClient Provider
final Provider<AppleAuthClient> appleAuthClientProvider =
    Provider<AppleAuthClient>(
  (final _) => const AppleAuthClientImpl(),
);
