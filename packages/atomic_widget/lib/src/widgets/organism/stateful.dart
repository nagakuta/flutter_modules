part of "_widget.dart";

/// Stateful Organism Widget
abstract base class StatefulOrganismWidget extends StatefulWidget with StatefulWrapper {
  // ignore: public_member_api_docs
  const StatefulOrganismWidget({super.key, this.padding = EdgeInsets.zero, this.margin = EdgeInsets.zero});

  @override
  @protected
  final EdgeInsetsGeometry padding;

  @override
  @protected
  final EdgeInsetsGeometry margin;

  @override
  @protected
  OrganismState<StatefulOrganismWidget> createState();
}

/// State of [StatefulOrganismWidget]
abstract base class OrganismState<T extends StatefulOrganismWidget> extends State<T> with WrapperState<T> {}
