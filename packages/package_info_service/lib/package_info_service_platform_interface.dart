import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'package_info_service_method_channel.dart';

// ignore: public_member_api_docs
abstract class PackageInfoServicePlatform extends PlatformInterface {
  /// Constructs a PackageInfoServicePlatform.
  PackageInfoServicePlatform() : super(token: _token);

  static final Object _token = Object();

  static PackageInfoServicePlatform _instance =
      MethodChannelPackageInfoService();

  /// The default instance of [PackageInfoServicePlatform] to use.
  ///
  /// Defaults to [MethodChannelPackageInfoService].
  static PackageInfoServicePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PackageInfoServicePlatform] when
  /// they register themselves.
  static set instance(final PackageInfoServicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
