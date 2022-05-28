import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_service/src/client.dart';
import 'package:firebase_service/src/service.dart';
import 'package:firebase_service/src/service.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';

import 'client.mocks.dart';

void main() {
  group("FirebaseService", () {
    final MockFirebaseApp mockFirebaseApp = MockFirebaseApp();
    final MockFirebaseClient mockFirebaseClient = MockFirebaseClient();

    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        firebaseClientProvider.overrideWithValue(mockFirebaseClient),
      ],
    );

    setUp(() {
      reset(mockFirebaseApp);
      reset(mockFirebaseClient);
    });

    group("setUp", () {
      setUp(() {
        when(mockFirebaseApp.name).thenReturn("TEST_APP_ID");
        when(mockFirebaseClient.app(any)).thenReturn(mockFirebaseApp);
        when(mockFirebaseClient.apps).thenReturn(<MockFirebaseApp>[]);
        when(
          mockFirebaseClient.initializeApp(
            name: anyNamed("name"),
            options: anyNamed("options"),
          ),
        ).thenAnswer(
          (final _) async => mockFirebaseApp,
        );
      });

      test("has initialized", () async {
        when(mockFirebaseClient.apps)
            .thenReturn(<MockFirebaseApp>[mockFirebaseApp]);

        final FirebaseService service =
            container.refresh(firebaseServiceProvider.notifier);

        try {
          expect(service.debugState, hasLength(1));

          await service.setUp(
            apiKey: "TEST_API_KEY",
            appId: "TEST_APP_ID",
            messagingSenderId: "TEST_MESSAGING_SENDER_ID",
            projectId: "TEST_PROJECT_ID",
          );

          expect(service.debugState, hasLength(1));

          verifyNever(
            mockFirebaseClient.initializeApp(
              name: anyNamed("name"),
              options: anyNamed("options"),
            ),
          );
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("succeed", () async {
        final FirebaseService service =
            container.refresh(firebaseServiceProvider.notifier);

        try {
          expect(service.debugState, isEmpty);

          await service.setUp(
            apiKey: "TEST_API_KEY",
            appId: "TEST_APP_ID",
            messagingSenderId: "TEST_MESSAGING_SENDER_ID",
            projectId: "TEST_PROJECT_ID",
          );

          expect(service.debugState, hasLength(1));

          verify(
            mockFirebaseClient.initializeApp(
              name: argThat(
                isA<String>().having(
                  (final String name) => name,
                  "name",
                  equals("TEST_APP_ID"),
                ),
                named: "name",
              ),
              options: argThat(
                isA<FirebaseOptions>()
                    .having(
                      (final FirebaseOptions options) =>
                          options.androidClientId,
                      "options.androidClientId",
                      isA<String?>().having(
                        (final String? androidClientId) => androidClientId,
                        "androidClientId",
                        isNull,
                      ),
                    )
                    .having(
                      (final FirebaseOptions options) => options.apiKey,
                      "options.apiKey",
                      isA<String>().having(
                        (final String apiKey) => apiKey,
                        "apiKey",
                        equals("TEST_API_KEY"),
                      ),
                    )
                    .having(
                      (final FirebaseOptions options) => options.appGroupId,
                      "options.appGroupId",
                      isA<String?>().having(
                        (final String? appGroupId) => appGroupId,
                        "appGroupId",
                        isNull,
                      ),
                    )
                    .having(
                      (final FirebaseOptions options) => options.appId,
                      "options.appId",
                      isA<String>().having(
                        (final String appId) => appId,
                        "appId",
                        equals("TEST_APP_ID"),
                      ),
                    )
                    .having(
                      (final FirebaseOptions options) => options.authDomain,
                      "options.authDomain",
                      isA<String?>().having(
                        (final String? authDomain) => authDomain,
                        "authDomain",
                        isNull,
                      ),
                    )
                    .having(
                      (final FirebaseOptions options) => options.databaseURL,
                      "options.databaseURL",
                      isA<String?>().having(
                        (final String? databaseURL) => databaseURL,
                        "databaseURL",
                        isNull,
                      ),
                    )
                    .having(
                      (final FirebaseOptions options) =>
                          options.deepLinkURLScheme,
                      "options.deepLinkURLScheme",
                      isA<String?>().having(
                        (final String? deepLinkURLScheme) => deepLinkURLScheme,
                        "deepLinkURLScheme",
                        isNull,
                      ),
                    )
                    .having(
                      (final FirebaseOptions options) => options.iosBundleId,
                      "options.iosBundleId",
                      isA<String?>().having(
                        (final String? iosBundleId) => iosBundleId,
                        "iosBundleId",
                        isNull,
                      ),
                    )
                    .having(
                      (final FirebaseOptions options) => options.iosClientId,
                      "options.iosClientId",
                      isA<String?>().having(
                        (final String? iosClientId) => iosClientId,
                        "iosClientId",
                        isNull,
                      ),
                    )
                    .having(
                      (final FirebaseOptions options) => options.measurementId,
                      "options.measurementId",
                      isA<String?>().having(
                        (final String? measurementId) => measurementId,
                        "measurementId",
                        isNull,
                      ),
                    )
                    .having(
                      (final FirebaseOptions options) =>
                          options.messagingSenderId,
                      "options.messagingSenderId",
                      isA<String>().having(
                        (final String messagingSenderId) => messagingSenderId,
                        "messagingSenderId",
                        equals("TEST_MESSAGING_SENDER_ID"),
                      ),
                    )
                    .having(
                      (final FirebaseOptions options) => options.projectId,
                      "options.projectId",
                      isA<String>().having(
                        (final String projectId) => projectId,
                        "projectId",
                        equals("TEST_PROJECT_ID"),
                      ),
                    )
                    .having(
                      (final FirebaseOptions options) => options.storageBucket,
                      "options.storageBucket",
                      isA<String?>().having(
                        (final String? storageBucket) => storageBucket,
                        "storageBucket",
                        isNull,
                      ),
                    )
                    .having(
                      (final FirebaseOptions options) => options.trackingId,
                      "options.trackingId",
                      isA<String?>().having(
                        (final String? trackingId) => trackingId,
                        "trackingId",
                        isNull,
                      ),
                    ),
                named: "options",
              ),
            ),
          ).called(1);

          verifyNever(
            mockFirebaseClient.app(any),
          );
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("succeed but initialize failed", () async {
        when(
          mockFirebaseClient.initializeApp(
            name: anyNamed("name"),
            options: anyNamed("options"),
          ),
        ).thenThrow(
          FirebaseException(plugin: "MOCKED PLUGIN"),
        );

        final FirebaseService service =
            container.refresh(firebaseServiceProvider.notifier);

        try {
          expect(service.debugState, isEmpty);

          await service.setUp(
            apiKey: "TEST_API_KEY",
            appId: "TEST_APP_ID",
            messagingSenderId: "TEST_MESSAGING_SENDER_ID",
            projectId: "TEST_PROJECT_ID",
          );

          expect(service.debugState, hasLength(1));

          verifyInOrder(
            <Object>[
              mockFirebaseClient.initializeApp(
                name: argThat(
                  isA<String>().having(
                    (final String name) => name,
                    "name",
                    equals("TEST_APP_ID"),
                  ),
                  named: "name",
                ),
                options: argThat(
                  isA<FirebaseOptions>()
                      .having(
                        (final FirebaseOptions options) =>
                            options.androidClientId,
                        "options.androidClientId",
                        isA<String?>().having(
                          (final String? androidClientId) => androidClientId,
                          "androidClientId",
                          isNull,
                        ),
                      )
                      .having(
                        (final FirebaseOptions options) => options.apiKey,
                        "options.apiKey",
                        isA<String>().having(
                          (final String apiKey) => apiKey,
                          "apiKey",
                          equals("TEST_API_KEY"),
                        ),
                      )
                      .having(
                        (final FirebaseOptions options) => options.appGroupId,
                        "options.appGroupId",
                        isA<String?>().having(
                          (final String? appGroupId) => appGroupId,
                          "appGroupId",
                          isNull,
                        ),
                      )
                      .having(
                        (final FirebaseOptions options) => options.appId,
                        "options.appId",
                        isA<String>().having(
                          (final String appId) => appId,
                          "appId",
                          equals("TEST_APP_ID"),
                        ),
                      )
                      .having(
                        (final FirebaseOptions options) => options.authDomain,
                        "options.authDomain",
                        isA<String?>().having(
                          (final String? authDomain) => authDomain,
                          "authDomain",
                          isNull,
                        ),
                      )
                      .having(
                        (final FirebaseOptions options) => options.databaseURL,
                        "options.databaseURL",
                        isA<String?>().having(
                          (final String? databaseURL) => databaseURL,
                          "databaseURL",
                          isNull,
                        ),
                      )
                      .having(
                        (final FirebaseOptions options) =>
                            options.deepLinkURLScheme,
                        "options.deepLinkURLScheme",
                        isA<String?>().having(
                          (final String? deepLinkURLScheme) =>
                              deepLinkURLScheme,
                          "deepLinkURLScheme",
                          isNull,
                        ),
                      )
                      .having(
                        (final FirebaseOptions options) => options.iosBundleId,
                        "options.iosBundleId",
                        isA<String?>().having(
                          (final String? iosBundleId) => iosBundleId,
                          "iosBundleId",
                          isNull,
                        ),
                      )
                      .having(
                        (final FirebaseOptions options) => options.iosClientId,
                        "options.iosClientId",
                        isA<String?>().having(
                          (final String? iosClientId) => iosClientId,
                          "iosClientId",
                          isNull,
                        ),
                      )
                      .having(
                        (final FirebaseOptions options) =>
                            options.measurementId,
                        "options.measurementId",
                        isA<String?>().having(
                          (final String? measurementId) => measurementId,
                          "measurementId",
                          isNull,
                        ),
                      )
                      .having(
                        (final FirebaseOptions options) =>
                            options.messagingSenderId,
                        "options.messagingSenderId",
                        isA<String>().having(
                          (final String messagingSenderId) => messagingSenderId,
                          "messagingSenderId",
                          equals("TEST_MESSAGING_SENDER_ID"),
                        ),
                      )
                      .having(
                        (final FirebaseOptions options) => options.projectId,
                        "options.projectId",
                        isA<String>().having(
                          (final String projectId) => projectId,
                          "projectId",
                          equals("TEST_PROJECT_ID"),
                        ),
                      )
                      .having(
                        (final FirebaseOptions options) =>
                            options.storageBucket,
                        "options.storageBucket",
                        isA<String?>().having(
                          (final String? storageBucket) => storageBucket,
                          "storageBucket",
                          isNull,
                        ),
                      )
                      .having(
                        (final FirebaseOptions options) => options.trackingId,
                        "options.trackingId",
                        isA<String?>().having(
                          (final String? trackingId) => trackingId,
                          "trackingId",
                          isNull,
                        ),
                      ),
                  named: "options",
                ),
              ),
              mockFirebaseClient.app(
                argThat(
                  isA<String>().having(
                    (final String name) => name,
                    "name",
                    "TEST_APP_ID",
                  ),
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
          mockFirebaseClient.initializeApp(
            name: anyNamed("name"),
            options: anyNamed("options"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final FirebaseService service =
            container.refresh(firebaseServiceProvider.notifier);

        expect(service.debugState, isEmpty);

        await expectLater(
          service.setUp(
            apiKey: "TEST_API_KEY",
            appId: "TEST_APP_ID",
            messagingSenderId: "TEST_MESSAGING_SENDER_ID",
            projectId: "TEST_PROJECT_ID",
          ),
          throwsA(
            isException.having(
              (final Exception exception) => exception.toString(),
              "message",
              equals("Exception: MOCKED EXCEPTION"),
            ),
          ),
        );

        expect(service.debugState, isEmpty);

        verify(
          mockFirebaseClient.initializeApp(
            name: argThat(
              isA<String>().having(
                (final String name) => name,
                "name",
                equals("TEST_APP_ID"),
              ),
              named: "name",
            ),
            options: argThat(
              isA<FirebaseOptions>()
                  .having(
                    (final FirebaseOptions options) => options.androidClientId,
                    "options.androidClientId",
                    isA<String?>().having(
                      (final String? androidClientId) => androidClientId,
                      "androidClientId",
                      isNull,
                    ),
                  )
                  .having(
                    (final FirebaseOptions options) => options.apiKey,
                    "options.apiKey",
                    isA<String>().having(
                      (final String apiKey) => apiKey,
                      "apiKey",
                      equals("TEST_API_KEY"),
                    ),
                  )
                  .having(
                    (final FirebaseOptions options) => options.appGroupId,
                    "options.appGroupId",
                    isA<String?>().having(
                      (final String? appGroupId) => appGroupId,
                      "appGroupId",
                      isNull,
                    ),
                  )
                  .having(
                    (final FirebaseOptions options) => options.appId,
                    "options.appId",
                    isA<String>().having(
                      (final String appId) => appId,
                      "appId",
                      equals("TEST_APP_ID"),
                    ),
                  )
                  .having(
                    (final FirebaseOptions options) => options.authDomain,
                    "options.authDomain",
                    isA<String?>().having(
                      (final String? authDomain) => authDomain,
                      "authDomain",
                      isNull,
                    ),
                  )
                  .having(
                    (final FirebaseOptions options) => options.databaseURL,
                    "options.databaseURL",
                    isA<String?>().having(
                      (final String? databaseURL) => databaseURL,
                      "databaseURL",
                      isNull,
                    ),
                  )
                  .having(
                    (final FirebaseOptions options) =>
                        options.deepLinkURLScheme,
                    "options.deepLinkURLScheme",
                    isA<String?>().having(
                      (final String? deepLinkURLScheme) => deepLinkURLScheme,
                      "deepLinkURLScheme",
                      isNull,
                    ),
                  )
                  .having(
                    (final FirebaseOptions options) => options.iosBundleId,
                    "options.iosBundleId",
                    isA<String?>().having(
                      (final String? iosBundleId) => iosBundleId,
                      "iosBundleId",
                      isNull,
                    ),
                  )
                  .having(
                    (final FirebaseOptions options) => options.iosClientId,
                    "options.iosClientId",
                    isA<String?>().having(
                      (final String? iosClientId) => iosClientId,
                      "iosClientId",
                      isNull,
                    ),
                  )
                  .having(
                    (final FirebaseOptions options) => options.measurementId,
                    "options.measurementId",
                    isA<String?>().having(
                      (final String? measurementId) => measurementId,
                      "measurementId",
                      isNull,
                    ),
                  )
                  .having(
                    (final FirebaseOptions options) =>
                        options.messagingSenderId,
                    "options.messagingSenderId",
                    isA<String>().having(
                      (final String messagingSenderId) => messagingSenderId,
                      "messagingSenderId",
                      equals("TEST_MESSAGING_SENDER_ID"),
                    ),
                  )
                  .having(
                    (final FirebaseOptions options) => options.projectId,
                    "options.projectId",
                    isA<String>().having(
                      (final String projectId) => projectId,
                      "projectId",
                      equals("TEST_PROJECT_ID"),
                    ),
                  )
                  .having(
                    (final FirebaseOptions options) => options.storageBucket,
                    "options.storageBucket",
                    isA<String?>().having(
                      (final String? storageBucket) => storageBucket,
                      "storageBucket",
                      isNull,
                    ),
                  )
                  .having(
                    (final FirebaseOptions options) => options.trackingId,
                    "options.trackingId",
                    isA<String?>().having(
                      (final String? trackingId) => trackingId,
                      "trackingId",
                      isNull,
                    ),
                  ),
              named: "options",
            ),
          ),
        ).called(1);

        verifyNever(
          mockFirebaseClient.app(any),
        );
      });
    });
  });
}
