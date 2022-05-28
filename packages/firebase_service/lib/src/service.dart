// ignore_for_file: constant_identifier_names, do_not_use_environment
import 'package:firebase_core/firebase_core.dart';
import 'package:logging_service/logging_service.dart';
import 'package:mockito/annotations.dart';
import 'package:riverpod/riverpod.dart';

import '/src/client.dart';

const String _API_KEY = String.fromEnvironment("FIREBASE_API_KEY");
const String _APP_ID = String.fromEnvironment("FIREBASE_APP_ID");
const String _MESSAGING_SENDER_ID =
    String.fromEnvironment("FIREBASE_MESSAGING_SENDER_ID");
const String _PROJECT_ID = String.fromEnvironment("FIREBASE_PROJECT_ID");

/// Firebase の デフォルト App を起動
Future<FirebaseApp> bootUp() async {
  try {
    return Firebase.initializeApp(
      name: _APP_ID,
      options: const FirebaseOptions(
        apiKey: _API_KEY,
        appId: _APP_ID,
        messagingSenderId: _MESSAGING_SENDER_ID,
        projectId: _PROJECT_ID,
      ),
    );
  } on FirebaseException {
    return Firebase.app(_APP_ID);
  } on Exception {
    rethrow;
  }
}

/// Firebase Service
@GenerateMocks(<Type>[FirebaseApp, FirebaseService])
class FirebaseService extends StateNotifier<Set<FirebaseApp>> {
  // ignore: public_member_api_docs
  FirebaseService({
    required final FirebaseClient firebaseClient,
    required final LoggingService loggingService,
  })  : _firebaseClient = firebaseClient,
        _loggingService = loggingService,
        super(firebaseClient.apps.toSet());

  final FirebaseClient _firebaseClient;
  final LoggingService _loggingService;

  /// Firebase の初期化
  Future<void> setUp({
    required final String apiKey,
    required final String appId,
    required final String messagingSenderId,
    required final String projectId,
    final String? authDomain,
    final String? databaseURL,
    final String? storageBucket,
    final String? measurementId,
    final String? trackingId,
    final String? deepLinkURLScheme,
    final String? androidClientId,
    final String? iosClientId,
    final String? iosBundleId,
    final String? appGroupId,
  }) async {
    if (state.isNotEmpty) {
      _loggingService.info(
        message: "FirebaseService: Firebase has initialized.",
      );
      return;
    }

    final FirebaseOptions options = FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: messagingSenderId,
      projectId: projectId,
      authDomain: authDomain,
      databaseURL: databaseURL,
      storageBucket: storageBucket,
      measurementId: measurementId,
      trackingId: trackingId,
      deepLinkURLScheme: deepLinkURLScheme,
      androidClientId: androidClientId,
      iosClientId: iosClientId,
      iosBundleId: iosBundleId,
      appGroupId: appGroupId,
    );

    try {
      final FirebaseApp app = await _firebaseClient.initializeApp(
        name: appId,
        options: options,
      );
      state.add(app);

      _loggingService.info(
        message: "FirebaseService: Initialize Firebase: ${app.toString()}",
      );
    } on FirebaseException catch (firebaseException) {
      _loggingService.warning(exception: firebaseException);

      final FirebaseApp app = _firebaseClient.app(appId);
      state.add(app);

      _loggingService.info(
        message: "FirebaseService: Set up Firebase: ${app.toString()}",
      );
    } on Exception catch (exception) {
      _loggingService.warning(exception: exception);
      rethrow;
    }
  }
}

/// FirebaseService Provider
final StateNotifierProvider<FirebaseService, Set<FirebaseApp>>
    firebaseServiceProvider =
    StateNotifierProvider<FirebaseService, Set<FirebaseApp>>(
  (final StateNotifierProviderRef<FirebaseService, Set<FirebaseApp>> ref) {
    final FirebaseClient firebaseClient = ref.watch(firebaseClientProvider);
    final LoggingService loggingService = ref.watch(loggingServiceProvider);

    return FirebaseService(
      firebaseClient: firebaseClient,
      loggingService: loggingService,
    );
  },
);
