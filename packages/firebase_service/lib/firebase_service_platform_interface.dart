import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'firebase_service_method_channel.dart';

// ignore: public_member_api_docs
abstract class FirebaseServicePlatform extends PlatformInterface {
  /// Constructs a FirebaseServicePlatform.
  FirebaseServicePlatform() : super(token: _token);

  static final Object _token = Object();

  static FirebaseServicePlatform _instance = MethodChannelFirebaseService();

  /// The default instance of [FirebaseServicePlatform] to use.
  ///
  /// Defaults to [MethodChannelFirebaseService].
  static FirebaseServicePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FirebaseServicePlatform] when
  /// they register themselves.
  static set instance(final FirebaseServicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
