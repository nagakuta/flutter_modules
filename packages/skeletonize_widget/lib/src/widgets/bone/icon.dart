part of '_widget.dart';

/// Icon Bone
final class IconBone extends Bone {
  // ignore: public_member_api_docs
  const IconBone({super.key, final double? size})
    : _size = size,
      super(width: null, height: null, contextPadding: EdgeInsets.zero, shape: null);

  final double? _size;

  @override
  Widget build(final BuildContext context) {
    final IconThemeData(size: double? iconSize) = Theme.of(context).iconTheme;
    final double size = _size ?? iconSize ?? 24.0;

    return CircleBone(radius: size / 2);
  }
}
