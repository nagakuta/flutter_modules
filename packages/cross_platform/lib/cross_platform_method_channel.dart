import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cross_platform_platform_interface.dart';

/// An implementation of [CrossPlatformPlatform] that uses method channels.
class MethodChannelCrossPlatform extends CrossPlatformPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel = const MethodChannel('cross_platform');
}
