// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

// ignore_for_file: public_member_api_docs

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'adaptive_widget_platform_interface.dart';

/// A web implementation of the AdaptiveWidgetPlatform of the AdaptiveWidget plugin.
class AdaptiveWidgetWeb extends AdaptiveWidgetPlatform {
  /// Constructs a AdaptiveWidgetWeb
  AdaptiveWidgetWeb();

  static void registerWith(final Registrar registrar) {
    AdaptiveWidgetPlatform.instance = AdaptiveWidgetWeb();
  }
}
