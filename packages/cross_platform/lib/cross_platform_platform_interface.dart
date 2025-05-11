import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'cross_platform_method_channel.dart';

// ignore: public_member_api_docs
abstract class CrossPlatformPlatform extends PlatformInterface {
  /// Constructs a CrossPlatformPlatform.
  CrossPlatformPlatform() : super(token: _token);

  static final Object _token = Object();

  static CrossPlatformPlatform _instance = MethodChannelCrossPlatform();

  /// The default instance of [CrossPlatformPlatform] to use.
  ///
  /// Defaults to [MethodChannelCrossPlatform].
  static CrossPlatformPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CrossPlatformPlatform] when
  /// they register themselves.
  static set instance(final CrossPlatformPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
