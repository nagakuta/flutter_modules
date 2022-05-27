import 'package:riverpod/riverpod.dart';

import '/src/client.dart';
import '/src/option.dart';

/// Logging Service
abstract class LoggingService {
  /// ログ情報を表示
  void log(final LogOption option);

  /// `Level.SHOUT` のログを表示
  void shout({
    required final Object error,
    final StackTrace? stackTrace,
  });

  /// `Level.SEVERE` のログを表示
  void severe({
    required final Object error,
    final StackTrace? stackTrace,
  });

  /// `Level.WARNING` のログを表示
  void warning({
    required final Exception exception,
    final StackTrace? stackTrace,
  });

  /// `Level.INFO` のログを表示
  void info({required final String message});
}

/// ignore: public_member_api_docs
class LoggingServiceImpl implements LoggingService {
  /// ignore: public_member_api_docs
  const LoggingServiceImpl({
    required final LoggingClient loggingClient,
  }) : _loggingClient = loggingClient;

  final LoggingClient _loggingClient;

  @override
  void log(final LogOption option) => option.when(
        shout: (
          final Object error,
          final StackTrace? stackTrace,
        ) =>
            _loggingClient.shout(
          error.toString(),
          error,
          stackTrace,
        ),
        severe: (
          final Object error,
          final StackTrace? stackTrace,
        ) =>
            _loggingClient.severe(
          error.toString(),
          error,
          stackTrace,
        ),
        warning: (
          final Exception exception,
          final StackTrace? stackTrace,
        ) =>
            _loggingClient.warning(
          exception.toString(),
          exception,
          stackTrace,
        ),
        info: _loggingClient.info,
      );

  @override
  void shout({
    required final Object error,
    final StackTrace? stackTrace,
  }) =>
      _loggingClient.shout(
        error.toString(),
        error,
        stackTrace,
      );

  @override
  void severe({
    required final Object error,
    final StackTrace? stackTrace,
  }) =>
      _loggingClient.severe(
        error.toString(),
        error,
        stackTrace,
      );

  @override
  void warning({
    required final Exception exception,
    final StackTrace? stackTrace,
  }) =>
      _loggingClient.warning(
        exception.toString(),
        exception,
        stackTrace,
      );

  @override
  void info({required final String message}) => _loggingClient.info(message);
}

/// LoggingService Provider
final Provider<LoggingService> loggingServiceProvider =
    Provider<LoggingService>(
  (final ProviderRef<LoggingService> ref) {
    final LoggingClient loggingClient = ref.watch(loggingClientProvider);
    return LoggingServiceImpl(loggingClient: loggingClient);
  },
);
