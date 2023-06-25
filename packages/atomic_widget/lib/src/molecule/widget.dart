import 'package:flutter/widgets.dart';

import '/src/internal/wrapper/widget.dart';

/// Molecule Widget
abstract base class MoleculeWidget extends StatelessWrapper {
  // ignore: public_member_api_docs
  const MoleculeWidget({
    super.key,
    super.padding,
    super.margin,
  });

  /// Build a molecule widget.
  Widget buildMolecule(final BuildContext context);

  @override
  Widget build(final BuildContext context) {
    final Widget child = buildMolecule(context);
    return buildWrapper(context, child);
  }
}
