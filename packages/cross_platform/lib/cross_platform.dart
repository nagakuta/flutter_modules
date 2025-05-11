import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '/src/_utils/platform/_stub.dart'
    if (dart.library.io) '/src/_utils/platform/native.dart'
    if (dart.library.js_util) '/src/_utils/platform/web.dart';
import '/src/platform/type.dart';

export 'src/platform/type.dart';

/// Cross Platform
base class CrossPlatform {
  // ignore: public_member_api_docs
  const CrossPlatform.of(final BuildContext context) : _context = context;

  final BuildContext _context;

  /// Current platform.
  @pragma("vm:platform-const")
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  static CrossPlatformType get current => currentPlatform;

  /// Target platform.
  @pragma("vm:platform-const")
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  CrossPlatformType get target => targetOf(_context);

  /// Platform applys Material UI or not.
  @pragma("vm:platform-const")
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isMaterial => target.isMaterial;

  /// Platform applys Cupertino UI or not.
  @pragma("vm:platform-const")
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isCupertino => target.isCupertino;

  /// Platform is mobile or not.
  @pragma("vm:platform-const")
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isMobile => target.isMobile;

  /// Platform is web or not.
  @pragma("vm:platform-const")
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isWeb => target.isWeb;
}
