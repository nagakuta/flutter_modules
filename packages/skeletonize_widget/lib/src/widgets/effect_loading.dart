import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '/src/effects/_extension.dart';
import '/src/effects/effect.dart';
import '/src/effects/transform.dart';

/// Effect Loading
final class EffectLoading extends StatefulWidget {
  // ignore: public_member_api_docs
  const EffectLoading({
    required final LinearGradient effect,
    required final bool isLoading,
    required final Widget child,
    super.key,
  })  : _effect = effect,
        _isLoading = isLoading,
        _child = child;

  /// Shimmer Loading
  EffectLoading.shimmer({
    required final bool isLoading,
    required final Widget child,
    super.key,
  })  : _effect = ShimmerEffect(),
        _isLoading = isLoading,
        _child = child;

  final LinearGradient _effect;
  final bool _isLoading;
  final Widget _child;

  // ignore: public_member_api_docs
  static EffectLoadingState? of(final BuildContext context) => context.findAncestorStateOfType<EffectLoadingState>();

  @override
  EffectLoadingState createState() => EffectLoadingState();
}

@internal
final class EffectLoadingState extends State<EffectLoading> with SingleTickerProviderStateMixin {
  late AnimationController _skeletonController;

  Listenable get skeletonChanges => _skeletonController;

  LinearGradient get effect =>
      widget._effect.copyWith(transform: SlidingGradientTransform(slidePercent: _skeletonController.value));

  bool get isLoading => widget._isLoading;

  bool get isSized => (context.findRenderObject() as RenderBox?)?.hasSize ?? false;

  Size get size => (context.findRenderObject() as RenderBox?)?.size ?? Size.zero;

  Offset getDescendantOffset({
    required final RenderBox descendant,
    final Offset offset = Offset.zero,
  }) {
    final RenderBox? loaderBox = context.findRenderObject() as RenderBox?;
    return descendant.localToGlobal(offset, ancestor: loaderBox);
  }

  @override
  void initState() {
    super.initState();

    _skeletonController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -1.5, max: 1.5, period: Durations.extralong4);
  }

  @override
  Widget build(final BuildContext context) => widget._child;

  @override
  void dispose() {
    _skeletonController.dispose();
    super.dispose();
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Listenable>('skeletonChanges', skeletonChanges))
      ..add(DiagnosticsProperty<LinearGradient>('effect', effect))
      ..add(DiagnosticsProperty<bool>('isLoading', isLoading))
      ..add(DiagnosticsProperty<bool>('isSized', isSized))
      ..add(DiagnosticsProperty<Size>('size', size));
  }
}
