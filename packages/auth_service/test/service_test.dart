import 'package:analytics_service/analytics_service.dart';
import 'package:auth_service/src/client.dart';
import 'package:auth_service/src/exception.dart';
import 'package:auth_service/src/method/apple.dart';
import 'package:auth_service/src/method/facebook.dart';
import 'package:auth_service/src/method/google.dart';
import 'package:auth_service/src/method/method.dart';
import 'package:auth_service/src/method/twitter.dart';
import 'package:auth_service/src/service.dart';
import 'package:auth_service/src/service.mocks.dart';
import 'package:crashlytics_service/crashlytics_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';

import 'client.mocks.dart';

void main() {
  group("AuthService", () {
    final MockGoogleSignInAuthentication mockGoogleSignInAuthentication =
        MockGoogleSignInAuthentication();
    final MockAccessToken mockAccessToken = MockAccessToken();
    final MockGoogleSignInAccount mockGoogleSignInAccount =
        MockGoogleSignInAccount();
    final MockLoginResult mockLoginResult = MockLoginResult();
    final MockAuthorizationCredentialAppleID
        mockAuthorizationCredentialAppleID =
        MockAuthorizationCredentialAppleID();
    final MockAuthResult mockAuthResult = MockAuthResult();
    final MockUser mockUser = MockUser();
    final MockUserCredential mockUserCredential = MockUserCredential();
    final MockAuthCredential mockAuthCredential = MockAuthCredential();
    final MockGoogleAuthClient mockGoogleAuthClient = MockGoogleAuthClient();
    final MockFacebookAuthClient mockFacebookAuthClient =
        MockFacebookAuthClient();
    final MockAppleAuthClient mockAppleAuthClient = MockAppleAuthClient();
    final MockTwitterAuthClient mockTwitterAuthClient = MockTwitterAuthClient();
    final MockAuthClient mockAuthClient = MockAuthClient();
    final MockAnalyticsService mockAnalyticsService = MockAnalyticsService();
    final MockCrashlyticsService mockCrashlyticsService =
        MockCrashlyticsService();

    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        googleAuthClientProvider.overrideWithValue(mockGoogleAuthClient),
        facebookAuthClientProvider.overrideWithValue(mockFacebookAuthClient),
        appleAuthClientProvider.overrideWithValue(mockAppleAuthClient),
        twitterAuthClientProvider.overrideWithValue(mockTwitterAuthClient),
        authClientProvider.overrideWithProvider(
          (final _) => Provider<AuthClient>(
            (final _) => mockAuthClient,
          ),
        ),
        analyticsServiceProvider.overrideWithProvider(
          (final _) => Provider<AnalyticsService>(
            (final _) => mockAnalyticsService,
          ),
        ),
        crashlyticsServiceProvider.overrideWithValue(mockCrashlyticsService),
      ],
    );

    setUp(() {
      reset(mockGoogleSignInAuthentication);
      reset(mockAccessToken);
      reset(mockGoogleSignInAccount);
      reset(mockLoginResult);
      reset(mockAuthorizationCredentialAppleID);
      reset(mockAuthResult);
      reset(mockUser);
      reset(mockUserCredential);
      reset(mockAuthCredential);
      reset(mockGoogleAuthClient);
      reset(mockFacebookAuthClient);
      reset(mockAppleAuthClient);
      reset(mockTwitterAuthClient);
      reset(mockAuthClient);
      reset(mockAnalyticsService);
      reset(mockCrashlyticsService);
      when(mockGoogleSignInAuthentication.accessToken)
          .thenReturn("TEST_ACCESS_TOKEN");
      when(mockGoogleSignInAuthentication.idToken).thenReturn("TEST_ID_TOKEN");
      when(mockAccessToken.token).thenReturn("TEST_TOKEN");
      when(
        mockGoogleSignInAccount.authentication,
      ).thenAnswer(
        (final _) async => mockGoogleSignInAuthentication,
      );
      when(mockLoginResult.accessToken).thenReturn(mockAccessToken);
      when(mockAuthorizationCredentialAppleID.identityToken)
          .thenReturn("TEST_IDENTIFY_TOKEN");
      when(mockAuthResult.authToken).thenReturn("TEST_AUTH_TOKEN");
      when(mockAuthResult.authTokenSecret).thenReturn("TEST_AUTH_TOKEN_SECRET");
      when(mockUser.uid).thenReturn("TEST_USER_ID");
      when(mockUser.email).thenReturn("TEST_EMAIL");
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockAuthClient.currentUser).thenReturn(mockUser);
    });

    group("signUp", () {
      setUp(() {
        when(mockAuthClient.currentUser).thenReturn(null);
        when(
          mockAuthClient.signInWithCredential(any),
        ).thenAnswer(
          (final _) async => mockUserCredential,
        );
      });

      test("already signed up", () async {
        when(mockAuthClient.currentUser).thenReturn(mockUser);

        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        expect(service.debugState, isNotNull);

        await expectLater(
          service.signUp(
            const EmailAuthMethod(
              email: "TEST_EMAIL",
              password: "TEST_PASSWORD",
            ),
          ),
          throwsA(
            isA<AuthServiceException>().having(
              (final AuthServiceException exception) => exception.toString(),
              "message",
              equals("AuthServiceException: Already logged in."),
            ),
          ),
        );

        expect(service.debugState, isNotNull);

        verify(
          mockAuthClient.currentUser,
        ).called(1);

        verifyNever(
          mockAuthClient.signInAnonymously(),
        );

        verifyNever(
          mockAuthClient.createUserWithEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
          ),
        );

        verifyNever(
          mockGoogleAuthClient.signIn(),
        );

        verifyNever(
          mockFacebookAuthClient.login(
            permissions: anyNamed("permissions"),
            loginBehavior: anyNamed("loginBehavior"),
          ),
        );

        verifyNever(
          mockAppleAuthClient.getAppleIDCredential(
            rawNonce: anyNamed("rawNonce"),
          ),
        );

        verifyNever(
          mockTwitterAuthClient.login(
            apiKey: anyNamed("apiKey"),
            apiSecretKey: anyNamed("apiSecretKey"),
            redirectURI: anyNamed("redirectURI"),
            forceLogin: anyNamed("forceLogin"),
          ),
        );

        verifyNever(
          mockAuthClient.signInWithCredential(any),
        );

        verifyNever(
          mockUserCredential.user,
        );
      });

      group("anonymously", () {
        setUp(() {
          when(
            mockAuthClient.signInAnonymously(),
          ).thenAnswer(
            (final _) async => mockUserCredential,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            expect(service.debugState, isNull);

            await service.signUp(const AnonymousAuthMethod());

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockAuthClient.signInAnonymously(),
                mockUserCredential.user,
              ],
            );

            verifyNever(
              mockAuthClient.signInWithCredential(any),
            );

            verifyNever(
              mockAuthClient.createUserWithEmailAndPassword(
                email: anyNamed("email"),
                password: anyNamed("password"),
              ),
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to sign in", () async {
          when(
            mockAuthClient.signInAnonymously(),
          ).thenThrow(
            Exception("MOCKED SIGN IN ANONYMOUSLY EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(const AnonymousAuthMethod()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED SIGN IN ANONYMOUSLY EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockAuthClient.signInAnonymously(),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.signInWithCredential(any),
          );

          verifyNever(
            mockAuthClient.createUserWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });
      });

      group("email and password", () {
        setUp(() {
          when(
            mockAuthClient.createUserWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          ).thenAnswer(
            (final _) async => mockUserCredential,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            expect(service.debugState, isNull);

            await service.signUp(
              const EmailAuthMethod(
                email: "TEST_EMAIL",
                password: "TEST_PASSWORD",
              ),
            );

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verify(
              mockAuthClient.createUserWithEmailAndPassword(
                email: argThat(
                  isA<String>().having(
                    (final String email) => email,
                    "email",
                    equals("TEST_EMAIL"),
                  ),
                  named: "email",
                ),
                password: argThat(
                  isA<String>().having(
                    (final String password) => password,
                    "password",
                    equals("TEST_PASSWORD"),
                  ),
                  named: "password",
                ),
              ),
            ).called(1);

            verifyNever(
              mockAuthClient.signInWithCredential(any),
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to create user with email and password", () async {
          when(
            mockAuthClient.createUserWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          ).thenThrow(
            Exception("MOCKED CREATE USER EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(
              const EmailAuthMethod(
                email: "TEST_EMAIL",
                password: "TEST_PASSWORD",
              ),
            ),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED CREATE USER EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verify(
            mockAuthClient.createUserWithEmailAndPassword(
              email: argThat(
                isA<String>().having(
                  (final String email) => email,
                  "email",
                  equals("TEST_EMAIL"),
                ),
                named: "email",
              ),
              password: argThat(
                isA<String>().having(
                  (final String password) => password,
                  "password",
                  equals("TEST_PASSWORD"),
                ),
                named: "password",
              ),
            ),
          ).called(1);

          verifyNever(
            mockAuthClient.signInWithCredential(any),
          );
        });
      });

      group("google", () {
        setUp(() {
          when(
            mockGoogleAuthClient.signIn(),
          ).thenAnswer(
            (final _) async => mockGoogleSignInAccount,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            expect(service.debugState, isNull);

            await service.signUp(const AuthMethod.google());

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockGoogleAuthClient.signIn(),
                mockAuthClient.signInWithCredential(
                  argThat(isA<GoogleAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );

            verifyNever(
              mockAuthClient.createUserWithEmailAndPassword(
                email: anyNamed("email"),
                password: anyNamed("password"),
              ),
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to get auth credential", () async {
          when(
            mockGoogleAuthClient.signIn(),
          ).thenThrow(
            Exception("MOCKED GET AUTH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(const AuthMethod.google()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET AUTH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockGoogleAuthClient.signIn(),
            ],
          );

          verifyNever(
            mockAuthClient.signInWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.createUserWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });

        test("failed to sign in with credential", () async {
          when(
            mockAuthClient.signInWithCredential(any),
          ).thenThrow(
            Exception("MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(const AuthMethod.google()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockGoogleAuthClient.signIn(),
              mockAuthClient.signInWithCredential(
                argThat(isA<GoogleAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.createUserWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });
      });

      group("facebook", () {
        setUp(() {
          when(
            mockFacebookAuthClient.login(
              permissions: anyNamed("permissions"),
              loginBehavior: anyNamed("loginBehavior"),
            ),
          ).thenAnswer(
            (final _) async => mockLoginResult,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            expect(service.debugState, isNull);

            await service.signUp(const AuthMethod.facebook());

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockFacebookAuthClient.login(
                  permissions: argThat(
                    isA<List<String>>().having(
                      (final List<String> permissions) => permissions,
                      "permissions",
                      containsAll(<String>['email', 'public_profile']),
                    ),
                    named: "permissions",
                  ),
                  loginBehavior: argThat(
                    isA<LoginBehavior>().having(
                      (final LoginBehavior loginBehavior) => loginBehavior,
                      "loginBehavior",
                      equals(LoginBehavior.dialogOnly),
                    ),
                    named: "loginBehavior",
                  ),
                ),
                mockAuthClient.signInWithCredential(
                  argThat(isA<FacebookAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );

            verifyNever(
              mockAuthClient.createUserWithEmailAndPassword(
                email: anyNamed("email"),
                password: anyNamed("password"),
              ),
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to get auth credential", () async {
          when(
            mockFacebookAuthClient.login(
              permissions: anyNamed("permissions"),
              loginBehavior: anyNamed("loginBehavior"),
            ),
          ).thenThrow(
            Exception("MOCKED GET AUTH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(const AuthMethod.facebook()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET AUTH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockFacebookAuthClient.login(
                permissions: argThat(
                  isA<List<String>>().having(
                    (final List<String> permissions) => permissions,
                    "permissions",
                    containsAll(<String>['email', 'public_profile']),
                  ),
                  named: "permissions",
                ),
                loginBehavior: argThat(
                  isA<LoginBehavior>().having(
                    (final LoginBehavior loginBehavior) => loginBehavior,
                    "loginBehavior",
                    equals(LoginBehavior.dialogOnly),
                  ),
                  named: "loginBehavior",
                ),
              ),
            ],
          );

          verifyNever(
            mockAuthClient.signInWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.createUserWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });

        test("failed to sign in with credential", () async {
          when(
            mockAuthClient.signInWithCredential(any),
          ).thenThrow(
            Exception("MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(const AuthMethod.facebook()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockFacebookAuthClient.login(
                permissions: argThat(
                  isA<List<String>>().having(
                    (final List<String> permissions) => permissions,
                    "permissions",
                    containsAll(<String>['email', 'public_profile']),
                  ),
                  named: "permissions",
                ),
                loginBehavior: argThat(
                  isA<LoginBehavior>().having(
                    (final LoginBehavior loginBehavior) => loginBehavior,
                    "loginBehavior",
                    equals(LoginBehavior.dialogOnly),
                  ),
                  named: "loginBehavior",
                ),
              ),
              mockAuthClient.signInWithCredential(
                argThat(isA<FacebookAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.createUserWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });
      });

      group("apple", () {
        setUp(() {
          when(
            mockAppleAuthClient.getAppleIDCredential(
              rawNonce: anyNamed("rawNonce"),
            ),
          ).thenAnswer(
            (final _) async => mockAuthorizationCredentialAppleID,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            expect(service.debugState, isNull);

            await service.signUp(const AppleAuthMethod());

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockAppleAuthClient.getAppleIDCredential(
                  rawNonce: argThat(
                    isA<String>().having(
                      (final String rawNonce) => rawNonce,
                      "rawNonce",
                      isNotEmpty,
                    ),
                    named: "rawNonce",
                  ),
                ),
                mockAuthClient.signInWithCredential(
                  argThat(
                    isA<OAuthCredential>().having(
                      (final OAuthCredential credential) =>
                          credential.providerId,
                      "credential.providerId",
                      equals("apple.com"),
                    ),
                  ),
                ),
                mockUserCredential.user,
              ],
            );

            verifyNever(
              mockAuthClient.createUserWithEmailAndPassword(
                email: anyNamed("email"),
                password: anyNamed("password"),
              ),
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to get auth credential", () async {
          when(
            mockAppleAuthClient.getAppleIDCredential(
              rawNonce: anyNamed("rawNonce"),
            ),
          ).thenThrow(
            Exception("MOCKED GET AUTH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(const AppleAuthMethod()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET AUTH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockAppleAuthClient.getAppleIDCredential(
                rawNonce: argThat(
                  isA<String>().having(
                    (final String rawNonce) => rawNonce,
                    "rawNonce",
                    isNotEmpty,
                  ),
                  named: "rawNonce",
                ),
              ),
            ],
          );

          verifyNever(
            mockAuthClient.signInWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.createUserWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });

        test("failed to sign in with credential", () async {
          when(
            mockAuthClient.signInWithCredential(any),
          ).thenThrow(
            Exception("MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(const AppleAuthMethod()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockAppleAuthClient.getAppleIDCredential(
                rawNonce: argThat(
                  isA<String>().having(
                    (final String rawNonce) => rawNonce,
                    "rawNonce",
                    isNotEmpty,
                  ),
                  named: "rawNonce",
                ),
              ),
              mockAuthClient.signInWithCredential(
                argThat(
                  isA<OAuthCredential>().having(
                    (final OAuthCredential credential) => credential.providerId,
                    "credential.providerId",
                    equals("apple.com"),
                  ),
                ),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.createUserWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });
      });

      group("twitter", () {
        setUp(() {
          when(
            mockTwitterAuthClient.login(
              apiKey: anyNamed("apiKey"),
              apiSecretKey: anyNamed("apiSecretKey"),
              redirectURI: anyNamed("redirectURI"),
              forceLogin: anyNamed("forceLogin"),
            ),
          ).thenAnswer(
            (final _) async => mockAuthResult,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            expect(service.debugState, isNull);

            await service.signUp(
              const AuthMethod.twitter(
                apiKey: "TEST_API_KEY",
                apiSecretKey: "TEST_API_SECRET_KEY",
                redirectURI: "TEST_REDIRECT_URI",
              ),
            );

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockTwitterAuthClient.login(
                  apiKey: argThat(
                    isA<String>().having(
                      (final String apiKey) => apiKey,
                      "apiKey",
                      equals("TEST_API_KEY"),
                    ),
                    named: "apiKey",
                  ),
                  apiSecretKey: argThat(
                    isA<String>().having(
                      (final String apiSecretKey) => apiSecretKey,
                      "apiSecretKey",
                      equals("TEST_API_SECRET_KEY"),
                    ),
                    named: "apiSecretKey",
                  ),
                  redirectURI: argThat(
                    isA<String>().having(
                      (final String redirectURI) => redirectURI,
                      "redirectURI",
                      equals("TEST_REDIRECT_URI"),
                    ),
                    named: "redirectURI",
                  ),
                  forceLogin: argThat(
                    isA<bool>().having(
                      (final bool forceLogin) => forceLogin,
                      "forceLogin",
                      isFalse,
                    ),
                    named: "forceLogin",
                  ),
                ),
                mockAuthClient.signInWithCredential(
                  argThat(isA<TwitterAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );

            verifyNever(
              mockAuthClient.createUserWithEmailAndPassword(
                email: anyNamed("email"),
                password: anyNamed("password"),
              ),
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to get auth credential", () async {
          when(
            mockTwitterAuthClient.login(
              apiKey: anyNamed("apiKey"),
              apiSecretKey: anyNamed("apiSecretKey"),
              redirectURI: anyNamed("redirectURI"),
              forceLogin: anyNamed("forceLogin"),
            ),
          ).thenThrow(
            Exception("MOCKED GET AUTH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(
              const AuthMethod.twitter(
                apiKey: "TEST_API_KEY",
                apiSecretKey: "TEST_API_SECRET_KEY",
                redirectURI: "TEST_REDIRECT_URI",
              ),
            ),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET AUTH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockTwitterAuthClient.login(
                apiKey: argThat(
                  isA<String>().having(
                    (final String apiKey) => apiKey,
                    "apiKey",
                    equals("TEST_API_KEY"),
                  ),
                  named: "apiKey",
                ),
                apiSecretKey: argThat(
                  isA<String>().having(
                    (final String apiSecretKey) => apiSecretKey,
                    "apiSecretKey",
                    equals("TEST_API_SECRET_KEY"),
                  ),
                  named: "apiSecretKey",
                ),
                redirectURI: argThat(
                  isA<String>().having(
                    (final String redirectURI) => redirectURI,
                    "redirectURI",
                    equals("TEST_REDIRECT_URI"),
                  ),
                  named: "redirectURI",
                ),
                forceLogin: argThat(
                  isA<bool>().having(
                    (final bool forceLogin) => forceLogin,
                    "forceLogin",
                    isFalse,
                  ),
                  named: "forceLogin",
                ),
              ),
            ],
          );

          verifyNever(
            mockAuthClient.signInWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.createUserWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });

        test("failed to sign in with credential", () async {
          when(
            mockAuthClient.signInWithCredential(any),
          ).thenThrow(
            Exception("MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(
              const AuthMethod.twitter(
                apiKey: "TEST_API_KEY",
                apiSecretKey: "TEST_API_SECRET_KEY",
                redirectURI: "TEST_REDIRECT_URI",
              ),
            ),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockTwitterAuthClient.login(
                apiKey: argThat(
                  isA<String>().having(
                    (final String apiKey) => apiKey,
                    "apiKey",
                    equals("TEST_API_KEY"),
                  ),
                  named: "apiKey",
                ),
                apiSecretKey: argThat(
                  isA<String>().having(
                    (final String apiSecretKey) => apiSecretKey,
                    "apiSecretKey",
                    equals("TEST_API_SECRET_KEY"),
                  ),
                  named: "apiSecretKey",
                ),
                redirectURI: argThat(
                  isA<String>().having(
                    (final String redirectURI) => redirectURI,
                    "redirectURI",
                    equals("TEST_REDIRECT_URI"),
                  ),
                  named: "redirectURI",
                ),
                forceLogin: argThat(
                  isA<bool>().having(
                    (final bool forceLogin) => forceLogin,
                    "forceLogin",
                    isFalse,
                  ),
                  named: "forceLogin",
                ),
              ),
              mockAuthClient.signInWithCredential(
                argThat(isA<TwitterAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.createUserWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });
      });

      group("phone", () {
        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            expect(service.debugState, isNull);

            await service.signUp(
              const AuthMethod.phone(
                verificationId: "TEST_VERIFICATION_ID",
                smsCode: "TEST_SMS_CODE",
              ),
            );

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockAuthClient.signInWithCredential(
                  argThat(isA<PhoneAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );

            verifyNever(
              mockAuthClient.createUserWithEmailAndPassword(
                email: anyNamed("email"),
                password: anyNamed("password"),
              ),
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to sign in with credential", () async {
          when(
            mockAuthClient.signInWithCredential(any),
          ).thenThrow(
            Exception("MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(
              const AuthMethod.phone(
                verificationId: "TEST_VERIFICATION_ID",
                smsCode: "TEST_SMS_CODE",
              ),
            ),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockAuthClient.signInWithCredential(
                argThat(isA<PhoneAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.createUserWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });
      });
    });

    group("login", () {
      setUp(() {
        when(mockAuthClient.currentUser).thenReturn(null);
        when(
          mockAuthClient.signInWithCredential(any),
        ).thenAnswer(
          (final _) async => mockUserCredential,
        );
      });

      test("already logged in", () async {
        when(mockAuthClient.currentUser).thenReturn(mockUser);

        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        expect(service.debugState, isNotNull);

        await expectLater(
          service.login(
            const EmailAuthMethod(
              email: "TEST_EMAIL",
              password: "TEST_PASSWORD",
            ),
          ),
          throwsA(
            isA<AuthServiceException>().having(
              (final AuthServiceException exception) => exception.toString(),
              "message",
              equals("AuthServiceException: Already logged in."),
            ),
          ),
        );

        expect(service.debugState, isNotNull);

        verify(
          mockAuthClient.currentUser,
        ).called(1);

        verifyNever(
          mockAuthClient.signInAnonymously(),
        );

        verifyNever(
          mockAuthClient.signInWithEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
          ),
        );

        verifyNever(
          mockGoogleAuthClient.signIn(),
        );

        verifyNever(
          mockFacebookAuthClient.login(
            permissions: anyNamed("permissions"),
            loginBehavior: anyNamed("loginBehavior"),
          ),
        );

        verifyNever(
          mockAppleAuthClient.getAppleIDCredential(
            rawNonce: anyNamed("rawNonce"),
          ),
        );

        verifyNever(
          mockTwitterAuthClient.login(
            apiKey: anyNamed("apiKey"),
            apiSecretKey: anyNamed("apiSecretKey"),
            redirectURI: anyNamed("redirectURI"),
            forceLogin: anyNamed("forceLogin"),
          ),
        );

        verifyNever(
          mockAuthClient.signInWithCredential(any),
        );

        verifyNever(
          mockUserCredential.user,
        );
      });

      group("anonymously", () {
        setUp(() {
          when(
            mockAuthClient.signInAnonymously(),
          ).thenAnswer(
            (final _) async => mockUserCredential,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            expect(service.debugState, isNull);

            await service.signUp(const AnonymousAuthMethod());

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockAuthClient.signInAnonymously(),
                mockUserCredential.user,
              ],
            );

            verifyNever(
              mockAuthClient.signInWithCredential(any),
            );

            verifyNever(
              mockAuthClient.signInWithEmailAndPassword(
                email: anyNamed("email"),
                password: anyNamed("password"),
              ),
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to sign in", () async {
          when(
            mockAuthClient.signInAnonymously(),
          ).thenThrow(
            Exception("MOCKED SIGN IN ANONYMOUSLY EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(const AnonymousAuthMethod()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED SIGN IN ANONYMOUSLY EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockAuthClient.signInAnonymously(),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.signInWithCredential(any),
          );

          verifyNever(
            mockAuthClient.signInWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });
      });

      group("email and password", () {
        setUp(() {
          when(
            mockAuthClient.signInWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          ).thenAnswer(
            (final _) async => mockUserCredential,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            expect(service.debugState, isNull);

            await service.login(
              const EmailAuthMethod(
                email: "TEST_EMAIL",
                password: "TEST_PASSWORD",
              ),
            );

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verify(
              mockAuthClient.signInWithEmailAndPassword(
                email: argThat(
                  isA<String>().having(
                    (final String email) => email,
                    "email",
                    equals("TEST_EMAIL"),
                  ),
                  named: "email",
                ),
                password: argThat(
                  isA<String>().having(
                    (final String password) => password,
                    "password",
                    equals("TEST_PASSWORD"),
                  ),
                  named: "password",
                ),
              ),
            ).called(1);

            verifyNever(
              mockAuthClient.signInWithCredential(any),
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to sign in with email and password", () async {
          when(
            mockAuthClient.signInWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          ).thenThrow(
            Exception("MOCKED CREATE USER EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.login(
              const EmailAuthMethod(
                email: "TEST_EMAIL",
                password: "TEST_PASSWORD",
              ),
            ),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED CREATE USER EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verify(
            mockAuthClient.signInWithEmailAndPassword(
              email: argThat(
                isA<String>().having(
                  (final String email) => email,
                  "email",
                  equals("TEST_EMAIL"),
                ),
                named: "email",
              ),
              password: argThat(
                isA<String>().having(
                  (final String password) => password,
                  "password",
                  equals("TEST_PASSWORD"),
                ),
                named: "password",
              ),
            ),
          ).called(1);

          verifyNever(
            mockAuthClient.signInWithCredential(any),
          );
        });
      });

      group("google", () {
        setUp(() {
          when(
            mockGoogleAuthClient.signIn(),
          ).thenAnswer(
            (final _) async => mockGoogleSignInAccount,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            expect(service.debugState, isNull);

            await service.signUp(const AuthMethod.google());

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockGoogleAuthClient.signIn(),
                mockAuthClient.signInWithCredential(
                  argThat(isA<GoogleAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );

            verifyNever(
              mockAuthClient.createUserWithEmailAndPassword(
                email: anyNamed("email"),
                password: anyNamed("password"),
              ),
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to get auth credential", () async {
          when(
            mockGoogleAuthClient.signIn(),
          ).thenThrow(
            Exception("MOCKED GET AUTH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(const AuthMethod.google()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET AUTH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockGoogleAuthClient.signIn(),
            ],
          );

          verifyNever(
            mockAuthClient.signInWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.createUserWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });

        test("failed to sign in with credential", () async {
          when(
            mockAuthClient.signInWithCredential(any),
          ).thenThrow(
            Exception("MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(const AuthMethod.google()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockGoogleAuthClient.signIn(),
              mockAuthClient.signInWithCredential(
                argThat(isA<GoogleAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.createUserWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });
      });

      group("facebook", () {
        setUp(() {
          when(
            mockFacebookAuthClient.login(
              permissions: anyNamed("permissions"),
              loginBehavior: anyNamed("loginBehavior"),
            ),
          ).thenAnswer(
            (final _) async => mockLoginResult,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            expect(service.debugState, isNull);

            await service.signUp(const AuthMethod.facebook());

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockFacebookAuthClient.login(
                  permissions: argThat(
                    isA<List<String>>().having(
                      (final List<String> permissions) => permissions,
                      "permissions",
                      containsAll(<String>['email', 'public_profile']),
                    ),
                    named: "permissions",
                  ),
                  loginBehavior: argThat(
                    isA<LoginBehavior>().having(
                      (final LoginBehavior loginBehavior) => loginBehavior,
                      "loginBehavior",
                      equals(LoginBehavior.dialogOnly),
                    ),
                    named: "loginBehavior",
                  ),
                ),
                mockAuthClient.signInWithCredential(
                  argThat(isA<FacebookAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );

            verifyNever(
              mockAuthClient.createUserWithEmailAndPassword(
                email: anyNamed("email"),
                password: anyNamed("password"),
              ),
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to get auth credential", () async {
          when(
            mockFacebookAuthClient.login(
              permissions: anyNamed("permissions"),
              loginBehavior: anyNamed("loginBehavior"),
            ),
          ).thenThrow(
            Exception("MOCKED GET AUTH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(const AuthMethod.facebook()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET AUTH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockFacebookAuthClient.login(
                permissions: argThat(
                  isA<List<String>>().having(
                    (final List<String> permissions) => permissions,
                    "permissions",
                    containsAll(<String>['email', 'public_profile']),
                  ),
                  named: "permissions",
                ),
                loginBehavior: argThat(
                  isA<LoginBehavior>().having(
                    (final LoginBehavior loginBehavior) => loginBehavior,
                    "loginBehavior",
                    equals(LoginBehavior.dialogOnly),
                  ),
                  named: "loginBehavior",
                ),
              ),
            ],
          );

          verifyNever(
            mockAuthClient.signInWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.createUserWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });

        test("failed to sign in with credential", () async {
          when(
            mockAuthClient.signInWithCredential(any),
          ).thenThrow(
            Exception("MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(const AuthMethod.facebook()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockFacebookAuthClient.login(
                permissions: argThat(
                  isA<List<String>>().having(
                    (final List<String> permissions) => permissions,
                    "permissions",
                    containsAll(<String>['email', 'public_profile']),
                  ),
                  named: "permissions",
                ),
                loginBehavior: argThat(
                  isA<LoginBehavior>().having(
                    (final LoginBehavior loginBehavior) => loginBehavior,
                    "loginBehavior",
                    equals(LoginBehavior.dialogOnly),
                  ),
                  named: "loginBehavior",
                ),
              ),
              mockAuthClient.signInWithCredential(
                argThat(isA<FacebookAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.createUserWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });
      });

      group("apple", () {
        setUp(() {
          when(
            mockAppleAuthClient.getAppleIDCredential(
              rawNonce: anyNamed("rawNonce"),
            ),
          ).thenAnswer(
            (final _) async => mockAuthorizationCredentialAppleID,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            expect(service.debugState, isNull);

            await service.signUp(const AppleAuthMethod());

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockAppleAuthClient.getAppleIDCredential(
                  rawNonce: argThat(
                    isA<String>().having(
                      (final String rawNonce) => rawNonce,
                      "rawNonce",
                      isNotEmpty,
                    ),
                    named: "rawNonce",
                  ),
                ),
                mockAuthClient.signInWithCredential(
                  argThat(
                    isA<OAuthCredential>().having(
                      (final OAuthCredential credential) =>
                          credential.providerId,
                      "credential.providerId",
                      equals("apple.com"),
                    ),
                  ),
                ),
                mockUserCredential.user,
              ],
            );

            verifyNever(
              mockAuthClient.signInWithEmailAndPassword(
                email: anyNamed("email"),
                password: anyNamed("password"),
              ),
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to get auth credential", () async {
          when(
            mockAppleAuthClient.getAppleIDCredential(
              rawNonce: anyNamed("rawNonce"),
            ),
          ).thenThrow(
            Exception("MOCKED GET AUTH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(const AppleAuthMethod()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET AUTH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockAppleAuthClient.getAppleIDCredential(
                rawNonce: argThat(
                  isA<String>().having(
                    (final String rawNonce) => rawNonce,
                    "rawNonce",
                    isNotEmpty,
                  ),
                  named: "rawNonce",
                ),
              ),
            ],
          );

          verifyNever(
            mockAuthClient.signInWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.signInWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });

        test("failed to sign in with credential", () async {
          when(
            mockAuthClient.signInWithCredential(any),
          ).thenThrow(
            Exception("MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(const AppleAuthMethod()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockAppleAuthClient.getAppleIDCredential(
                rawNonce: argThat(
                  isA<String>().having(
                    (final String rawNonce) => rawNonce,
                    "rawNonce",
                    isNotEmpty,
                  ),
                  named: "rawNonce",
                ),
              ),
              mockAuthClient.signInWithCredential(
                argThat(
                  isA<OAuthCredential>().having(
                    (final OAuthCredential credential) => credential.providerId,
                    "credential.providerId",
                    equals("apple.com"),
                  ),
                ),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.signInWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });
      });

      group("twitter", () {
        setUp(() {
          when(
            mockTwitterAuthClient.login(
              apiKey: anyNamed("apiKey"),
              apiSecretKey: anyNamed("apiSecretKey"),
              redirectURI: anyNamed("redirectURI"),
              forceLogin: anyNamed("forceLogin"),
            ),
          ).thenAnswer(
            (final _) async => mockAuthResult,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            expect(service.debugState, isNull);

            await service.signUp(
              const AuthMethod.twitter(
                apiKey: "TEST_API_KEY",
                apiSecretKey: "TEST_API_SECRET_KEY",
                redirectURI: "TEST_REDIRECT_URI",
              ),
            );

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockTwitterAuthClient.login(
                  apiKey: argThat(
                    isA<String>().having(
                      (final String apiKey) => apiKey,
                      "apiKey",
                      equals("TEST_API_KEY"),
                    ),
                    named: "apiKey",
                  ),
                  apiSecretKey: argThat(
                    isA<String>().having(
                      (final String apiSecretKey) => apiSecretKey,
                      "apiSecretKey",
                      equals("TEST_API_SECRET_KEY"),
                    ),
                    named: "apiSecretKey",
                  ),
                  redirectURI: argThat(
                    isA<String>().having(
                      (final String redirectURI) => redirectURI,
                      "redirectURI",
                      equals("TEST_REDIRECT_URI"),
                    ),
                    named: "redirectURI",
                  ),
                  forceLogin: argThat(
                    isA<bool>().having(
                      (final bool forceLogin) => forceLogin,
                      "forceLogin",
                      isFalse,
                    ),
                    named: "forceLogin",
                  ),
                ),
                mockAuthClient.signInWithCredential(
                  argThat(isA<TwitterAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );

            verifyNever(
              mockAuthClient.signInWithEmailAndPassword(
                email: anyNamed("email"),
                password: anyNamed("password"),
              ),
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to get auth credential", () async {
          when(
            mockTwitterAuthClient.login(
              apiKey: anyNamed("apiKey"),
              apiSecretKey: anyNamed("apiSecretKey"),
              redirectURI: anyNamed("redirectURI"),
              forceLogin: anyNamed("forceLogin"),
            ),
          ).thenThrow(
            Exception("MOCKED GET AUTH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(
              const AuthMethod.twitter(
                apiKey: "TEST_API_KEY",
                apiSecretKey: "TEST_API_SECRET_KEY",
                redirectURI: "TEST_REDIRECT_URI",
              ),
            ),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET AUTH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockTwitterAuthClient.login(
                apiKey: argThat(
                  isA<String>().having(
                    (final String apiKey) => apiKey,
                    "apiKey",
                    equals("TEST_API_KEY"),
                  ),
                  named: "apiKey",
                ),
                apiSecretKey: argThat(
                  isA<String>().having(
                    (final String apiSecretKey) => apiSecretKey,
                    "apiSecretKey",
                    equals("TEST_API_SECRET_KEY"),
                  ),
                  named: "apiSecretKey",
                ),
                redirectURI: argThat(
                  isA<String>().having(
                    (final String redirectURI) => redirectURI,
                    "redirectURI",
                    equals("TEST_REDIRECT_URI"),
                  ),
                  named: "redirectURI",
                ),
                forceLogin: argThat(
                  isA<bool>().having(
                    (final bool forceLogin) => forceLogin,
                    "forceLogin",
                    isFalse,
                  ),
                  named: "forceLogin",
                ),
              ),
            ],
          );

          verifyNever(
            mockAuthClient.signInWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.signInWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });

        test("failed to sign in with credential", () async {
          when(
            mockAuthClient.signInWithCredential(any),
          ).thenThrow(
            Exception("MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(
              const AuthMethod.twitter(
                apiKey: "TEST_API_KEY",
                apiSecretKey: "TEST_API_SECRET_KEY",
                redirectURI: "TEST_REDIRECT_URI",
              ),
            ),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockTwitterAuthClient.login(
                apiKey: argThat(
                  isA<String>().having(
                    (final String apiKey) => apiKey,
                    "apiKey",
                    equals("TEST_API_KEY"),
                  ),
                  named: "apiKey",
                ),
                apiSecretKey: argThat(
                  isA<String>().having(
                    (final String apiSecretKey) => apiSecretKey,
                    "apiSecretKey",
                    equals("TEST_API_SECRET_KEY"),
                  ),
                  named: "apiSecretKey",
                ),
                redirectURI: argThat(
                  isA<String>().having(
                    (final String redirectURI) => redirectURI,
                    "redirectURI",
                    equals("TEST_REDIRECT_URI"),
                  ),
                  named: "redirectURI",
                ),
                forceLogin: argThat(
                  isA<bool>().having(
                    (final bool forceLogin) => forceLogin,
                    "forceLogin",
                    isFalse,
                  ),
                  named: "forceLogin",
                ),
              ),
              mockAuthClient.signInWithCredential(
                argThat(isA<TwitterAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.signInWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });
      });

      group("phone", () {
        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            expect(service.debugState, isNull);

            await service.signUp(
              const AuthMethod.phone(
                verificationId: "TEST_VERIFICATION_ID",
                smsCode: "TEST_SMS_CODE",
              ),
            );

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockAuthClient.signInWithCredential(
                  argThat(isA<PhoneAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );

            verifyNever(
              mockAuthClient.signInWithEmailAndPassword(
                email: anyNamed("email"),
                password: anyNamed("password"),
              ),
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to sign in with credential", () async {
          when(
            mockAuthClient.signInWithCredential(any),
          ).thenThrow(
            Exception("MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          expect(service.debugState, isNull);

          await expectLater(
            service.signUp(
              const AuthMethod.phone(
                verificationId: "TEST_VERIFICATION_ID",
                smsCode: "TEST_SMS_CODE",
              ),
            ),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockAuthClient.signInWithCredential(
                argThat(isA<PhoneAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );

          verifyNever(
            mockAuthClient.signInWithEmailAndPassword(
              email: anyNamed("email"),
              password: anyNamed("password"),
            ),
          );
        });
      });
    });

    group("logout", () {
      setUp(() {
        when(
          mockAuthClient.signOut(),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("not log in yet", () async {
        when(mockAuthClient.currentUser).thenReturn(null);

        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        expect(service.debugState, isNull);

        await expectLater(
          service.logout(),
          throwsA(
            isA<AuthServiceException>().having(
              (final AuthServiceException exception) => exception.toString(),
              "message",
              equals("AuthServiceException: Not log in yet."),
            ),
          ),
        );

        expect(service.debugState, isNull);

        verify(
          mockAuthClient.currentUser,
        ).called(1);

        verifyNever(
          mockAuthClient.signOut(),
        );
      });

      test("succeed", () async {
        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        try {
          expect(service.debugState, isNotNull);

          await service.logout();

          expect(service.debugState, isNull);

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockAuthClient.signOut(),
            ],
          );
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed to logout", () async {
        when(
          mockAuthClient.signOut(),
        ).thenThrow(
          Exception("MOCKED SIGN OUT EXCEPTION"),
        );

        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        expect(service.debugState, isNotNull);

        await expectLater(
          service.logout(),
          throwsA(
            isException.having(
              (final Exception exception) => exception.toString(),
              "message",
              equals("Exception: MOCKED SIGN OUT EXCEPTION"),
            ),
          ),
        );

        expect(service.debugState, isNotNull);

        verifyInOrder(
          <Object?>[
            mockAuthClient.currentUser,
            mockAuthClient.signOut(),
          ],
        );
      });
    });

    group("reauthenticate", () {
      setUp(() {
        when(
          mockUser.reauthenticateWithCredential(any),
        ).thenAnswer(
          (final _) async => mockUserCredential,
        );
      });

      test("not log in yet", () async {
        when(mockAuthClient.currentUser).thenReturn(null);

        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        await expectLater(
          service.reauthenticate(const AuthMethod.anonymous()),
          throwsA(
            isA<AuthServiceException>().having(
              (final AuthServiceException exception) => exception.toString(),
              "message",
              equals("AuthServiceException: Not log in yet."),
            ),
          ),
        );

        verify(
          mockAuthClient.currentUser,
        ).called(1);

        verifyNever(
          mockAuthClient.signInAnonymously(),
        );

        verifyNever(
          mockAuthClient.signInWithEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
          ),
        );

        verifyNever(
          mockGoogleAuthClient.signIn(),
        );

        verifyNever(
          mockFacebookAuthClient.login(
            permissions: anyNamed("permissions"),
            loginBehavior: anyNamed("loginBehavior"),
          ),
        );

        verifyNever(
          mockAppleAuthClient.getAppleIDCredential(
            rawNonce: anyNamed("rawNonce"),
          ),
        );

        verifyNever(
          mockTwitterAuthClient.login(
            apiKey: anyNamed("apiKey"),
            apiSecretKey: anyNamed("apiSecretKey"),
            redirectURI: anyNamed("redirectURI"),
            forceLogin: anyNamed("forceLogin"),
          ),
        );

        verifyNever(
          mockUser.reauthenticateWithCredential(any),
        );

        verifyNever(
          mockUserCredential.user,
        );
      });

      group("anonymously", () {
        test("throws exception", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.reauthenticate(const AuthMethod.anonymous()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("AuthServiceException: Failed to get auth credential."),
              ),
            ),
          );

          verifyNever(
            mockUser.reauthenticateWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );
        });
      });

      group("email and password", () {
        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            await service.reauthenticate(
              const AuthMethod.email(
                email: "TEST_EMAIL",
                password: "TEST_PASSWORD",
              ),
            );

            verifyInOrder(
              <Object?>[
                mockUser.reauthenticateWithCredential(
                  argThat(isA<EmailAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to reauthenticate with credentials", () async {
          when(
            mockUser.reauthenticateWithCredential(any),
          ).thenThrow(
            Exception("MOCKED REAUTHENTICATE WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.reauthenticate(
              const AuthMethod.email(
                email: "TEST_EMAIL",
                password: "TEST_PASSWORD",
              ),
            ),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REAUTHENTICATE WITH CREDENTIAL EXCEPTION",
                ),
              ),
            ),
          );

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockUser.reauthenticateWithCredential(
                argThat(isA<EmailAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );
        });
      });

      group("google", () {
        setUp(() {
          when(
            mockGoogleAuthClient.signIn(),
          ).thenAnswer(
            (final _) async => mockGoogleSignInAccount,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            await service.reauthenticate(const AuthMethod.google());

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockGoogleAuthClient.signIn(),
                mockUser.reauthenticateWithCredential(
                  argThat(isA<GoogleAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to get auth credentials", () async {
          when(
            mockGoogleAuthClient.signIn(),
          ).thenThrow(
            Exception("MOCKED GET AUTH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.reauthenticate(const AuthMethod.google()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET AUTH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockGoogleAuthClient.signIn(),
            ],
          );

          verifyNever(
            mockUser.reauthenticateWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );
        });

        test("failed to reauthenticate with credentials", () async {
          when(
            mockUser.reauthenticateWithCredential(any),
          ).thenThrow(
            Exception("MOCKED REAUTHENTICATE WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.reauthenticate(const AuthMethod.google()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REAUTHENTICATE WITH CREDENTIAL EXCEPTION",
                ),
              ),
            ),
          );

          expect(service.debugState, isNotNull);
          expect(service.debugState?.uid, equals("TEST_USER_ID"));

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockGoogleAuthClient.signIn(),
              mockUser.reauthenticateWithCredential(
                argThat(isA<GoogleAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );
        });
      });

      group("facebook", () {
        setUp(() {
          when(
            mockFacebookAuthClient.login(
              permissions: anyNamed("permissions"),
              loginBehavior: anyNamed("loginBehavior"),
            ),
          ).thenAnswer(
            (final _) async => mockLoginResult,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            await service.reauthenticate(const AuthMethod.facebook());

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockFacebookAuthClient.login(
                  permissions: argThat(
                    isA<List<String>>().having(
                      (final List<String> permissions) => permissions,
                      "permissions",
                      containsAll(<String>['email', 'public_profile']),
                    ),
                    named: "permissions",
                  ),
                  loginBehavior: argThat(
                    isA<LoginBehavior>().having(
                      (final LoginBehavior loginBehavior) => loginBehavior,
                      "loginBehavior",
                      equals(LoginBehavior.dialogOnly),
                    ),
                    named: "loginBehavior",
                  ),
                ),
                mockUser.reauthenticateWithCredential(
                  argThat(isA<FacebookAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to get auth credentials", () async {
          when(
            mockFacebookAuthClient.login(
              permissions: anyNamed("permissions"),
              loginBehavior: anyNamed("loginBehavior"),
            ),
          ).thenThrow(
            Exception("MOCKED GET AUTH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.reauthenticate(const AuthMethod.facebook()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET AUTH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNotNull);
          expect(service.debugState?.uid, equals("TEST_USER_ID"));

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockFacebookAuthClient.login(
                permissions: argThat(
                  isA<List<String>>().having(
                    (final List<String> permissions) => permissions,
                    "permissions",
                    containsAll(<String>['email', 'public_profile']),
                  ),
                  named: "permissions",
                ),
                loginBehavior: argThat(
                  isA<LoginBehavior>().having(
                    (final LoginBehavior loginBehavior) => loginBehavior,
                    "loginBehavior",
                    equals(LoginBehavior.dialogOnly),
                  ),
                  named: "loginBehavior",
                ),
              ),
            ],
          );

          verifyNever(
            mockUser.reauthenticateWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );
        });

        test("failed to reauthenticate with credentials", () async {
          when(
            mockUser.reauthenticateWithCredential(any),
          ).thenThrow(
            Exception("MOCKED REAUTHENTICATE WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.reauthenticate(const AuthMethod.facebook()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REAUTHENTICATE WITH CREDENTIAL EXCEPTION",
                ),
              ),
            ),
          );

          expect(service.debugState, isNotNull);
          expect(service.debugState?.uid, equals("TEST_USER_ID"));

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockFacebookAuthClient.login(
                permissions: argThat(
                  isA<List<String>>().having(
                    (final List<String> permissions) => permissions,
                    "permissions",
                    containsAll(<String>['email', 'public_profile']),
                  ),
                  named: "permissions",
                ),
                loginBehavior: argThat(
                  isA<LoginBehavior>().having(
                    (final LoginBehavior loginBehavior) => loginBehavior,
                    "loginBehavior",
                    equals(LoginBehavior.dialogOnly),
                  ),
                  named: "loginBehavior",
                ),
              ),
              mockUser.reauthenticateWithCredential(
                argThat(isA<FacebookAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );
        });
      });

      group("apple", () {
        setUp(() {
          when(
            mockAppleAuthClient.getAppleIDCredential(
              rawNonce: anyNamed("rawNonce"),
            ),
          ).thenAnswer(
            (final _) async => mockAuthorizationCredentialAppleID,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            await service.reauthenticate(const AuthMethod.apple());

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockAppleAuthClient.getAppleIDCredential(
                  rawNonce: argThat(
                    isA<String>().having(
                      (final String rawNonce) => rawNonce,
                      "rawNonce",
                      isNotEmpty,
                    ),
                    named: "rawNonce",
                  ),
                ),
                mockUser.reauthenticateWithCredential(
                  argThat(
                    isA<OAuthCredential>().having(
                      (final OAuthCredential credential) =>
                          credential.providerId,
                      "credential.provider",
                      equals("apple.com"),
                    ),
                  ),
                ),
                mockUserCredential.user,
              ],
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to get auth credentials", () async {
          when(
            mockAppleAuthClient.getAppleIDCredential(
              rawNonce: anyNamed("rawNonce"),
            ),
          ).thenThrow(
            Exception("MOCKED GET AUTH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.reauthenticate(const AuthMethod.apple()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET AUTH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNotNull);
          expect(service.debugState?.uid, equals("TEST_USER_ID"));

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockAppleAuthClient.getAppleIDCredential(
                rawNonce: argThat(
                  isA<String>().having(
                    (final String rawNonce) => rawNonce,
                    "rawNonce",
                    isNotEmpty,
                  ),
                  named: "rawNonce",
                ),
              ),
            ],
          );

          verifyNever(
            mockUser.reauthenticateWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );
        });

        test("failed to reauthenticate with credentials", () async {
          when(
            mockUser.reauthenticateWithCredential(any),
          ).thenThrow(
            Exception("MOCKED REAUTHENTICATE WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.reauthenticate(const AuthMethod.apple()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REAUTHENTICATE WITH CREDENTIAL EXCEPTION",
                ),
              ),
            ),
          );

          expect(service.debugState, isNotNull);
          expect(service.debugState?.uid, equals("TEST_USER_ID"));

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockAppleAuthClient.getAppleIDCredential(
                rawNonce: argThat(
                  isA<String>().having(
                    (final String rawNonce) => rawNonce,
                    "rawNonce",
                    isNotEmpty,
                  ),
                  named: "rawNonce",
                ),
              ),
              mockUser.reauthenticateWithCredential(
                argThat(
                  isA<OAuthCredential>().having(
                    (final OAuthCredential credential) => credential.providerId,
                    "credential.provider",
                    equals("apple.com"),
                  ),
                ),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );
        });
      });

      group("twitter", () {
        setUp(() {
          when(
            mockTwitterAuthClient.login(
              apiKey: anyNamed("apiKey"),
              apiSecretKey: anyNamed("apiSecretKey"),
              redirectURI: anyNamed("redirectURI"),
              forceLogin: anyNamed("forceLogin"),
            ),
          ).thenAnswer(
            (final _) async => mockAuthResult,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            await service.reauthenticate(
              const AuthMethod.twitter(
                apiKey: "TEST_API_KEY",
                apiSecretKey: "TEST_API_SECRET_KEY",
                redirectURI: "TEST_REDIRECT_URI",
              ),
            );

            expect(service.debugState, isNotNull);
            expect(service.debugState?.uid, equals("TEST_USER_ID"));

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockTwitterAuthClient.login(
                  apiKey: argThat(
                    isA<String>().having(
                      (final String apiKey) => apiKey,
                      "apiKey",
                      equals("TEST_API_KEY"),
                    ),
                    named: "apiKey",
                  ),
                  apiSecretKey: argThat(
                    isA<String>().having(
                      (final String apiSecretKey) => apiSecretKey,
                      "apiSecretKey",
                      equals("TEST_API_SECRET_KEY"),
                    ),
                    named: "apiSecretKey",
                  ),
                  redirectURI: argThat(
                    isA<String>().having(
                      (final String redirectURI) => redirectURI,
                      "redirectURI",
                      equals("TEST_REDIRECT_URI"),
                    ),
                    named: "redirectURI",
                  ),
                  forceLogin: argThat(
                    isA<bool>().having(
                      (final bool forceLogin) => forceLogin,
                      "forceLogin",
                      isFalse,
                    ),
                    named: "forceLogin",
                  ),
                ),
                mockUser.reauthenticateWithCredential(
                  argThat(isA<TwitterAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to get auth credentials", () async {
          when(
            mockTwitterAuthClient.login(
              apiKey: anyNamed("apiKey"),
              apiSecretKey: anyNamed("apiSecretKey"),
              redirectURI: anyNamed("redirectURI"),
              forceLogin: anyNamed("forceLogin"),
            ),
          ).thenThrow(
            Exception("MOCKED GET AUTH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.reauthenticate(
              const AuthMethod.twitter(
                apiKey: "TEST_API_KEY",
                apiSecretKey: "TEST_API_SECRET_KEY",
                redirectURI: "TEST_REDIRECT_URI",
              ),
            ),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET AUTH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          expect(service.debugState, isNotNull);
          expect(service.debugState?.uid, equals("TEST_USER_ID"));

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockTwitterAuthClient.login(
                apiKey: argThat(
                  isA<String>().having(
                    (final String apiKey) => apiKey,
                    "apiKey",
                    equals("TEST_API_KEY"),
                  ),
                  named: "apiKey",
                ),
                apiSecretKey: argThat(
                  isA<String>().having(
                    (final String apiSecretKey) => apiSecretKey,
                    "apiSecretKey",
                    equals("TEST_API_SECRET_KEY"),
                  ),
                  named: "apiSecretKey",
                ),
                redirectURI: argThat(
                  isA<String>().having(
                    (final String redirectURI) => redirectURI,
                    "redirectURI",
                    equals("TEST_REDIRECT_URI"),
                  ),
                  named: "redirectURI",
                ),
                forceLogin: argThat(
                  isA<bool>().having(
                    (final bool forceLogin) => forceLogin,
                    "forceLogin",
                    isFalse,
                  ),
                  named: "forceLogin",
                ),
              ),
            ],
          );

          verifyNever(
            mockUser.reauthenticateWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );
        });

        test("failed to reauthenticate with credentials", () async {
          when(
            mockUser.reauthenticateWithCredential(any),
          ).thenThrow(
            Exception("MOCKED REAUTHENTICATE WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.reauthenticate(
              const AuthMethod.twitter(
                apiKey: "TEST_API_KEY",
                apiSecretKey: "TEST_API_SECRET_KEY",
                redirectURI: "TEST_REDIRECT_URI",
              ),
            ),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REAUTHENTICATE WITH CREDENTIAL EXCEPTION",
                ),
              ),
            ),
          );

          expect(service.debugState, isNotNull);
          expect(service.debugState?.uid, equals("TEST_USER_ID"));

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockTwitterAuthClient.login(
                apiKey: argThat(
                  isA<String>().having(
                    (final String apiKey) => apiKey,
                    "apiKey",
                    equals("TEST_API_KEY"),
                  ),
                  named: "apiKey",
                ),
                apiSecretKey: argThat(
                  isA<String>().having(
                    (final String apiSecretKey) => apiSecretKey,
                    "apiSecretKey",
                    equals("TEST_API_SECRET_KEY"),
                  ),
                  named: "apiSecretKey",
                ),
                redirectURI: argThat(
                  isA<String>().having(
                    (final String redirectURI) => redirectURI,
                    "redirectURI",
                    equals("TEST_REDIRECT_URI"),
                  ),
                  named: "redirectURI",
                ),
                forceLogin: argThat(
                  isA<bool>().having(
                    (final bool forceLogin) => forceLogin,
                    "forceLogin",
                    isFalse,
                  ),
                  named: "forceLogin",
                ),
              ),
              mockUser.reauthenticateWithCredential(
                argThat(isA<TwitterAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );
        });
      });

      group("phone", () {
        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            await service.reauthenticate(
              const AuthMethod.phone(
                verificationId: "TEST_VERIFICATION_ID",
                smsCode: "TEST_SMS_CODE",
              ),
            );

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockUser.reauthenticateWithCredential(
                  argThat(isA<PhoneAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to sign in with credential", () async {
          when(
            mockUser.reauthenticateWithCredential(any),
          ).thenThrow(
            Exception("MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.reauthenticate(
              const AuthMethod.phone(
                verificationId: "TEST_VERIFICATION_ID",
                smsCode: "TEST_SMS_CODE",
              ),
            ),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockUser.reauthenticateWithCredential(
                argThat(isA<PhoneAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );
        });
      });
    });

    group("linkWithAuthMethod", () {
      setUp(() {
        when(
          mockUser.linkWithCredential(any),
        ).thenAnswer(
          (final _) async => mockUserCredential,
        );
      });

      test("not log in yet", () async {
        when(mockAuthClient.currentUser).thenReturn(null);

        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        await expectLater(
          service.linkWithAuthMethod(const AuthMethod.anonymous()),
          throwsA(
            isA<AuthServiceException>().having(
              (final AuthServiceException exception) => exception.toString(),
              "message",
              equals("AuthServiceException: Not log in yet."),
            ),
          ),
        );

        verify(
          mockAuthClient.currentUser,
        ).called(1);

        verifyNever(
          mockAuthClient.signInAnonymously(),
        );

        verifyNever(
          mockAuthClient.signInWithEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
          ),
        );

        verifyNever(
          mockGoogleAuthClient.signIn(),
        );

        verifyNever(
          mockFacebookAuthClient.login(
            permissions: anyNamed("permissions"),
            loginBehavior: anyNamed("loginBehavior"),
          ),
        );

        verifyNever(
          mockAppleAuthClient.getAppleIDCredential(
            rawNonce: anyNamed("rawNonce"),
          ),
        );

        verifyNever(
          mockTwitterAuthClient.login(
            apiKey: anyNamed("apiKey"),
            apiSecretKey: anyNamed("apiSecretKey"),
            redirectURI: anyNamed("redirectURI"),
            forceLogin: anyNamed("forceLogin"),
          ),
        );

        verifyNever(
          mockUser.linkWithCredential(any),
        );

        verifyNever(
          mockUserCredential.user,
        );
      });

      group("anonymously", () {
        test("throws exception", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.linkWithAuthMethod(const AuthMethod.anonymous()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("AuthServiceException: Failed to get auth credential."),
              ),
            ),
          );

          verifyNever(
            mockUser.linkWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );
        });
      });

      group("email and password", () {
        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            await service.linkWithAuthMethod(
              const AuthMethod.email(
                email: "TEST_EMAIL",
                password: "TEST_PASSWORD",
              ),
            );

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockUser.linkWithCredential(
                  argThat(isA<EmailAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to link with credentials", () async {
          when(
            mockUser.linkWithCredential(any),
          ).thenThrow(
            Exception("MOCKED LINK WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.linkWithAuthMethod(
              const AuthMethod.email(
                email: "TEST_EMAIL",
                password: "TEST_PASSWORD",
              ),
            ),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED LINK WITH CREDENTIAL EXCEPTION",
                ),
              ),
            ),
          );

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockUser.linkWithCredential(
                argThat(isA<EmailAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );
        });
      });

      group("google", () {
        setUp(() {
          when(
            mockGoogleAuthClient.signIn(),
          ).thenAnswer(
            (final _) async => mockGoogleSignInAccount,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            await service.linkWithAuthMethod(const AuthMethod.google());

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockGoogleAuthClient.signIn(),
                mockUser.linkWithCredential(
                  argThat(isA<GoogleAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to get auth credentials", () async {
          when(
            mockGoogleAuthClient.signIn(),
          ).thenThrow(
            Exception("MOCKED GET AUTH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.linkWithAuthMethod(const AuthMethod.google()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET AUTH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockGoogleAuthClient.signIn(),
            ],
          );

          verifyNever(
            mockUser.linkWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );
        });

        test("failed to link with credentials", () async {
          when(
            mockUser.linkWithCredential(any),
          ).thenThrow(
            Exception("MOCKED LINK WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.linkWithAuthMethod(const AuthMethod.google()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED LINK WITH CREDENTIAL EXCEPTION",
                ),
              ),
            ),
          );

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockGoogleAuthClient.signIn(),
              mockUser.linkWithCredential(
                argThat(isA<GoogleAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );
        });
      });

      group("facebook", () {
        setUp(() {
          when(
            mockFacebookAuthClient.login(
              permissions: anyNamed("permissions"),
              loginBehavior: anyNamed("loginBehavior"),
            ),
          ).thenAnswer(
            (final _) async => mockLoginResult,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            await service.linkWithAuthMethod(const AuthMethod.facebook());

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockFacebookAuthClient.login(
                  permissions: argThat(
                    isA<List<String>>().having(
                      (final List<String> permissions) => permissions,
                      "permissions",
                      containsAll(<String>['email', 'public_profile']),
                    ),
                    named: "permissions",
                  ),
                  loginBehavior: argThat(
                    isA<LoginBehavior>().having(
                      (final LoginBehavior loginBehavior) => loginBehavior,
                      "loginBehavior",
                      equals(LoginBehavior.dialogOnly),
                    ),
                    named: "loginBehavior",
                  ),
                ),
                mockUser.linkWithCredential(
                  argThat(isA<FacebookAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to get auth credentials", () async {
          when(
            mockFacebookAuthClient.login(
              permissions: anyNamed("permissions"),
              loginBehavior: anyNamed("loginBehavior"),
            ),
          ).thenThrow(
            Exception("MOCKED GET AUTH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.linkWithAuthMethod(const AuthMethod.facebook()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET AUTH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockFacebookAuthClient.login(
                permissions: argThat(
                  isA<List<String>>().having(
                    (final List<String> permissions) => permissions,
                    "permissions",
                    containsAll(<String>['email', 'public_profile']),
                  ),
                  named: "permissions",
                ),
                loginBehavior: argThat(
                  isA<LoginBehavior>().having(
                    (final LoginBehavior loginBehavior) => loginBehavior,
                    "loginBehavior",
                    equals(LoginBehavior.dialogOnly),
                  ),
                  named: "loginBehavior",
                ),
              ),
            ],
          );

          verifyNever(
            mockUser.linkWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );
        });

        test("failed to link with credentials", () async {
          when(
            mockUser.linkWithCredential(any),
          ).thenThrow(
            Exception("MOCKED LINK WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.linkWithAuthMethod(const AuthMethod.facebook()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED LINK WITH CREDENTIAL EXCEPTION",
                ),
              ),
            ),
          );

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockFacebookAuthClient.login(
                permissions: argThat(
                  isA<List<String>>().having(
                    (final List<String> permissions) => permissions,
                    "permissions",
                    containsAll(<String>['email', 'public_profile']),
                  ),
                  named: "permissions",
                ),
                loginBehavior: argThat(
                  isA<LoginBehavior>().having(
                    (final LoginBehavior loginBehavior) => loginBehavior,
                    "loginBehavior",
                    equals(LoginBehavior.dialogOnly),
                  ),
                  named: "loginBehavior",
                ),
              ),
              mockUser.linkWithCredential(
                argThat(isA<FacebookAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );
        });
      });

      group("apple", () {
        setUp(() {
          when(
            mockAppleAuthClient.getAppleIDCredential(
              rawNonce: anyNamed("rawNonce"),
            ),
          ).thenAnswer(
            (final _) async => mockAuthorizationCredentialAppleID,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            await service.linkWithAuthMethod(const AuthMethod.apple());

            verifyInOrder(
              <Object?>[
                mockAppleAuthClient.getAppleIDCredential(
                  rawNonce: argThat(
                    isA<String>().having(
                      (final String rawNonce) => rawNonce,
                      "rawNonce",
                      isNotEmpty,
                    ),
                    named: "rawNonce",
                  ),
                ),
                mockUser.linkWithCredential(
                  argThat(
                    isA<OAuthCredential>().having(
                      (final OAuthCredential credential) =>
                          credential.providerId,
                      "credential.providerId",
                      equals("apple.com"),
                    ),
                  ),
                ),
                mockUserCredential.user,
              ],
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to get auth credentials", () async {
          when(
            mockAppleAuthClient.getAppleIDCredential(
              rawNonce: anyNamed("rawNonce"),
            ),
          ).thenThrow(
            Exception("MOCKED GET AUTH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.linkWithAuthMethod(const AuthMethod.apple()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET AUTH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          verifyInOrder(
            <Object?>[
              mockAppleAuthClient.getAppleIDCredential(
                rawNonce: argThat(
                  isA<String>().having(
                    (final String rawNonce) => rawNonce,
                    "rawNonce",
                    isNotEmpty,
                  ),
                  named: "rawNonce",
                ),
              ),
            ],
          );

          verifyNever(
            mockUser.linkWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );
        });

        test("failed to link with credentials", () async {
          when(
            mockUser.linkWithCredential(any),
          ).thenThrow(
            Exception("MOCKED LINK WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.linkWithAuthMethod(const AuthMethod.apple()),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED LINK WITH CREDENTIAL EXCEPTION",
                ),
              ),
            ),
          );

          verifyInOrder(
            <Object?>[
              mockAppleAuthClient.getAppleIDCredential(
                rawNonce: argThat(
                  isA<String>().having(
                    (final String rawNonce) => rawNonce,
                    "rawNonce",
                    isNotEmpty,
                  ),
                  named: "rawNonce",
                ),
              ),
              mockUser.linkWithCredential(
                argThat(
                  isA<OAuthCredential>().having(
                    (final OAuthCredential credential) => credential.providerId,
                    "credential.providerId",
                    equals("apple.com"),
                  ),
                ),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );
        });
      });

      group("twitter", () {
        setUp(() {
          when(
            mockTwitterAuthClient.login(
              apiKey: anyNamed("apiKey"),
              apiSecretKey: anyNamed("apiSecretKey"),
              redirectURI: anyNamed("redirectURI"),
              forceLogin: anyNamed("forceLogin"),
            ),
          ).thenAnswer(
            (final _) async => mockAuthResult,
          );
        });

        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            await service.linkWithAuthMethod(
              const AuthMethod.twitter(
                apiKey: "TEST_API_KEY",
                apiSecretKey: "TEST_API_SECRET_KEY",
                redirectURI: "TEST_REDIRECT_URI",
              ),
            );

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockTwitterAuthClient.login(
                  apiKey: argThat(
                    isA<String>().having(
                      (final String apiKey) => apiKey,
                      "apiKey",
                      equals("TEST_API_KEY"),
                    ),
                    named: "apiKey",
                  ),
                  apiSecretKey: argThat(
                    isA<String>().having(
                      (final String apiSecretKey) => apiSecretKey,
                      "apiSecretKey",
                      equals("TEST_API_SECRET_KEY"),
                    ),
                    named: "apiSecretKey",
                  ),
                  redirectURI: argThat(
                    isA<String>().having(
                      (final String redirectURI) => redirectURI,
                      "redirectURI",
                      equals("TEST_REDIRECT_URI"),
                    ),
                    named: "redirectURI",
                  ),
                  forceLogin: argThat(
                    isA<bool>().having(
                      (final bool forceLogin) => forceLogin,
                      "forceLogin",
                      isFalse,
                    ),
                    named: "forceLogin",
                  ),
                ),
                mockUser.linkWithCredential(
                  argThat(isA<TwitterAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to get auth credentials", () async {
          when(
            mockTwitterAuthClient.login(
              apiKey: anyNamed("apiKey"),
              apiSecretKey: anyNamed("apiSecretKey"),
              redirectURI: anyNamed("redirectURI"),
              forceLogin: anyNamed("forceLogin"),
            ),
          ).thenThrow(
            Exception("MOCKED GET AUTH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.linkWithAuthMethod(
              const AuthMethod.twitter(
                apiKey: "TEST_API_KEY",
                apiSecretKey: "TEST_API_SECRET_KEY",
                redirectURI: "TEST_REDIRECT_URI",
              ),
            ),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET AUTH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockTwitterAuthClient.login(
                apiKey: argThat(
                  isA<String>().having(
                    (final String apiKey) => apiKey,
                    "apiKey",
                    equals("TEST_API_KEY"),
                  ),
                  named: "apiKey",
                ),
                apiSecretKey: argThat(
                  isA<String>().having(
                    (final String apiSecretKey) => apiSecretKey,
                    "apiSecretKey",
                    equals("TEST_API_SECRET_KEY"),
                  ),
                  named: "apiSecretKey",
                ),
                redirectURI: argThat(
                  isA<String>().having(
                    (final String redirectURI) => redirectURI,
                    "redirectURI",
                    equals("TEST_REDIRECT_URI"),
                  ),
                  named: "redirectURI",
                ),
                forceLogin: argThat(
                  isA<bool>().having(
                    (final bool forceLogin) => forceLogin,
                    "forceLogin",
                    isFalse,
                  ),
                  named: "forceLogin",
                ),
              ),
            ],
          );

          verifyNever(
            mockUser.linkWithCredential(any),
          );

          verifyNever(
            mockUserCredential.user,
          );
        });

        test("failed to link with credentials", () async {
          when(
            mockUser.linkWithCredential(any),
          ).thenThrow(
            Exception("MOCKED LINK WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.linkWithAuthMethod(
              const AuthMethod.twitter(
                apiKey: "TEST_API_KEY",
                apiSecretKey: "TEST_API_SECRET_KEY",
                redirectURI: "TEST_REDIRECT_URI",
              ),
            ),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED LINK WITH CREDENTIAL EXCEPTION",
                ),
              ),
            ),
          );

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockTwitterAuthClient.login(
                apiKey: argThat(
                  isA<String>().having(
                    (final String apiKey) => apiKey,
                    "apiKey",
                    equals("TEST_API_KEY"),
                  ),
                  named: "apiKey",
                ),
                apiSecretKey: argThat(
                  isA<String>().having(
                    (final String apiSecretKey) => apiSecretKey,
                    "apiSecretKey",
                    equals("TEST_API_SECRET_KEY"),
                  ),
                  named: "apiSecretKey",
                ),
                redirectURI: argThat(
                  isA<String>().having(
                    (final String redirectURI) => redirectURI,
                    "redirectURI",
                    equals("TEST_REDIRECT_URI"),
                  ),
                  named: "redirectURI",
                ),
                forceLogin: argThat(
                  isA<bool>().having(
                    (final bool forceLogin) => forceLogin,
                    "forceLogin",
                    isFalse,
                  ),
                  named: "forceLogin",
                ),
              ),
              mockUser.linkWithCredential(
                argThat(isA<TwitterAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );
        });
      });

      group("phone", () {
        test("succeed", () async {
          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          try {
            await service.linkWithAuthMethod(
              const AuthMethod.phone(
                verificationId: "TEST_VERIFICATION_ID",
                smsCode: "TEST_SMS_CODE",
              ),
            );

            verifyInOrder(
              <Object?>[
                mockAuthClient.currentUser,
                mockUser.linkWithCredential(
                  argThat(isA<PhoneAuthCredential>()),
                ),
                mockUserCredential.user,
              ],
            );
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed to sign in with credential", () async {
          when(
            mockUser.linkWithCredential(any),
          ).thenThrow(
            Exception("MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
          );

          final AuthService service =
              container.refresh(authServiceProvider(null).notifier);

          await expectLater(
            service.linkWithAuthMethod(
              const AuthMethod.phone(
                verificationId: "TEST_VERIFICATION_ID",
                smsCode: "TEST_SMS_CODE",
              ),
            ),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED SIGN IN WITH CREDENTIAL EXCEPTION"),
              ),
            ),
          );

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockUser.linkWithCredential(
                argThat(isA<PhoneAuthCredential>()),
              ),
            ],
          );

          verifyNever(
            mockUserCredential.user,
          );
        });
      });
    });

    group("verifyPhoneNumber", () {
      setUp(() {
        when(
          mockAuthClient.verifyPhoneNumber(
            phoneNumber: anyNamed("phoneNumber"),
            verificationCompleted: anyNamed("verificationCompleted"),
            verificationFailed: anyNamed("verificationFailed"),
            codeSent: anyNamed("codeSent"),
            codeAutoRetrievalTimeout: anyNamed("codeAutoRetrievalTimeout"),
            timeout: anyNamed("timeout"),
            forceResendingToken: anyNamed("forceResendingToken"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("not log in yet", () async {
        when(mockAuthClient.currentUser).thenReturn(null);

        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        await expectLater(
          service.verifyPhoneNumber(
            phoneNumber: "TEST_PHONE_NUMBER",
            verificationCompleted: (final _) {},
            verificationFailed: (final _) {},
            codeSent: (final _, final __) {},
            codeAutoRetrievalTimeout: (final _) {},
          ),
          throwsA(
            isA<AuthServiceException>().having(
              (final AuthServiceException exception) => exception.toString(),
              "message",
              equals("AuthServiceException: Not log in yet."),
            ),
          ),
        );

        verify(
          mockAuthClient.currentUser,
        ).called(1);

        verifyNever(
          mockAuthClient.verifyPhoneNumber(
            phoneNumber: anyNamed("phoneNumber"),
            verificationCompleted: anyNamed("verificationCompleted"),
            verificationFailed: anyNamed("verificationFailed"),
            codeSent: anyNamed("codeSent"),
            codeAutoRetrievalTimeout: anyNamed("codeAutoRetrievalTimeout"),
            timeout: anyNamed("timeout"),
            forceResendingToken: anyNamed("forceResendingToken"),
          ),
        );
      });

      test("succeed", () async {
        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        try {
          await service.verifyPhoneNumber(
            phoneNumber: "TEST_PHONE_NUMBER",
            verificationCompleted: (final _) {},
            verificationFailed: (final _) {},
            codeSent: (final _, final __) {},
            codeAutoRetrievalTimeout: (final _) {},
          );

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockAuthClient.verifyPhoneNumber(
                phoneNumber: argThat(
                  isA<String>().having(
                    (final String phoneNumber) => phoneNumber,
                    "phoneNumber",
                    equals("TEST_PHONE_NUMBER"),
                  ),
                  named: "phoneNumber",
                ),
                verificationCompleted: argThat(
                  isA<PhoneVerificationCompleted>(),
                  named: "verificationCompleted",
                ),
                verificationFailed: argThat(
                  isA<PhoneVerificationFailed>(),
                  named: "verificationFailed",
                ),
                codeSent: argThat(
                  isA<PhoneCodeSent>(),
                  named: "codeSent",
                ),
                codeAutoRetrievalTimeout: argThat(
                  isA<PhoneCodeAutoRetrievalTimeout>(),
                  named: "codeAutoRetrievalTimeout",
                ),
                timeout: argThat(
                  isA<Duration>().having(
                    (final Duration timeout) => timeout,
                    "timeout",
                    equals(const Duration(seconds: 30)),
                  ),
                  named: "timeout",
                ),
                forceResendingToken: argThat(
                  isA<int?>().having(
                    (final int? forceResendingToken) => forceResendingToken,
                    "forceResendingToken",
                    isNull,
                  ),
                  named: "forceResendingToken",
                ),
              ),
            ],
          );
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAuthClient.verifyPhoneNumber(
            phoneNumber: anyNamed("phoneNumber"),
            verificationCompleted: anyNamed("verificationCompleted"),
            verificationFailed: anyNamed("verificationFailed"),
            codeSent: anyNamed("codeSent"),
            codeAutoRetrievalTimeout: anyNamed("codeAutoRetrievalTimeout"),
            timeout: anyNamed("timeout"),
            forceResendingToken: anyNamed("forceResendingToken"),
          ),
        ).thenThrow(
          Exception("MOCKED VERIFY PHONE NUMBER EXCEPTION"),
        );

        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        await expectLater(
          service.verifyPhoneNumber(
            phoneNumber: "TEST_PHONE_NUMBER",
            verificationCompleted: (final _) {},
            verificationFailed: (final _) {},
            codeSent: (final _, final __) {},
            codeAutoRetrievalTimeout: (final _) {},
          ),
          throwsA(
            isException.having(
              (final Exception exception) => exception.toString(),
              "message",
              equals("Exception: MOCKED VERIFY PHONE NUMBER EXCEPTION"),
            ),
          ),
        );

        verifyInOrder(
          <Object?>[
            mockAuthClient.currentUser,
            mockAuthClient.verifyPhoneNumber(
              phoneNumber: argThat(
                isA<String>().having(
                  (final String phoneNumber) => phoneNumber,
                  "phoneNumber",
                  equals("TEST_PHONE_NUMBER"),
                ),
                named: "phoneNumber",
              ),
              verificationCompleted: argThat(
                isA<PhoneVerificationCompleted>(),
                named: "verificationCompleted",
              ),
              verificationFailed: argThat(
                isA<PhoneVerificationFailed>(),
                named: "verificationFailed",
              ),
              codeSent: argThat(
                isA<PhoneCodeSent>(),
                named: "codeSent",
              ),
              codeAutoRetrievalTimeout: argThat(
                isA<PhoneCodeAutoRetrievalTimeout>(),
                named: "codeAutoRetrievalTimeout",
              ),
              timeout: argThat(
                isA<Duration>().having(
                  (final Duration timeout) => timeout,
                  "timeout",
                  equals(const Duration(seconds: 30)),
                ),
                named: "timeout",
              ),
              forceResendingToken: argThat(
                isA<int?>().having(
                  (final int? forceResendingToken) => forceResendingToken,
                  "forceResendingToken",
                  isNull,
                ),
                named: "forceResendingToken",
              ),
            ),
          ],
        );
      });
    });

    group("updateEmail", () {
      setUp(() {
        when(
          mockUser.updateEmail(any),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("not log in yet", () async {
        when(mockAuthClient.currentUser).thenReturn(null);

        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        await expectLater(
          service.updateEmail("TEST_NEW_EMAIL"),
          throwsA(
            isA<AuthServiceException>().having(
              (final AuthServiceException exception) => exception.toString(),
              "message",
              equals("AuthServiceException: Not log in yet."),
            ),
          ),
        );

        verify(
          mockAuthClient.currentUser,
        ).called(1);

        verifyNever(
          mockUser.updateEmail(any),
        );
      });

      test("succeed", () async {
        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        try {
          await service.updateEmail("TEST_NEW_EMAIL");

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockUser.updateEmail(
                argThat(
                  isA<String>().having(
                    (final String newEmail) => newEmail,
                    "newEmail",
                    equals("TEST_NEW_EMAIL"),
                  ),
                ),
              ),
            ],
          );
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed to update email", () async {
        when(
          mockUser.updateEmail(any),
        ).thenThrow(
          Exception("MOCKED UPDATE EMAIL EXCEPTION"),
        );

        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        await expectLater(
          service.updateEmail("TEST_NEW_EMAIL"),
          throwsA(
            isException.having(
              (final Exception exception) => exception.toString(),
              "message",
              equals("Exception: MOCKED UPDATE EMAIL EXCEPTION"),
            ),
          ),
        );

        verifyInOrder(
          <Object?>[
            mockAuthClient.currentUser,
            mockUser.updateEmail(
              argThat(
                isA<String>().having(
                  (final String newEmail) => newEmail,
                  "newEmail",
                  equals("TEST_NEW_EMAIL"),
                ),
              ),
            ),
          ],
        );
      });
    });

    group("updatePassword", () {
      setUp(() {
        when(
          mockUser.updatePassword(any),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("not log in yet", () async {
        when(mockAuthClient.currentUser).thenReturn(null);

        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        await expectLater(
          service.updatePassword("TEST_NEW_PASSWORD"),
          throwsA(
            isA<AuthServiceException>().having(
              (final AuthServiceException exception) => exception.toString(),
              "message",
              equals("AuthServiceException: Not log in yet."),
            ),
          ),
        );

        verify(
          mockAuthClient.currentUser,
        ).called(1);

        verifyNever(
          mockUser.updatePassword(any),
        );
      });

      test("succeed", () async {
        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        try {
          await service.updatePassword("TEST_NEW_PASSWORD");

          verifyInOrder(
            <Object?>[
              mockAuthClient.currentUser,
              mockUser.updatePassword(
                argThat(
                  isA<String>().having(
                    (final String newPassword) => newPassword,
                    "newPassword",
                    equals("TEST_NEW_PASSWORD"),
                  ),
                ),
              ),
            ],
          );
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed to update password", () async {
        when(
          mockUser.updatePassword(any),
        ).thenThrow(
          Exception("MOCKED UPDATE PASSWORD EXCEPTION"),
        );

        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        await expectLater(
          service.updatePassword("TEST_NEW_PASSWORD"),
          throwsA(
            isException.having(
              (final Exception exception) => exception.toString(),
              "message",
              equals("Exception: MOCKED UPDATE PASSWORD EXCEPTION"),
            ),
          ),
        );

        verifyInOrder(
          <Object?>[
            mockAuthClient.currentUser,
            mockUser.updatePassword(
              argThat(
                isA<String>().having(
                  (final String newPassword) => newPassword,
                  "newPassword",
                  equals("TEST_NEW_PASSWORD"),
                ),
              ),
            ),
          ],
        );
      });
    });

    group("sendPasswordResetEmail", () {
      setUp(() {
        when(
          mockAuthClient.sendPasswordResetEmail(
            email: anyNamed("email"),
            actionCodeSettings: anyNamed("actionCodeSettings"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        try {
          await service.sendPasswordResetEmail("TEST_EMAIL_ADDRESS");

          verify(
            mockAuthClient.sendPasswordResetEmail(
              email: argThat(
                isA<String>().having(
                  (final String email) => email,
                  "email",
                  equals("TEST_EMAIL_ADDRESS"),
                ),
                named: "email",
              ),
              actionCodeSettings: argThat(
                isA<ActionCodeSettings?>().having(
                  (final ActionCodeSettings? actionCodeSettings) =>
                      actionCodeSettings,
                  "actionCodeSettings",
                  isNull,
                ),
                named: "actionCodeSettings",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed to send password reset email", () async {
        when(
          mockAuthClient.sendPasswordResetEmail(
            email: anyNamed("email"),
            actionCodeSettings: anyNamed("actionCodeSettings"),
          ),
        ).thenThrow(
          Exception("MOCKED SEND PASSWORD RESET EMAIL EXCEPTION"),
        );

        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        await expectLater(
          service.sendPasswordResetEmail("TEST_EMAIL_ADDRESS"),
          throwsA(
            isException.having(
              (final Exception exception) => exception.toString(),
              "message",
              equals("Exception: MOCKED SEND PASSWORD RESET EMAIL EXCEPTION"),
            ),
          ),
        );

        verify(
          mockAuthClient.sendPasswordResetEmail(
            email: argThat(
              isA<String>().having(
                (final String email) => email,
                "email",
                equals("TEST_EMAIL_ADDRESS"),
              ),
              named: "email",
            ),
            actionCodeSettings: argThat(
              isA<ActionCodeSettings?>().having(
                (final ActionCodeSettings? actionCodeSettings) =>
                    actionCodeSettings,
                "actionCodeSettings",
                isNull,
              ),
              named: "actionCodeSettings",
            ),
          ),
        ).called(1);
      });
    });

    group("authStatusChanged", () {
      setUp(() {
        when(
          mockAuthClient.authStateChanges(),
        ).thenAnswer(
          (final _) => Stream<User>.value(mockUser),
        );
      });

      test("succeed", () async {
        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        try {
          expect(
            service.authStatusChanged(),
            emits(
              isA<User?>().having(
                (final User? user) => user,
                "user",
                isNotNull,
              ),
            ),
          );
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAuthClient.authStateChanges(),
        ).thenAnswer(
          (final _) => Stream<User>.error(
            Exception("MOCKED AUTH STATE CHANGES EXCEPTION"),
          ),
        );

        final AuthService service =
            container.refresh(authServiceProvider(null).notifier);

        expect(
          service.authStatusChanged(),
          emitsError(
            isException.having(
              (final Exception exception) => exception.toString(),
              "massage",
              equals("Exception: MOCKED AUTH STATE CHANGES EXCEPTION"),
            ),
          ),
        );
      });
    });
  });
}
