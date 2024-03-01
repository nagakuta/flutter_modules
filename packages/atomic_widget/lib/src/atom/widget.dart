import 'package:flutter/material.dart';

import '/src/internal/wrapper/widget.dart';

/// Atom Widget
abstract base class AtomWidget extends StatelessWrapper {
  // ignore: public_member_api_docs
  const AtomWidget({
    super.key,
    super.padding,
    super.margin,
  });

  /// Build a material widget.
  Widget buildMaterial(final BuildContext context);

  /// Build a cupertino widget.
  Widget? buildCupertino(final BuildContext context) => null;

  @override
  Widget build(final BuildContext context) {
    final Widget? cupertinoWidget = buildCupertino(context);
    final Widget materialWidget = buildMaterial(context);

    final TargetPlatform platform = Theme.of(context).platform;
    final Widget? child = switch (platform) {
      TargetPlatform.iOS || TargetPlatform.macOS => cupertinoWidget,
      _ => materialWidget,
    };

    return buildWrapper(context, child ?? materialWidget);
  }
}
