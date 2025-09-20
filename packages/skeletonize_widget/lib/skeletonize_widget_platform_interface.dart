import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'skeletonize_widget_method_channel.dart';

// ignore: avoid_classes_with_only_static_members, public_member_api_docs
abstract class SkeletonizeWidgetPlatform extends PlatformInterface {
  /// Constructs a SkeletonizeWidgetPlatform.
  SkeletonizeWidgetPlatform() : super(token: _token);

  static final Object _token = Object();

  static SkeletonizeWidgetPlatform _instance = MethodChannelSkeletonizeWidget();

  /// The default instance of [SkeletonizeWidgetPlatform] to use.
  ///
  /// Defaults to [MethodChannelSkeletonizeWidget].
  static SkeletonizeWidgetPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SkeletonizeWidgetPlatform] when
  /// they register themselves.
  static set instance(final SkeletonizeWidgetPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
