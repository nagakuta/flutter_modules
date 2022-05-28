import 'package:crashlytics_service/src/client.dart';
import 'package:crashlytics_service/src/service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';

import 'client.mocks.dart';

void main() {
  group("CrashlyticsService", () {
    final MockCrashlyticsClient mockCrashlyticsClient = MockCrashlyticsClient();

    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        crashlyticsClientProvider.overrideWithValue(mockCrashlyticsClient),
      ],
    );

    setUp(() {
      reset(mockCrashlyticsClient);
    });

    group("recordException", skip: true, () {
      setUp(() {
        when(
          mockCrashlyticsClient.recordError(
            any,
            any,
            reason: anyNamed("reason"),
            information: anyNamed("information"),
            printDetails: anyNamed("printDetails"),
            fatal: anyNamed("fatal"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () {
        final CrashlyticsService service =
            container.refresh(crashlyticsServiceProvider);

        try {
          service.recordException(
            Exception("MOCKED RECORDABLE EXCEPTION"),
            null,
          );

          verify(
            mockCrashlyticsClient.recordError(
              argThat(
                isException.having(
                  (final Exception exception) => exception.toString(),
                  "message",
                  equals("Exception: MOCKED RECORDABLE EXCEPTION"),
                ),
              ),
              argThat(
                isA<StackTrace?>().having(
                  (final StackTrace? stackTrace) => stackTrace,
                  "stackTrace",
                  isNull,
                ),
              ),
              reason: argThat(
                isA<Object?>().having(
                  (final Object? reason) => reason,
                  "reason",
                  equals("Exception: MOCKED RECORDABLE EXCEPTION"),
                ),
                named: "reason",
              ),
              information: argThat(
                isA<Iterable<DiagnosticsNode>?>().having(
                  (final Iterable<DiagnosticsNode>? information) => information,
                  "information",
                  isEmpty,
                ),
                named: "information",
              ),
              printDetails: argThat(
                isA<bool?>().having(
                  (final bool? printDetails) => printDetails,
                  "printDetails",
                  isTrue,
                ),
                named: "printDetails",
              ),
              fatal: argThat(
                isA<bool?>().having(
                  (final bool? fatal) => fatal,
                  "fatal",
                  isFalse,
                ),
                named: "fatal",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () {
        when(
          mockCrashlyticsClient.recordError(
            any,
            any,
            reason: anyNamed("reason"),
            information: anyNamed("information"),
            printDetails: anyNamed("printDetails"),
            fatal: anyNamed("fatal"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final CrashlyticsService service =
            container.refresh(crashlyticsServiceProvider);

        expect(
          () => service.recordException(
            Exception("MOCKED RECORDABLE EXCEPTION"),
            null,
          ),
          throwsA(
            isException.having(
              (final Exception exception) => exception.toString(),
              "message",
              equals("Exception: MOCKED EXCEPTION"),
            ),
          ),
        );

        verify(
          mockCrashlyticsClient.recordError(
            argThat(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED RECORDABLE EXCEPTION"),
              ),
            ),
            argThat(
              isA<StackTrace?>().having(
                (final StackTrace? stackTrace) => stackTrace,
                "stackTrace",
                isNull,
              ),
            ),
            reason: argThat(
              isA<Object?>().having(
                (final Object? reason) => reason,
                "reason",
                equals("Exception: MOCKED RECORDABLE EXCEPTION"),
              ),
              named: "reason",
            ),
            information: argThat(
              isA<Iterable<DiagnosticsNode>?>().having(
                (final Iterable<DiagnosticsNode>? information) => information,
                "information",
                isEmpty,
              ),
              named: "information",
            ),
            printDetails: argThat(
              isA<bool?>().having(
                (final bool? printDetails) => printDetails,
                "printDetails",
                isTrue,
              ),
              named: "printDetails",
            ),
            fatal: argThat(
              isA<bool?>().having(
                (final bool? fatal) => fatal,
                "fatal",
                isFalse,
              ),
              named: "fatal",
            ),
          ),
        ).called(1);
      });
    });

    group("recordError", skip: true, () {
      setUp(() {
        when(
          mockCrashlyticsClient.recordError(
            any,
            any,
            reason: anyNamed("reason"),
            information: anyNamed("information"),
            printDetails: anyNamed("printDetails"),
            fatal: anyNamed("fatal"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () {
        final CrashlyticsService service =
            container.refresh(crashlyticsServiceProvider);

        try {
          service.recordError(
            UnimplementedError("MOCKED RECORDABLE ERROR"),
            null,
          );

          verify(
            mockCrashlyticsClient.recordError(
              argThat(
                isUnimplementedError.having(
                  (final UnimplementedError error) => error.toString(),
                  "message",
                  equals("UnimplementedError: MOCKED RECORDABLE ERROR"),
                ),
              ),
              argThat(
                isA<StackTrace?>().having(
                  (final StackTrace? stackTrace) => stackTrace,
                  "stackTrace",
                  isNull,
                ),
              ),
              reason: argThat(
                isA<Object?>().having(
                  (final Object? reason) => reason,
                  "reason",
                  equals("UnimplementedError: MOCKED RECORDABLE ERROR"),
                ),
                named: "reason",
              ),
              information: argThat(
                isA<Iterable<DiagnosticsNode>?>().having(
                  (final Iterable<DiagnosticsNode>? information) => information,
                  "information",
                  isEmpty,
                ),
                named: "information",
              ),
              printDetails: argThat(
                isA<bool?>().having(
                  (final bool? printDetails) => printDetails,
                  "printDetails",
                  isTrue,
                ),
                named: "printDetails",
              ),
              fatal: argThat(
                isA<bool?>().having(
                  (final bool? fatal) => fatal,
                  "fatal",
                  isTrue,
                ),
                named: "fatal",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () {
        when(
          mockCrashlyticsClient.recordError(
            any,
            any,
            reason: anyNamed("reason"),
            information: anyNamed("information"),
            printDetails: anyNamed("printDetails"),
            fatal: anyNamed("fatal"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final CrashlyticsService service =
            container.refresh(crashlyticsServiceProvider);

        expect(
          () => service.recordError(
            UnimplementedError("MOCKED RECORDABLE ERROR"),
            null,
          ),
          throwsA(
            isException.having(
              (final Exception exception) => exception.toString(),
              "message",
              equals("Exception: MOCKED EXCEPTION"),
            ),
          ),
        );

        verify(
          mockCrashlyticsClient.recordError(
            argThat(
              isUnimplementedError.having(
                (final UnimplementedError error) => error.toString(),
                "message",
                equals("UnimplementedError: MOCKED RECORDABLE ERROR"),
              ),
            ),
            argThat(
              isA<StackTrace?>().having(
                (final StackTrace? stackTrace) => stackTrace,
                "stackTrace",
                isNull,
              ),
            ),
            reason: argThat(
              isA<Object?>().having(
                (final Object? reason) => reason,
                "reason",
                equals("UnimplementedError: MOCKED RECORDABLE ERROR"),
              ),
              named: "reason",
            ),
            information: argThat(
              isA<Iterable<DiagnosticsNode>?>().having(
                (final Iterable<DiagnosticsNode>? information) => information,
                "information",
                isEmpty,
              ),
              named: "information",
            ),
            printDetails: argThat(
              isA<bool?>().having(
                (final bool? printDetails) => printDetails,
                "printDetails",
                isTrue,
              ),
              named: "printDetails",
            ),
            fatal: argThat(
              isA<bool?>().having(
                (final bool? fatal) => fatal,
                "fatal",
                isTrue,
              ),
              named: "fatal",
            ),
          ),
        ).called(1);
      });
    });

    group("recordFlutterError", skip: true, () {
      setUp(() {
        when(
          mockCrashlyticsClient.recordFlutterError(any),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () {
        final CrashlyticsService service =
            container.refresh(crashlyticsServiceProvider);

        try {
          service.recordFlutterError(
            FlutterErrorDetails(
              exception: Exception("MOCKED RECORDABLE EXCEPTION"),
            ),
          );

          verify(
            mockCrashlyticsClient.recordFlutterError(
              argThat(
                isA<FlutterErrorDetails>().having(
                  (final FlutterErrorDetails details) =>
                      details.exceptionAsString(),
                  "message",
                  equals("Exception: MOCKED RECORDABLE EXCEPTION"),
                ),
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () {
        when(
          mockCrashlyticsClient.recordFlutterError(
            argThat(
              isA<FlutterErrorDetails>().having(
                (final FlutterErrorDetails details) =>
                    details.exceptionAsString(),
                "message",
                equals("Exception: MOCKED RECORDABLE EXCEPTION"),
              ),
            ),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final CrashlyticsService service =
            container.refresh(crashlyticsServiceProvider);

        expect(
          () => service.recordFlutterError(
            FlutterErrorDetails(
              exception: Exception("MOCKED RECORDABLE EXCEPTION"),
            ),
          ),
          throwsA(
            isException.having(
              (final Exception exception) => exception.toString(),
              "message",
              equals("Exception: MOCKED EXCEPTION"),
            ),
          ),
        );

        verify(
          mockCrashlyticsClient.recordFlutterError(
            argThat(
              isA<FlutterErrorDetails>().having(
                (final FlutterErrorDetails details) =>
                    details.exceptionAsString(),
                "message",
                equals("Exception: MOCKED RECORDABLE EXCEPTION"),
              ),
            ),
          ),
        ).called(1);
      });
    });

    group("setUserIdentifier", () {
      setUp(() {
        when(
          mockCrashlyticsClient.setUserIdentifier(any),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () {
        final CrashlyticsService service =
            container.refresh(crashlyticsServiceProvider);

        try {
          service.setUserIdentifier("TEST_USER_ID");

          verify(
            mockCrashlyticsClient.setUserIdentifier(
              argThat(
                isA<String>().having(
                  (final String identifier) => identifier,
                  "identifier",
                  equals("TEST_USER_ID"),
                ),
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () {
        when(
          mockCrashlyticsClient.setUserIdentifier(any),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final CrashlyticsService service =
            container.refresh(crashlyticsServiceProvider);

        expect(
          () => service.setUserIdentifier("TEST_USER_ID"),
          throwsA(
            isException.having(
              (final Exception exception) => exception.toString(),
              "message",
              equals("Exception: MOCKED EXCEPTION"),
            ),
          ),
        );

        verify(
          mockCrashlyticsClient.setUserIdentifier(
            argThat(
              isA<String>().having(
                (final String identifier) => identifier,
                "identifier",
                equals("TEST_USER_ID"),
              ),
            ),
          ),
        ).called(1);
      });
    });
  });
}
