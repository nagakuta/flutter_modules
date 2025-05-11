import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '/src/platform/type.dart';

/// Current platform type
@internal
@pragma("vm:platform-const")
@pragma('vm:prefer-inline')
@pragma('dart2js:prefer-inline')
CrossPlatformType get currentPlatform {
  if (Platform.isAndroid) return CrossPlatformType.android;
  if (Platform.isFuchsia) return CrossPlatformType.fuchsia;
  if (Platform.isIOS) return CrossPlatformType.iOS;
  if (Platform.isLinux) return CrossPlatformType.linux;
  if (Platform.isMacOS) return CrossPlatformType.macOS;
  if (Platform.isWindows) return CrossPlatformType.windows;

  throw UnsupportedError("This platform not supported.");
}

/// Target platform type
@internal
@pragma("vm:platform-const")
@pragma('vm:prefer-inline')
@pragma('dart2js:prefer-inline')
CrossPlatformType targetOf(final BuildContext context) => switch (Theme.of(context).platform) {
      TargetPlatform.android => CrossPlatformType.android,
      TargetPlatform.fuchsia => CrossPlatformType.fuchsia,
      TargetPlatform.iOS => CrossPlatformType.iOS,
      TargetPlatform.linux => CrossPlatformType.linux,
      TargetPlatform.macOS => CrossPlatformType.macOS,
      TargetPlatform.windows => CrossPlatformType.windows,
    };
