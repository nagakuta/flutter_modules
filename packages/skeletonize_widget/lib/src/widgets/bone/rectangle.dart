part of '_widget.dart';

/// Rectangle Bone
final class RectangleBone extends Bone {
  // ignore: public_member_api_docs
  const RectangleBone({
    required final Size size,
    super.key,
    final BorderRadius borderRadius = BorderRadius.zero,
  })  : _size = size,
        _borderRadius = borderRadius,
        super(width: null, height: null, contextPadding: EdgeInsets.zero, shape: null);

  final Size _size;
  final BorderRadius _borderRadius;

  @override
  double? get _width => _size.width;

  @override
  double? get _height => _size.height;

  @override
  ShapeBorder? get _shape => RoundedRectangleBorder(borderRadius: _borderRadius);
}
