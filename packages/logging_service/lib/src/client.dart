import 'dart:async';
import 'dart:developer';

import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';

/// Logging Client
abstract class LoggingClient {
  /// Returns a stream of messages added to this [Logger].
  Stream<LogRecord> get onRecord;

  /// Adds a log record for a [message] at a particular [logLevel]
  /// if `isLoggable(logLevel)` is true.
  void log(
    final Level logLevel,
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
    final Zone? zone,
  ]);

  /// Log message at level [Level.SHOUT].
  void shout(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]);

  /// Log message at level [Level.SEVERE].
  void severe(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]);

  /// Log message at level [Level.WARNING].
  void warning(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]);

  /// Log message at level [Level.INFO].
  void info(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]);

  /// Log message at level [Level.CONFIG].
  void config(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]);

  /// Log message at level [Level.FINE].
  void fine(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]);

  /// Log message at level [Level.FINER].
  void finer(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]);

  /// Log message at level [Level.FINEST].
  void finest(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]);
}

// ignore: public_member_api_docs
class LoggingClientImpl implements LoggingClient {
  // ignore: public_member_api_docs
  LoggingClientImpl({
    required final Logger logger,
  }) : _logger = logger;

  final Logger _logger;

  @override
  Stream<LogRecord> get onRecord => _logger.onRecord;

  @override
  void log(
    final Level logLevel,
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
    final Zone? zone,
  ]) =>
      _logger.log(
        logLevel,
        message,
        error,
        stackTrace,
        zone,
      );

  @override
  void shout(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) =>
      _logger.shout(
        message,
        error,
        stackTrace,
      );

  @override
  void severe(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) =>
      _logger.severe(
        message,
        error,
        stackTrace,
      );

  @override
  void warning(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) =>
      _logger.warning(
        message,
        error,
        stackTrace,
      );

  @override
  void info(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) =>
      _logger.info(
        message,
        error,
        stackTrace,
      );

  @override
  void config(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) =>
      _logger.config(
        message,
        error,
        stackTrace,
      );

  @override
  void fine(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) =>
      _logger.fine(
        message,
        error,
        stackTrace,
      );

  @override
  void finer(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) =>
      _logger.finer(
        message,
        error,
        stackTrace,
      );

  @override
  void finest(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) =>
      _logger.finest(
        message,
        error,
        stackTrace,
      );
}

/// LoggingClient Provider
final Provider<LoggingClient> loggingClientProvider = Provider<LoggingClient>(
  (final _) {
    final Logger logger = Logger.root
      ..level = Level.ALL
      ..onRecord.listen(
        (final LogRecord event) {
          if (event.level == Level.SHOUT) {
            log("🚨 ${event.message}");
          } else if (event.level == Level.SEVERE) {
            log("‼️ ${event.message}");
          } else if (event.level == Level.WARNING) {
            log("⚠️ ${event.message}");
          } else if (event.level == Level.INFO) {
            log("👀 ${event.message}");
          } else {
            log(event.message);
          }
        },
      );

    return LoggingClientImpl(logger: logger);
  },
);
