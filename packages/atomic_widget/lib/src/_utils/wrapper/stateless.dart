// ignore_for_file: public_member_api_docs

part of '_widget.dart';

/// Stateless Wrapper
base mixin StatelessWrapper on StatelessWidget {
  @protected
  EdgeInsetsGeometry get padding;

  @protected
  EdgeInsetsGeometry get margin;

  /// Build a child widget.
  @protected
  Widget buildChild(final BuildContext context);

  @override
  @protected
  Widget build(final BuildContext context) {
    final Widget child = buildChild(context);
    return padding.isValid || margin.isValid ? Padding(padding: padding.add(margin), child: child) : child;
  }
}
