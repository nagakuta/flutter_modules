import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logging_service/logging_service.dart';
import 'package:mockito/annotations.dart';
import 'package:riverpod/riverpod.dart';

import 'client.dart';

/// Crashlytics Service
@GenerateMocks(<Type>[CrashlyticsService])
abstract class CrashlyticsService {
  /// 例外を記録
  void recordException(
    final Exception exception,
    final StackTrace? stack, {
    final Iterable<DiagnosticsNode> information = const <DiagnosticsNode>[],
  });

  /// エラーを記録
  void recordError(
    final Object error,
    final StackTrace? stack, {
    final Iterable<DiagnosticsNode> information = const <DiagnosticsNode>[],
  });

  /// Flutter framework が投げた例外を記録
  void recordFlutterError(
    final FlutterErrorDetails flutterErrorDetails,
  );

  /// ユーザ ID を記録
  void setUserIdentifier(final String identifier);
}

// ignore: public_member_api_docs
class CrashlyticsServiceImpl implements CrashlyticsService {
  // ignore: public_member_api_docs
  const CrashlyticsServiceImpl({
    required final CrashlyticsClient crashlyticsClient,
    required final LoggingService loggingService,
  })  : _crashlyticsClient = crashlyticsClient,
        _loggingService = loggingService;

  final CrashlyticsClient _crashlyticsClient;
  final LoggingService _loggingService;

  @override
  void recordException(
    final Exception exception,
    final StackTrace? stack, {
    final Iterable<DiagnosticsNode> information = const <DiagnosticsNode>[],
  }) {
    if (!kDebugMode) {
      unawaited(
        _crashlyticsClient.recordError(
          exception,
          stack,
          reason: exception.toString(),
          information: information,
          printDetails: kDebugMode,
        ),
      );
    } else {
      _loggingService.warning(
        exception: exception,
        stackTrace: stack,
      );
    }
  }

  @override
  void recordError(
    final Object error,
    final StackTrace? stack, {
    final Iterable<DiagnosticsNode> information = const <DiagnosticsNode>[],
  }) {
    if (!kDebugMode) {
      unawaited(
        _crashlyticsClient.recordError(
          error,
          stack,
          reason: error.toString(),
          information: information,
          printDetails: kDebugMode,
          fatal: true,
        ),
      );
    } else {
      _loggingService.severe(
        error: error,
        stackTrace: stack,
      );
    }
  }

  @override
  void recordFlutterError(
    final FlutterErrorDetails flutterErrorDetails,
  ) {
    if (!kDebugMode) {
      unawaited(
        _crashlyticsClient.recordFlutterError(flutterErrorDetails),
      );
    } else {
      _loggingService.shout(
        error: flutterErrorDetails.exception,
        stackTrace: flutterErrorDetails.stack,
      );
    }
  }

  @override
  void setUserIdentifier(final String identifier) {
    unawaited(
      _crashlyticsClient.setUserIdentifier(identifier),
    );

    _loggingService.info(
      message: "CrashlyticsService: Record user id ($identifier)",
    );
  }
}

/// CrashlyticsService Provider
final Provider<CrashlyticsService> crashlyticsServiceProvider =
    Provider<CrashlyticsService>(
  (final ProviderRef<CrashlyticsService> ref) {
    final CrashlyticsClient crashlyticsClient =
        ref.watch(crashlyticsClientProvider);
    final LoggingService loggingService = ref.watch(loggingServiceProvider);

    return CrashlyticsServiceImpl(
      crashlyticsClient: crashlyticsClient,
      loggingService: loggingService,
    );
  },
);
