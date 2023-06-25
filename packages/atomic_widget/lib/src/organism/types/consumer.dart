part of "../widget.dart";

/// Consumer Organism Widget
abstract base class ConsumerOrganismWidget extends ConsumerWrapper {
  // ignore: public_member_api_docs
  const ConsumerOrganismWidget({
    super.key,
    super.padding,
    super.margin,
  });

  /// Build a organism widget.
  Widget buildOrganism(final BuildContext context, final WidgetRef ref);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final Widget child = buildOrganism(context, ref);
    return buildWrapper(context, child);
  }
}
