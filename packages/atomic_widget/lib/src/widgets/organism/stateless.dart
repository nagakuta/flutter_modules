part of "_widget.dart";

/// Organism Widget
abstract base class OrganismWidget extends StatelessWidget with StatelessWrapper {
  // ignore: public_member_api_docs
  const OrganismWidget({super.key, this.padding = EdgeInsets.zero, this.margin = EdgeInsets.zero});

  @override
  @protected
  final EdgeInsetsGeometry padding;

  @override
  @protected
  final EdgeInsetsGeometry margin;
}
