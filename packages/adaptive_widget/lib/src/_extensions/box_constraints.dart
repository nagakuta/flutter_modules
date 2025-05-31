import 'package:flutter/widgets.dart';

import '/src/_extensions/size.dart';
import '/src/_utils/types.dart';

// ignore: public_member_api_docs
extension BoxConstraintsExtension on BoxConstraints {
  /// The breakpoint that satisfies the constraints.
  Breakpoint get breakpoint {
    final BoxConstraints(:Size biggest) = debugAssertIsValid() ? this : normalize();
    return biggest.breakpoint;
  }

  /// The layout type that satisfies the constraints.
  LayoutType get layoutType {
    final BoxConstraints(:Size biggest) = debugAssertIsValid() ? this : normalize();
    return biggest.layoutType;
  }

  /// The window type that satisfies the constraints.
  WindowType get windowType {
    final BoxConstraints(:Size biggest) = debugAssertIsValid() ? this : normalize();
    return biggest.windowType;
  }
}
