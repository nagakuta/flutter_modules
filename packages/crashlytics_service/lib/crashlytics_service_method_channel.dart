import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'crashlytics_service_platform_interface.dart';

/// An implementation of [CrashlyticsServicePlatform] that uses method channels.
class MethodChannelCrashlyticsService extends CrashlyticsServicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel =
      const MethodChannel('crashlytics_service');
}
