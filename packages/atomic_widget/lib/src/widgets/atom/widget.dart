import 'package:cross_platform/cross_platform.dart';
import 'package:flutter/material.dart';

import '/src/_utils/wrapper/_widget.dart';

/// Atom Widget
abstract base class AtomWidget extends StatelessWidget with StatelessWrapper {
  // ignore: public_member_api_docs
  const AtomWidget({super.key, this.padding = EdgeInsets.zero, this.margin = EdgeInsets.zero});

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
    final Widget? cupertinoWidget = buildCupertino(context);
    final Widget materialWidget = buildMaterial(context);

    return CrossPlatform.of(context).isCupertino ? cupertinoWidget ?? materialWidget : materialWidget;
  }
}
