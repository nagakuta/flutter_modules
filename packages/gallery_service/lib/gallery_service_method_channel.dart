import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'gallery_service_platform_interface.dart';

/// An implementation of [GalleryServicePlatform] that uses method channels.
class MethodChannelGalleryService extends GalleryServicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel = const MethodChannel('gallery_service');
}
