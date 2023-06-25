import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'atomic_widget_method_channel.dart';

// ignore: public_member_api_docs
abstract class AtomicWidgetPlatform extends PlatformInterface {
  /// Constructs a AtomicWidgetPlatform.
  AtomicWidgetPlatform() : super(token: _token);

  static final Object _token = Object();

  static AtomicWidgetPlatform _instance = MethodChannelAtomicWidget();

  /// The default instance of [AtomicWidgetPlatform] to use.
  ///
  /// Defaults to [MethodChannelAtomicWidget].
  static AtomicWidgetPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AtomicWidgetPlatform] when
  /// they register themselves.
  static set instance(final AtomicWidgetPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
