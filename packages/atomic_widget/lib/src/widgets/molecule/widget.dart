import 'package:flutter/widgets.dart';

import '/src/_utils/wrapper/_widget.dart';

/// Molecule Widget
abstract base class MoleculeWidget extends StatelessWidget with StatelessWrapper {
  // ignore: public_member_api_docs
  const MoleculeWidget({
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
}
