import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import '/src/widgets/bone/_widget.dart';
import '/src/widgets/effect_loading.dart';

/// Skeleton Wrapper
base mixin SkeletonWrapper on StatefulWidget {
  @protected
  // ignore: public_member_api_docs
  Widget get child;

  @protected
  // ignore: public_member_api_docs
  Bone? get bone;

  @protected
  // ignore: public_member_api_docs
  bool get addRepaintBoundary => true;

  @override
  @protected
  State<SkeletonWrapper> createState() => SkeletonWrapperState();
}

@internal
final class SkeletonWrapperState extends State<SkeletonWrapper> {
  Listenable? _skeletonChanges;

  @override
  @protected
  void didChangeDependencies() {
    super.didChangeDependencies();

    _skeletonChanges?.removeListener(_onShimmerChange);

    _skeletonChanges = EffectLoading.of(context)?.skeletonChanges;
    _skeletonChanges?.addListener(_onShimmerChange);
  }

  @override
  @protected
  Widget build(final BuildContext context) {
    final EffectLoadingState? loader = EffectLoading.of(context);
    if (loader == null) return widget.child;

    if (!loader.isSized) return const SizedBox.shrink();

    final EffectLoadingState(:LinearGradient effect, :bool isLoading, size: Size loaderSize) = loader;
    final Offset offsetWithinSkeleton = (context.findRenderObject() as RenderBox?) != null
        ? loader.getDescendantOffset(descendant: context.findRenderObject()! as RenderBox)
        : Offset.zero;

    final Widget masked = isLoading
        ? ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (final _) => effect.createShader(
              Rect.fromLTWH(
                -offsetWithinSkeleton.dx,
                -offsetWithinSkeleton.dy,
                loaderSize.width,
                loaderSize.height,
              ),
            ),
            child: widget.bone ?? widget.child,
          )
        : widget.child;

    return widget.addRepaintBoundary ? RepaintBoundary(child: masked) : masked;
  }

  @override
  @protected
  void dispose() {
    _skeletonChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  // Update the skeleton painting
  void _onShimmerChange() => setState(() {});
}
