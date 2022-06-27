import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

/// Crashlytics Client
abstract class CrashlyticsClient {
  /// Submits a Crashlytics report of a caught error.
  Future<void> recordError(
    final Object exception,
    final StackTrace? stack, {
    final Object? reason,
    final Iterable<DiagnosticsNode> information = const <DiagnosticsNode>[],
    final bool? printDetails,
    final bool fatal = false,
  });

  /// Submits a Crashlytics report of a non-fatal error caught by the
  /// Flutter framework.
  Future<void> recordFlutterError(
    final FlutterErrorDetails flutterErrorDetails,
  );

  /// Logs a message that's included in the next fatal or non-fatal report.
  Future<void> log(final String message);

  /// Enables/disables automatic data collection by Crashlytics.
  // ignore: avoid_positional_boolean_parameters
  Future<void> setCrashlyticsCollectionEnabled(final bool enabled);

  /// Records a user ID (identifier) that's associated with subsequent fatal
  /// and non-fatal reports.
  Future<void> setUserIdentifier(final String identifier);
}

// ignore: public_member_api_docs
class CrashlyticsClientImpl implements CrashlyticsClient {
  // ignore: public_member_api_docs
  const CrashlyticsClientImpl({
    required final FirebaseCrashlytics crashlytics,
  }) : _crashlytics = crashlytics;

  final FirebaseCrashlytics _crashlytics;

  @override
  Future<void> recordError(
    final Object exception,
    final StackTrace? stack, {
    final Object? reason,
    final Iterable<DiagnosticsNode> information = const <DiagnosticsNode>[],
    final bool? printDetails,
    final bool fatal = false,
  }) =>
      _crashlytics.recordError(
        exception,
        stack,
        reason: reason,
        information: information,
        printDetails: printDetails,
        fatal: fatal,
      );

  @override
  Future<void> recordFlutterError(
    final FlutterErrorDetails flutterErrorDetails,
  ) =>
      _crashlytics.recordFlutterError(flutterErrorDetails);

  @override
  Future<void> log(final String message) => _crashlytics.log(message);

  @override
  Future<void> setCrashlyticsCollectionEnabled(final bool enabled) =>
      _crashlytics.setCrashlyticsCollectionEnabled(enabled);

  @override
  Future<void> setUserIdentifier(final String identifier) =>
      _crashlytics.setUserIdentifier(identifier);
}

/// CrashlyticsClient Provider
final Provider<CrashlyticsClient> crashlyticsClientProvider =
    Provider<CrashlyticsClient>(
  (final _) {
    final FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;

    if (!kIsWeb) {
      crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);
    }

    return CrashlyticsClientImpl(crashlytics: crashlytics);
  },
);
