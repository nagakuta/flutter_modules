import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'adaptive_widget_method_channel.dart';

// ignore: avoid_classes_with_only_static_members, public_member_api_docs
abstract class AdaptiveWidgetPlatform extends PlatformInterface {
  /// Constructs a AdaptiveWidgetPlatform.
  AdaptiveWidgetPlatform() : super(token: _token);

  static final Object _token = Object();

  static AdaptiveWidgetPlatform _instance = MethodChannelAdaptiveWidget();

  /// The default instance of [AdaptiveWidgetPlatform] to use.
  ///
  /// Defaults to [MethodChannelAdaptiveWidget].
  static AdaptiveWidgetPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AdaptiveWidgetPlatform] when
  /// they register themselves.
  static set instance(final AdaptiveWidgetPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
