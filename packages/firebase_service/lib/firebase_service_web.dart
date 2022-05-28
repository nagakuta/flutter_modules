// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'firebase_service_platform_interface.dart';

/// A web implementation of the FirebaseServicePlatform of the
/// FirebaseService plugin.
class FirebaseServiceWeb extends FirebaseServicePlatform {
  /// Constructs a FirebaseServiceWeb
  FirebaseServiceWeb();

  // ignore: public_member_api_docs
  static void registerWith(final Registrar registrar) {
    FirebaseServicePlatform.instance = FirebaseServiceWeb();
  }
}
