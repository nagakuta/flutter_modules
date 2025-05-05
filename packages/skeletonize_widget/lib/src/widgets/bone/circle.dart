part of '_widget.dart';

/// Circle Bone
final class CircleBone extends Bone {
  // ignore: public_member_api_docs
  const CircleBone({
    required final double radius,
    super.key,
  })  : _radius = radius,
        super(width: null, height: null, contextPadding: EdgeInsets.zero, shape: null);

  final double _radius;

  @override
  double? get _width => _radius * 2;

  @override
  double? get _height => _radius * 2;

  @override
  ShapeBorder? get _shape => const CircleBorder();
}
