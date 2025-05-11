import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import '/src/platform/type.dart';

/// Current platform type
@internal
@pragma("vm:platform-const")
@pragma('vm:prefer-inline')
@pragma('dart2js:prefer-inline')
CrossPlatformType get currentPlatform => CrossPlatformType.web;

/// Target platform type
@internal
@pragma("vm:platform-const")
@pragma('vm:prefer-inline')
@pragma('dart2js:prefer-inline')
CrossPlatformType targetOf(final BuildContext _) => CrossPlatformType.web;
