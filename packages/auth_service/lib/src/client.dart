import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_service/firebase_service.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

/// Auth Client
abstract class AuthClient {
  /// Returns the current [User] if they are currently signed-in,
  /// or null if not.
  User? get currentUser;

  /// Tries to create a new user account with the given email address
  /// and password.
  Future<UserCredential> createUserWithEmailAndPassword({
    required final String email,
    required final String password,
  });

  /// Notifies about changes to the user's sign-in state
  /// (such as sign-in or sign-out).
  Stream<User?> authStateChanges();

  /// Sends a password reset email to the given email address.
  Future<void> sendPasswordResetEmail({
    required final String email,
    final ActionCodeSettings? actionCodeSettings,
  });

  /// Asynchronously creates and becomes an anonymous user.
  Future<UserCredential> signInAnonymously();

  /// Asynchronously signs in to Firebase with the given 3rd-party credentials
  /// (e.g. a Facebook login Access Token, a Google ID Token/Access Token pair, etc.)
  /// and returns additional identity provider data.
  Future<UserCredential> signInWithCredential(final AuthCredential credential);

  /// Attempts to sign in a user with the given email address and password.
  Future<UserCredential> signInWithEmailAndPassword({
    required final String email,
    required final String password,
  });

  /// Signs out the current user.
  Future<void> signOut();

  /// Starts a phone number verification process for the given phone number.
  Future<void> verifyPhoneNumber({
    required final String phoneNumber,
    required final PhoneVerificationCompleted verificationCompleted,
    required final PhoneVerificationFailed verificationFailed,
    required final PhoneCodeSent codeSent,
    required final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
    final Duration timeout = const Duration(seconds: 30),
    final int? forceResendingToken,
  });
}

/// ignore: public_member_api_docs
class AuthClientImpl implements AuthClient {
  /// ignore: public_member_api_docs
  const AuthClientImpl({
    required final FirebaseAuth auth,
  }) : _auth = auth;

  final FirebaseAuth _auth;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    required final String email,
    required final String password,
  }) =>
      _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

  @override
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  @override
  Future<void> sendPasswordResetEmail({
    required final String email,
    final ActionCodeSettings? actionCodeSettings,
  }) =>
      _auth.sendPasswordResetEmail(
        email: email,
        actionCodeSettings: actionCodeSettings,
      );

  @override
  Future<UserCredential> signInAnonymously() => _auth.signInAnonymously();

  @override
  Future<UserCredential> signInWithCredential(
    final AuthCredential credential,
  ) =>
      _auth.signInWithCredential(credential);

  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required final String email,
    required final String password,
  }) =>
      _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

  @override
  Future<void> signOut() => _auth.signOut();

  @override
  Future<void> verifyPhoneNumber({
    required final String phoneNumber,
    required final PhoneVerificationCompleted verificationCompleted,
    required final PhoneVerificationFailed verificationFailed,
    required final PhoneCodeSent codeSent,
    required final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
    final Duration timeout = const Duration(seconds: 30),
    final int? forceResendingToken,
  }) =>
      _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        timeout: timeout,
        forceResendingToken: forceResendingToken,
      );
}

/// AuthClient Provider
final ProviderFamily<AuthClient, FirebaseApp?> authClientProvider =
    Provider.family(
  (
    final ProviderRef<AuthClient> ref,
    final FirebaseApp? app,
  ) {
    final FirebaseAuth auth = !kDebugMode
        ? (app != null
            ? FirebaseAuth.instanceFor(app: app)
            : FirebaseAuth.instance)
        : (app != null
            ? FirebaseAuth.instanceFor(app: app)
            : FirebaseAuth.instance)
      ..useAuthEmulator("localhost", 9099);

    return AuthClientImpl(auth: auth);
  },
);
