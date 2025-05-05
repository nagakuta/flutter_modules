import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '/src/effects/effect.dart';

part 'button.dart';
part 'circle.dart';
part 'icon.dart';
part 'rectangle.dart';
part 'text.dart';

/// Bone
base class Bone extends StatelessWidget {
  // ignore: public_member_api_docs
  const Bone({
    super.key,
    final double? width,
    final double? height,
    final EdgeInsetsGeometry contextPadding = EdgeInsets.zero,
    final ShapeBorder? shape,
  })  : _width = width,
        _height = height,
        _contentPadding = contextPadding,
        _shape = shape;

  /// Rectangle Bone
  const factory Bone.rectangle({
    required final Size size,
    final Key? key,
    final BorderRadius borderRadius,
  }) = RectangleBone;

  /// Circle Bone
  const factory Bone.circle({
    required final double radius,
    final Key? key,
  }) = CircleBone;

  /// Text Bone
  const factory Bone.text({
    required final TextStyle style,
    final Key? key,
  }) = TextBone;

  /// Multi Line Text Bone
  const factory Bone.multiLineText({
    required final TextStyle style,
    final Key? key,
    final int lines,
  }) = MultiLineTextBone;

  /// Icon Bone
  const factory Bone.icon({
    final Key? key,
    final double? size,
  }) = IconBone;

  /// Button Bone
  const factory Bone.button({
    required final ButtonType type,
    final Key? key,
    final ButtonStyle? style,
  }) = ButtonBone;

  /// Icon Button Bone
  const factory Bone.iconButton({
    final Key? key,
    final double? iconSize,
    final ButtonStyle? style,
  }) = IconButtonBone;

  final double? _width;
  final double? _height;
  final EdgeInsetsGeometry _contentPadding;
  final ShapeBorder? _shape;

  @override
  Widget build(final BuildContext context) => DecoratedBox(
        decoration: ShapeDecoration(
          color: BASE_COLOR,
          shape: _shape ?? const StadiumBorder(),
        ),
        child: Padding(
          padding: _contentPadding,
          child: SizedBox(
            width: _width,
            height: _height,
          ),
        ),
      );
}
