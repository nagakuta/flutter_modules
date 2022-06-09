import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod/riverpod.dart';

/// GoogleAuth Client
abstract class GoogleAuthClient {
  /// Starts the interactive sign-in process
  Future<GoogleSignInAccount?> signIn();
}

// ignore: public_member_api_docs
class GoogleAuthClientImpl implements GoogleAuthClient {
  /// ignore: public_member_api_docs
  const GoogleAuthClientImpl({
    required final GoogleSignIn googleSignIn,
  }) : _googleSignIn = googleSignIn;

  final GoogleSignIn _googleSignIn;

  @override
  Future<GoogleSignInAccount?> signIn() => _googleSignIn.signIn();
}

/// GoogleAuthClient Provider
final Provider<GoogleAuthClient> googleAuthClientProvider =
    Provider<GoogleAuthClient>(
  (final _) {
    final GoogleSignIn googleSignIn = GoogleSignIn.standard();
    return GoogleAuthClientImpl(googleSignIn: googleSignIn);
  },
);
