part of "../widget.dart";

/// Organism Widget
abstract base class OrganismWidget extends StatelessWrapper {
  // ignore: public_member_api_docs
  const OrganismWidget({
    super.key,
    super.padding,
    super.margin,
  });

  /// Build a organism widget.
  Widget buildOrganism(final BuildContext context);

  @override
  Widget build(final BuildContext context) {
    final Widget child = buildOrganism(context);
    return buildWrapper(context, child);
  }
}
