import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'adaptive_widget_platform_interface.dart';

/// An implementation of [AdaptiveWidgetPlatform] that uses method channels.
class MethodChannelAdaptiveWidget extends AdaptiveWidgetPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel = const MethodChannel('adaptive_widget');
}
