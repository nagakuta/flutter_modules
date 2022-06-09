import 'dart:math';

import 'package:analytics_service/analytics_service.dart';
import 'package:crashlytics_service/crashlytics_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_service/firebase_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:twitter_login/entity/auth_result.dart';

import '/src/client.dart';
import '/src/exception.dart';
import '/src/method/apple.dart';
import '/src/method/facebook.dart';
import '/src/method/google.dart';
import '/src/method/method.dart';
import '/src/method/twitter.dart';

/// Auth Service
@GenerateMocks(<Type>[AuthService, User])
class AuthService extends StateNotifier<User?> {
  /// ignore: puclic_member_api_docs
  AuthService({
    required final AuthClient authClient,
    required final GoogleAuthClient googleAuthClient,
    required final FacebookAuthClient facebookAuthClient,
    required final AppleAuthClient appleAuthClient,
    required final TwitterAuthClient twitterAuthClient,
    required final AnalyticsService analyticsService,
    required final CrashlyticsService crashlyticsService,
  })  : _authClient = authClient,
        _googleAuthClient = googleAuthClient,
        _facebookAuthClient = facebookAuthClient,
        _appleAuthClient = appleAuthClient,
        _twitterAuthClient = twitterAuthClient,
        _analyticsService = analyticsService,
        _crashlyticsService = crashlyticsService,
        super(authClient.currentUser);

  final AuthClient _authClient;
  final GoogleAuthClient _googleAuthClient;
  final FacebookAuthClient _facebookAuthClient;
  final AppleAuthClient _appleAuthClient;
  final TwitterAuthClient _twitterAuthClient;
  final AnalyticsService _analyticsService;
  final CrashlyticsService _crashlyticsService;

  /// サインアップ
  Future<void> signUp(final AuthMethod method) async {
    if (state != null) {
      throw const AuthServiceException.alreadyLoggedIn();
    }

    final UserCredential userCredential = await method.maybeWhen(
      anonymous: _authClient.signInAnonymously,
      email: (
        final String email,
        final String password,
      ) =>
          _authClient.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ),
      orElse: () async {
        final AuthCredential authCredential = await _getAuthCredential(method);
        return _authClient.signInWithCredential(authCredential);
      },
    );
    state = userCredential.user;

