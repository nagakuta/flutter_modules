import 'package:flutter/material.dart';

import '/src/_utils/wrapper/_widget.dart';

/// Atom Widget
abstract base class AtomWidget extends StatelessWidget with StatelessWrapper {
  // ignore: public_member_api_docs
  const AtomWidget({
    super.key,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
  });

  @override
  @protected
  final EdgeInsetsGeometry padding;

  @override
  @protected
  final EdgeInsetsGeometry margin;

  /// Build a material widget.
  @protected
  Widget buildMaterial(final BuildContext context);

  /// Build a cupertino widget.
  @protected
  Widget? buildCupertino(final BuildContext context) => null;

  @override
  @protected
  Widget buildChild(final BuildContext context) {
    final ThemeData(:TargetPlatform platform) = Theme.of(context);

    final Widget? cupertinoWidget = buildCupertino(context);
    final Widget materialWidget = buildMaterial(context);

    return switch (platform) {
      TargetPlatform.iOS || TargetPlatform.macOS => cupertinoWidget ?? materialWidget,
      _ => materialWidget,
    };
  }
}
