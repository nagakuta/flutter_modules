part of "../widget.dart";

/// Consumer Stateful Wrapper
@internal
abstract base class ConsumerStatefulWrapper extends ConsumerStatefulWidget {
  // ignore: public_member_api_docs
  const ConsumerStatefulWrapper({
    super.key,
    final EdgeInsetsGeometry padding = EdgeInsets.zero,
    final EdgeInsetsGeometry margin = EdgeInsets.zero,
  })  : _padding = padding,
        _margin = margin;

  final EdgeInsetsGeometry _padding;
  final EdgeInsetsGeometry _margin;
}

/// Consumer Stateful Wrapper State
@internal
abstract class ConsumerWrapperState<T extends ConsumerStatefulWrapper> extends ConsumerState<T> {
  /// Build a widget with wrapper.
  Widget buildWrapper(
    final BuildContext context,
    final Widget child,
  ) =>
      widget._padding != EdgeInsets.zero || widget._margin != EdgeInsets.zero
          ? Padding(
              padding: widget._padding.add(widget._margin),
              child: child,
            )
          : child;
}
