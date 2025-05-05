part of '_widget.dart';

/// Text Bone
final class TextBone extends Bone {
  // ignore: public_member_api_docs
  const TextBone({
    required final TextStyle style,
    super.key,
    super.width,
  })  : _style = style,
        super(height: null, contextPadding: EdgeInsets.zero, shape: null);

  /// Text Bone from text
  factory TextBone.fromText(
    final String text, {
    required final TextStyle style,
    final Key? key,
  }) {
    final double width = TextPainter.computeWidth(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );

    return TextBone(
      key: key,
      style: style,
      width: width,
    );
  }

  final TextStyle _style;

  @override
  Widget build(final BuildContext context) {
    final TextStyle(fontSize: double? textStyleFontSize, height: double? textStyleHeight) = _style;

    final double fontSize = textStyleFontSize ?? 14.0;
    final double height = textStyleHeight ?? 1.4;
    final double physicalHeight = fontSize * height;
    final double verticalPadding = physicalHeight - fontSize;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding / 2),
      child: DecoratedBox(
        decoration: const ShapeDecoration(
          color: BASE_COLOR,
          shape: StadiumBorder(),
        ),
        child: SizedBox(
          width: _width ?? double.infinity,
          height: fontSize,
        ),
      ),
    );
  }
}

/// Multi Line Text Bone
final class MultiLineTextBone extends Bone {
  // ignore: public_member_api_docs
  const MultiLineTextBone({
    required final TextStyle style,
    super.key,
    final int lines = 3,
  })  : _style = style,
        _lines = lines,
        super(width: null, height: null, contextPadding: EdgeInsets.zero, shape: null);

  final TextStyle _style;
  final int _lines;

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...List<TextBone>.generate(
            _lines - 1,
            (final int index) => TextBone(
              key: Key("MultiLineTextBone_TextBone_${index + 1}"),
              style: _style,
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.7,
            child: TextBone(
              key: Key("MultiLineTextBone_TextBone_$_lines"),
              style: _style,
            ),
          ),
        ],
      );
}
