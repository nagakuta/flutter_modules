import 'package:logging_service/src/client.dart';
import 'package:logging_service/src/option.dart';
import 'package:logging_service/src/service.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

import 'client.mocks.dart';

void main() {
  group("LoggingService", () {
    final MockLoggingClient mockLoggingClient = MockLoggingClient();

    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        loggingClientProvider.overrideWithValue(mockLoggingClient),
      ],
    );

    setUp(() {
      reset(mockLoggingClient);
    });

    group("log", () {
      group("SHOUT", () {
        test("succeed", () {
          final LoggingService service =
              container.refresh(loggingServiceProvider);

          try {
            service.log(
              ShoutLogOption(
                error: ArgumentError(),
              ),
            );

            verify(
              mockLoggingClient.shout(
                argThat(
                  isA<String>().having(
                    (final String message) => message,
                    "message",
                    equals("Invalid argument(s)"),
                  ),
                ),
                argThat(isArgumentError),
                argThat(isNull),
              ),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () {
          when(
            mockLoggingClient.shout(
              any,
              any,
              any,
            ),
          ).thenThrow(
            Exception("MOCKED EXCEPTION"),
          );

          final LoggingService service =
              container.refresh(loggingServiceProvider);

          expect(
            () => service.log(
              ShoutLogOption(
                error: ArgumentError(),
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
            mockLoggingClient.shout(
              argThat(
                isA<String>().having(
                  (final String message) => message,
                  "message",
                  equals("Invalid argument(s)"),
                ),
              ),
              argThat(isArgumentError),
              argThat(isNull),
            ),
          ).called(1);
        });
      });

      group("SEVERE", () {
        test("succeed", () {
          final LoggingService service =
              container.refresh(loggingServiceProvider);

          try {
            service.log(
              SevereLogOption(
                error: ArgumentError(),
              ),
            );

            verify(
              mockLoggingClient.severe(
                argThat(
                  isA<String>().having(
                    (final String message) => message,
                    "message",
                    equals("Invalid argument(s)"),
                  ),
                ),
                argThat(isArgumentError),
                argThat(isNull),
              ),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () {
          when(
            mockLoggingClient.severe(
              any,
              any,
              any,
            ),
          ).thenThrow(
            Exception("MOCKED EXCEPTION"),
          );

          final LoggingService service =
              container.refresh(loggingServiceProvider);

          expect(
            () => service.log(
              SevereLogOption(
                error: ArgumentError(),
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
            mockLoggingClient.severe(
              argThat(
                isA<String>().having(
                  (final String message) => message,
                  "message",
                  equals("Invalid argument(s)"),
                ),
              ),
              argThat(isArgumentError),
              argThat(isNull),
            ),
          ).called(1);
        });
      });

      group("WARNING", () {
        test("succeed", () {
          final LoggingService service =
              container.refresh(loggingServiceProvider);

          try {
            service.log(
              WarningLogOption(
                exception: Exception(),
              ),
            );

            verify(
              mockLoggingClient.warning(
                argThat(
                  isA<String>().having(
                    (final String message) => message,
                    "message",
                    equals("Exception"),
                  ),
                ),
                argThat(isException),
                argThat(isNull),
              ),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () {
          when(
            mockLoggingClient.warning(
              any,
              any,
              any,
            ),
          ).thenThrow(
            Exception("MOCKED EXCEPTION"),
          );

          final LoggingService service =
              container.refresh(loggingServiceProvider);

          expect(
            () => service.log(
              WarningLogOption(
                exception: Exception(),
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
            mockLoggingClient.warning(
              argThat(
                isA<String>().having(
                  (final String message) => message,
                  "message",
                  equals("Exception"),
                ),
              ),
              argThat(isException),
              argThat(isNull),
            ),
          ).called(1);
        });
      });

      group("INFO", () {
        test("succeed", () {
          final LoggingService service =
              container.refresh(loggingServiceProvider);

          try {
            service.log(
              const InfoLogOption(
                message: "MESSAGE",
              ),
            );

            verify(
              mockLoggingClient.info(
                argThat(
                  isA<String>().having(
                    (final String message) => message,
                    "message",
                    equals("MESSAGE"),
                  ),
                ),
                argThat(isNull),
                argThat(isNull),
              ),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () {
          when(
            mockLoggingClient.info(
              any,
              any,
              any,
            ),
          ).thenThrow(
            Exception("MOCKED EXCEPTION"),
          );

          final LoggingService service =
              container.refresh(loggingServiceProvider);

          expect(
            () => service.log(
              const InfoLogOption(
                message: "MESSAGE",
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
            mockLoggingClient.info(
              argThat(
                isA<String>().having(
                  (final String message) => message,
                  "message",
                  equals("MESSAGE"),
                ),
              ),
              argThat(isNull),
              argThat(isNull),
            ),
          ).called(1);
        });
      });
    });

    group("shout", () {
      test("succeed", () {
        final LoggingService service =
            container.refresh(loggingServiceProvider);

        try {
          service.shout(error: ArgumentError());

          verify(
            mockLoggingClient.shout(
              argThat(
                isA<String>().having(
                  (final String message) => message,
                  "message",
                  equals("Invalid argument(s)"),
                ),
              ),
              argThat(isArgumentError),
              argThat(isNull),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () {
        when(
          mockLoggingClient.shout(
            any,
            any,
            any,
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final LoggingService service =
            container.refresh(loggingServiceProvider);

        expect(
          () => service.shout(error: ArgumentError()),
          throwsA(
            isException.having(
              (final Exception exception) => exception.toString(),
              "message",
              equals("Exception: MOCKED EXCEPTION"),
            ),
          ),
        );

        verify(
          mockLoggingClient.shout(
            argThat(
              isA<String>().having(
                (final String message) => message,
                "message",
                equals("Invalid argument(s)"),
              ),
            ),
            argThat(isArgumentError),
            argThat(isNull),
          ),
        ).called(1);
      });
    });

    group("severe", () {
      test("succeed", () {
        final LoggingService service =
            container.refresh(loggingServiceProvider);

        try {
          service.severe(error: ArgumentError());

          verify(
            mockLoggingClient.severe(
              argThat(
                isA<String>().having(
                  (final String message) => message,
                  "message",
                  equals("Invalid argument(s)"),
                ),
              ),
              argThat(isArgumentError),
              argThat(isNull),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () {
        when(
          mockLoggingClient.severe(
            any,
            any,
            any,
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final LoggingService service =
            container.refresh(loggingServiceProvider);

        expect(
          () => service.severe(error: ArgumentError()),
          throwsA(
            isException.having(
              (final Exception exception) => exception.toString(),
              "message",
              equals("Exception: MOCKED EXCEPTION"),
            ),
          ),
        );

        verify(
          mockLoggingClient.severe(
            argThat(
              isA<String>().having(
                (final String message) => message,
                "message",
                equals("Invalid argument(s)"),
              ),
            ),
            argThat(isArgumentError),
            argThat(isNull),
          ),
        ).called(1);
      });
    });

    group("warning", () {
      test("succeed", () {
        final LoggingService service =
            container.refresh(loggingServiceProvider);

        try {
          service.warning(exception: Exception());

          verify(
            mockLoggingClient.warning(
              argThat(
                isA<String>().having(
                  (final String message) => message,
                  "message",
                  equals("Exception"),
                ),
              ),
              argThat(isException),
              argThat(isNull),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () {
        when(
          mockLoggingClient.warning(
            any,
            any,
            any,
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final LoggingService service =
            container.refresh(loggingServiceProvider);

        expect(
          () => service.warning(exception: Exception()),
          throwsA(
            isException.having(
              (final Exception exception) => exception.toString(),
              "message",
              equals("Exception: MOCKED EXCEPTION"),
            ),
          ),
        );

        verify(
          mockLoggingClient.warning(
            argThat(
              isA<String>().having(
                (final String message) => message,
                "message",
                equals("Exception"),
              ),
            ),
            argThat(isException),
            argThat(isNull),
          ),
        ).called(1);
      });
    });

    group("info", () {
      test("succeed", () {
        final LoggingService service =
            container.refresh(loggingServiceProvider);

        try {
          service.info(message: "MESSAGE");

          verify(
            mockLoggingClient.info(
              argThat(
                isA<String>().having(
                  (final String message) => message,
                  "message",
                  equals("MESSAGE"),
                ),
              ),
              argThat(isNull),
              argThat(isNull),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () {
        when(
          mockLoggingClient.info(
            any,
            any,
            any,
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final LoggingService service =
            container.refresh(loggingServiceProvider);

        expect(
          () => service.info(message: "MESSAGE"),
          throwsA(
            isException.having(
              (final Exception exception) => exception.toString(),
              "message",
              equals("Exception: MOCKED EXCEPTION"),
            ),
          ),
        );

        verify(
          mockLoggingClient.info(
            argThat(
              isA<String>().having(
                (final String message) => message,
                "message",
                equals("MESSAGE"),
              ),
            ),
            argThat(isNull),
            argThat(isNull),
          ),
        ).called(1);
      });
    });
  });
}
