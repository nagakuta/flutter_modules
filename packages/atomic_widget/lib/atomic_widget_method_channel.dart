import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'atomic_widget_platform_interface.dart';

/// An implementation of [AtomicWidgetPlatform] that uses method channels.
class MethodChannelAtomicWidget extends AtomicWidgetPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel = const MethodChannel('atomic_widget');
}
