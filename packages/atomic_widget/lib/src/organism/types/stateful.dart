part of "../widget.dart";

/// Stateful Organism Widget
abstract base class StatefulOrganismWidget extends StatefulWrapper {
  // ignore: public_member_api_docs
  const StatefulOrganismWidget({
    super.key,
    super.padding,
    super.margin,
  });

  @override
  OrganismState<StatefulOrganismWidget> createState();
}

/// Organism State
abstract class OrganismState<T extends StatefulOrganismWidget> extends WrapperState<T> {
  /// Build a organism widget.
  Widget buildOrganism(final BuildContext context);

  @override
  Widget build(final BuildContext context) {
    final Widget child = buildOrganism(context);
    return buildWrapper(context, child);
  }
}
