import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'permission_service_method_channel.dart';

// ignore: public_member_api_docs
abstract class PermissionServicePlatform extends PlatformInterface {
  /// Constructs a PermissionServicePlatform.
  PermissionServicePlatform() : super(token: _token);

  static final Object _token = Object();

  static PermissionServicePlatform _instance = MethodChannelPermissionService();

  /// The default instance of [PermissionServicePlatform] to use.
  ///
  /// Defaults to [MethodChannelPermissionService].
  static PermissionServicePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PermissionServicePlatform] when
  /// they register themselves.
  static set instance(final PermissionServicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
