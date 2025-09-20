// ignore_for_file: public_member_api_docs

part of '_widget.dart';

/// Stateful Wrapper
base mixin StatefulWrapper on StatefulWidget {
  @protected
  EdgeInsetsGeometry get padding;

  @protected
  EdgeInsetsGeometry get margin;

  @override
  @protected
  WrapperState<StatefulWrapper> createState();
}

/// State of [StatefulWrapper]
base mixin WrapperState<T extends StatefulWrapper> on State<T> {
  /// Build a child widget.
  @protected
  Widget buildChild(final BuildContext context);

  @override
  @protected
  Widget build(final BuildContext context) {
    final Widget child = buildChild(context);
    return widget.padding.isValid || widget.margin.isValid
        ? Padding(padding: widget.padding.add(widget.margin), child: child)
        : child;
  }
}
