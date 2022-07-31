import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'gallery_service_method_channel.dart';

// ignore: public_member_api_docs
abstract class GalleryServicePlatform extends PlatformInterface {
  /// Constructs a GalleryServicePlatform.
  GalleryServicePlatform() : super(token: _token);

  static final Object _token = Object();

  static GalleryServicePlatform _instance = MethodChannelGalleryService();

  /// The default instance of [GalleryServicePlatform] to use.
  ///
  /// Defaults to [MethodChannelGalleryService].
  static GalleryServicePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GalleryServicePlatform] when
  /// they register themselves.
  static set instance(final GalleryServicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