    _analyticsService.logSignUp(
      userId: state!.uid,
      signUpMethod: method.name,
    );
  }

  /// ログイン
  Future<void> login(final AuthMethod method) async {
    if (state != null) {
      throw const AuthServiceException.alreadyLoggedIn();
    }

    final UserCredential userCredential = await method.maybeWhen(
      anonymous: _authClient.signInAnonymously,
      email: (
        final String email,
        final String password,
      ) =>
          _authClient.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
      orElse: () async {
        final AuthCredential authCredential = await _getAuthCredential(method);
        return _authClient.signInWithCredential(authCredential);
      },
    );
    state = userCredential.user;

    _analyticsService.logLogin(
      userId: state!.uid,
      loginMethod: method.name,
    );
  }

  /// ログアウト
  Future<void> logout() async {
    if (state == null) {
      throw const AuthServiceException.notLogInYet();
    }

    final User user = state!;

    await _authClient.signOut();
    state = null;

    _analyticsService.logLogout(userId: user.uid);
  }

  /// 再認証
  Future<void> reauthenticate(final AuthMethod method) async {
    if (state == null) {
      throw const AuthServiceException.notLogInYet();
    }

    final AuthCredential authCredential = await _getAuthCredential(method);
    final UserCredential userCredential =
        await state!.reauthenticateWithCredential(authCredential);

    state = userCredential.user;

    _analyticsService.logLogin(
      userId: state!.uid,
      loginMethod: "${method.name}_reauth",
    );
  }

  /// ユーザを特定の認証方法と紐付け
  Future<void> linkWithAuthMethod(final AuthMethod method) async {
    if (state == null) {
      throw const AuthServiceException.notLogInYet();
    }

    final AuthCredential authCredential = await _getAuthCredential(method);
    final UserCredential userCredential =
        await state!.linkWithCredential(authCredential);

    state = userCredential.user;

    _analyticsService.logLogin(
      userId: state!.uid,
      loginMethod: "${method.name}_link",
    );
  }

  /// 認証用の電話番号を送信
  Future<void> verifyPhoneNumber({
    required final String phoneNumber,
    required final PhoneVerificationCompleted verificationCompleted,
    required final PhoneVerificationFailed verificationFailed,
    required final PhoneCodeSent codeSent,
    required final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
    final Duration timeout = const Duration(seconds: 30),
    final int? forceResendingToken,
  }) async {
    if (state == null) {
      throw const AuthServiceException.notLogInYet();
    }

    await _authClient.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (final PhoneAuthCredential credential) async {
        _analyticsService.logEvent(
          name: "phone_number_verification_completed",
        );

        verificationCompleted.call(credential);
      },
      verificationFailed: (final FirebaseAuthException exception) {
        _crashlyticsService.recordException(exception, StackTrace.current);
        verificationFailed.call(exception);
      },
      codeSent: (final String verificationId, final int? resendToken) {
        _analyticsService.logEvent(
          name: "sms_verify_code_sent",
          parameters: <String, dynamic>{
            "verification_id": verificationId,
            "force_resending_token": resendToken,
          },
        );

        codeSent.call(verificationId, resendToken);
      },
      codeAutoRetrievalTimeout: (final String verificationId) {
        _analyticsService.logEvent(
          name: "sms_verify_code_auto_retrieval_timeout",
          parameters: <String, dynamic>{
            "verification_id": verificationId,
          },
        );

        codeAutoRetrievalTimeout.call(verificationId);
      },
      timeout: timeout,
      forceResendingToken: forceResendingToken,
    );
  }

  /// メールアドレスを更新
  Future<void> updateEmail(final String newEmail) async {
    if (state == null) {
      throw const AuthServiceException.notLogInYet();
    }

    await state!.updateEmail(newEmail);

    _analyticsService.logEvent(name: "update_email");
  }

  /// パスワードを更新
  Future<void> updatePassword(final String newPassword) async {
    if (state == null) {
      throw const AuthServiceException.notLogInYet();
    }

    await state!.updatePassword(newPassword);

    _analyticsService.logEvent(name: "update_password");
  }

  /// パスワードリセット用のメールを指定されたアドレスに送信
  Future<void> sendPasswordResetEmail(final String email) async {
    await _authClient.sendPasswordResetEmail(email: email);
    _analyticsService.logEvent(name: "send_pass_reset_email");
  }

  /// ユーザの認証ステータスの変更を検知
  Stream<User?> authStatusChanged() =>
      _authClient.authStateChanges().asBroadcastStream()
        ..listen(
          (final User? user) => state = user,
          onError: (
            final Object error,
            final StackTrace? stackTrace,
          ) {
            _crashlyticsService.recordError(error, stackTrace);
          },
        );

  Future<AuthCredential> _getAuthCredential(final AuthMethod method) =>
      method.when(
        anonymous: () =>
            throw const AuthServiceException.failedToGetAuthCredential(),
        email: (
          final String email,
          final String password,
        ) async =>
            EmailAuthProvider.credential(
          email: email,
          password: password,
        ),
        google: () async {
          final GoogleSignInAccount? account = await _googleAuthClient.signIn();

          if (account != null) {
            final GoogleSignInAuthentication authentication =
                await account.authentication;

            return GoogleAuthProvider.credential(
              idToken: authentication.idToken,
              accessToken: authentication.accessToken,
            );
          } else {
            throw const AuthServiceException.failedToSignInWithSocialService();
          }
        },
        facebook: () async {
          final LoginResult result = await _facebookAuthClient.login();

          if (result.accessToken != null) {
            return FacebookAuthProvider.credential(result.accessToken!.token);
          } else {
            throw const AuthServiceException.failedToSignInWithSocialService();
          }
        },
        apple: () async {
          // Generate nonce
          const String charset =
              '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._'; // ignore: lines_longer_than_80_chars
          final Random random = Random.secure();
          final String rawNonce = List<String>.generate(
            32,
            (final _) => charset[random.nextInt(charset.length)],
          ).join();

          // Sign in with apple
          final AuthorizationCredentialAppleID appleCredential =
              await _appleAuthClient.getAppleIDCredential(rawNonce: rawNonce);

          return OAuthProvider("apple.com").credential(
            idToken: appleCredential.identityToken,
            rawNonce: rawNonce,
          );
        },
        twitter: (
          final String apiKey,
          final String apiSecretKey,
          final String redirectURI,
        ) async {
          final AuthResult result = await _twitterAuthClient.login(
            apiKey: apiKey,
            apiSecretKey: apiSecretKey,
            redirectURI: redirectURI,
          );

          if (result.authToken != null && result.authTokenSecret != null) {
            return TwitterAuthProvider.credential(
              accessToken: result.authToken!,
              secret: result.authTokenSecret!,
            );
          } else {
            throw const AuthServiceException.failedToSignInWithSocialService();
          }
        },
        phone: (
          final String verificationId,
          final String smsCode,
        ) async =>
            PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        ),
      );
}

/// AuthService Provider
final StateNotifierProviderFamily<AuthService, User?, FirebaseApp?>
    authServiceProvider = StateNotifierProvider.family(
  (
    final StateNotifierProviderRef<AuthService, User?> ref,
    final FirebaseApp? app,
  ) {
    final AuthClient authClient = ref.watch(authClientProvider(app));
    final GoogleAuthClient googleAuthClient =
        ref.watch(googleAuthClientProvider);
    final FacebookAuthClient facebookAuthClient =
        ref.watch(facebookAuthClientProvider);
    final AppleAuthClient appleAuthClient = ref.watch(appleAuthClientProvider);
    final TwitterAuthClient twitterAuthClient =
        ref.watch(twitterAuthClientProvider);
    final AnalyticsService analyticsService =
        ref.watch(analyticsServiceProvider(null));
    final CrashlyticsService crashlyticsService =
        ref.watch(crashlyticsServiceProvider);

    return AuthService(
      authClient: authClient,
      googleAuthClient: googleAuthClient,
      facebookAuthClient: facebookAuthClient,
      appleAuthClient: appleAuthClient,
      twitterAuthClient: twitterAuthClient,
      analyticsService: analyticsService,
      crashlyticsService: crashlyticsService,
    );
  },
);
