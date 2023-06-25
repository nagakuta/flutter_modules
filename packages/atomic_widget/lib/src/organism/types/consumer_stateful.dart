part of "../widget.dart";

/// Consumer Stateful Organism Widget
abstract base class ConsumerStatefulOrganismWidget extends ConsumerStatefulWrapper {
  // ignore: public_member_api_docs
  const ConsumerStatefulOrganismWidget({
    super.key,
    super.padding,
    super.margin,
  });

  @override
  ConsumerOrganismState<ConsumerStatefulOrganismWidget> createState();
}

/// Consumer Organism State
abstract class ConsumerOrganismState<T extends ConsumerStatefulOrganismWidget> extends ConsumerWrapperState<T> {
  /// Build a organism widget.
  Widget buildOrganism(final BuildContext context, final WidgetRef ref);

  @override
  Widget build(final BuildContext context) {
    final Widget child = buildOrganism(context, ref);
    return buildWrapper(context, child);
  }
}
