import 'package:flutter/widgets.dart';

/// Sliding Gradient Transform
final class SlidingGradientTransform extends GradientTransform {
  // ignore: public_member_api_docs
  const SlidingGradientTransform({
    required final double slidePercent,
  }) : _slidePercent = slidePercent;

  final double _slidePercent;

  @override
  Matrix4? transform(
    final Rect bounds, {
    final TextDirection? textDirection,
  }) =>
      Matrix4.translationValues(bounds.width * _slidePercent, 0, 0);
}
