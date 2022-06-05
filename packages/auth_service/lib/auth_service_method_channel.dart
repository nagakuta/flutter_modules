import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'auth_service_platform_interface.dart';

/// An implementation of [AuthServicePlatform] that uses method channels.
class MethodChannelAuthService extends AuthServicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel = const MethodChannel('auth_service');
}
