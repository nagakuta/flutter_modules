import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import '/src/_utils/types.dart';

@internal
extension SizeExtension on Size {
  /// The breakpoint that satisfies the size.
  Breakpoint get breakpoint => Breakpoint.fromSize(this);

  /// The layout type that satisfies the size.
  LayoutType get layoutType => LayoutType.fromSize(this);

  /// The window type that satisfies the size.
  WindowType get windowType => WindowType.fromSize(this);
}
