import 'package:cross_platform/cross_platform.dart';
import 'package:flutter/material.dart';

/// Page Widget
abstract base class PageWidget extends StatelessWidget with AdaptiveScaffold {
  // ignore: public_member_api_docs
  const PageWidget({super.key});
}

/// Adaptive Scaffold
base mixin AdaptiveScaffold on StatelessWidget {
  /// Material Scaffold
  @protected
  StatefulWidget get material;

  /// Cupertino Scaffold
  @protected
  StatefulWidget? get cupertino => null;

  @override
  @protected
  Widget build(final BuildContext context) => CrossPlatform.of(context).isCupertino ? cupertino ?? material : material;
}
