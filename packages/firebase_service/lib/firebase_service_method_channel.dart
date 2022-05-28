import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'firebase_service_platform_interface.dart';

/// An implementation of [FirebaseServicePlatform] that uses method channels.
class MethodChannelFirebaseService extends FirebaseServicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel = const MethodChannel('firebase_service');
}
