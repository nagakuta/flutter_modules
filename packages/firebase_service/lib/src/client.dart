import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod/riverpod.dart';

/// Firebase Client
abstract class FirebaseClient {
  /// Returns a list of all [FirebaseApp] instances that have been created.
  List<FirebaseApp> get apps;

  /// Initializes a new [FirebaseApp] instance by [name] and [options]
  /// and returns the created app.
  Future<FirebaseApp> initializeApp({
    final String? name,
    final FirebaseOptions? options,
  });

  /// Returns a [FirebaseApp] instance.
  FirebaseApp app(final String name);
}

/// ignore: public_member_api_docs
class FirebaseClientImpl implements FirebaseClient {
  // ignore: public_member_api_docs
  const FirebaseClientImpl();

  @override
  List<FirebaseApp> get apps => Firebase.apps;

  @override
  Future<FirebaseApp> initializeApp({
    final String? name,
    final FirebaseOptions? options,
  }) =>
      Firebase.initializeApp(name: name, options: options);

  @override
  FirebaseApp app(final String name) => Firebase.app(name);
}

/// FirebaseClient Provider
final Provider<FirebaseClient> firebaseClientProvider =
    Provider<FirebaseClient>(
  (final _) => const FirebaseClientImpl(),
);
