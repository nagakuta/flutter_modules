import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package_info_service_platform_interface.dart';

/// An implementation of [PackageInfoServicePlatform] that uses method channels.
class MethodChannelPackageInfoService extends PackageInfoServicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel =
      const MethodChannel('package_info_service');
}
