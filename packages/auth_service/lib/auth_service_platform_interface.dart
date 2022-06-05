import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'auth_service_method_channel.dart';

// ignore: public_member_api_docs
abstract class AuthServicePlatform extends PlatformInterface {
  /// Constructs a AuthServicePlatform.
  AuthServicePlatform() : super(token: _token);

  static final Object _token = Object();

  static AuthServicePlatform _instance = MethodChannelAuthService();

  /// The default instance of [AuthServicePlatform] to use.
  ///
  /// Defaults to [MethodChannelAuthService].
  static AuthServicePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AuthServicePlatform] when
  /// they register themselves.
  static set instance(final AuthServicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
