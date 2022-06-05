// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'auth_service_platform_interface.dart';

/// A web implementation of the AuthServicePlatform of the AuthService plugin.
class AuthServiceWeb extends AuthServicePlatform {
  /// Constructs a AuthServiceWeb
  AuthServiceWeb();

  // ignore: public_member_api_docs
  static void registerWith(final Registrar registrar) {
    AuthServicePlatform.instance = AuthServiceWeb();
  }
}
