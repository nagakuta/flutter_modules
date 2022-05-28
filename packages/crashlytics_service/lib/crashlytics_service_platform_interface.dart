import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'crashlytics_service_method_channel.dart';

// ignore: public_member_api_docs
abstract class CrashlyticsServicePlatform extends PlatformInterface {
  /// Constructs a CrashlyticsServicePlatform.
  CrashlyticsServicePlatform() : super(token: _token);

  static final Object _token = Object();

  static CrashlyticsServicePlatform _instance =
      MethodChannelCrashlyticsService();

  /// The default instance of [CrashlyticsServicePlatform] to use.
  ///
  /// Defaults to [MethodChannelCrashlyticsService].
  static CrashlyticsServicePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CrashlyticsServicePlatform] when
  /// they register themselves.
  static set instance(final CrashlyticsServicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
