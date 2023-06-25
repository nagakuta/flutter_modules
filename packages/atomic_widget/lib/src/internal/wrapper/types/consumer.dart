part of "../widget.dart";

/// Consumer Wrapper
@internal
abstract base class ConsumerWrapper extends ConsumerWidget {
  // ignore: public_member_api_docs
  const ConsumerWrapper({
    super.key,
    final EdgeInsetsGeometry padding = EdgeInsets.zero,
    final EdgeInsetsGeometry margin = EdgeInsets.zero,
  })  : _padding = padding,
        _margin = margin;

  final EdgeInsetsGeometry _padding;
  final EdgeInsetsGeometry _margin;

  /// Build a widget with wrapper.
  Widget buildWrapper(
    final BuildContext context,
    final Widget child,
  ) =>
      _padding != EdgeInsets.zero || _margin != EdgeInsets.zero
          ? Padding(
              padding: _padding.add(_margin),
              child: child,
            )
          : child;
}
