import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'permission_service_platform_interface.dart';

/// An implementation of [PermissionServicePlatform] that uses method channels.
class MethodChannelPermissionService extends PermissionServicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel = const MethodChannel('permission_service');
}
