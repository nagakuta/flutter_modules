import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'skeletonize_widget_platform_interface.dart';

/// An implementation of [SkeletonizeWidgetPlatform] that uses method channels.
class MethodChannelSkeletonizeWidget extends SkeletonizeWidgetPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel = const MethodChannel('skeletonize_widget');
}
