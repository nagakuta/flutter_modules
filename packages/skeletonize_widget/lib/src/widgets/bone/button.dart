part of '_widget.dart';

@internal
enum ButtonType { elevated, filled, outlined, text }

/// Button Bone
final class ButtonBone extends Bone {
  // ignore: public_member_api_docs
  const ButtonBone({required final ButtonType type, super.key, super.width, super.height, final ButtonStyle? style})
    : _type = type,
      _style = style,
      super(contextPadding: EdgeInsets.zero, shape: null);

  /// Elevated Shader Button Bone widget
  const ButtonBone.elevated({super.key, super.width, super.height, final ButtonStyle? style})
    : _type = ButtonType.elevated,
      _style = style,
      super(contextPadding: EdgeInsets.zero, shape: null);

  /// Filled Shader Button Bone widget
  const ButtonBone.filled({super.key, super.width, super.height, final ButtonStyle? style})
    : _type = ButtonType.filled,
      _style = style,
      super(contextPadding: EdgeInsets.zero, shape: null);

  /// Outlined Shader Button Bone widget
  const ButtonBone.outlined({super.key, super.width, super.height, final ButtonStyle? style})
    : _type = ButtonType.outlined,
      _style = style,
      super(contextPadding: EdgeInsets.zero, shape: null);

  /// Text Shader Button Bone widget
  const ButtonBone.text({super.key, super.width, super.height, final ButtonStyle? style})
    : _type = ButtonType.text,
      _style = style,
      super(contextPadding: EdgeInsets.zero, shape: null);

  final ButtonType _type;
  final ButtonStyle? _style;

  @override
  Widget build(final BuildContext context) {
    final ThemeData(
      :ElevatedButtonThemeData elevatedButtonTheme,
      :FilledButtonThemeData filledButtonTheme,
      :OutlinedButtonThemeData outlinedButtonTheme,
      :TextButtonThemeData textButtonTheme,
    ) = Theme.of(
      context,
    );

    final ButtonStyle? themedStyle = switch (_type) {
      ButtonType.elevated => elevatedButtonTheme.style,
      ButtonType.filled => filledButtonTheme.style,
      ButtonType.outlined => outlinedButtonTheme.style,
      ButtonType.text => textButtonTheme.style,
    };

    final ButtonStyle? style = _style ?? themedStyle;
    final Size? minimumSize = style?.minimumSize?.resolve(<WidgetState>{});
    final Size? fixedSize = style?.fixedSize?.resolve(<WidgetState>{});

    final Size(:double width, :double height) = fixedSize ?? minimumSize ?? Size(_width ?? 64, _height ?? 40);
    final OutlinedBorder shape = style?.shape?.resolve(<WidgetState>{}) ?? const StadiumBorder();

    final Widget child = DecoratedBox(
      decoration: ShapeDecoration(color: BASE_COLOR, shape: shape),
      child: SizedBox(width: width, height: height),
    );

    return height < kMinInteractiveDimension
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: (kMinInteractiveDimension - height) / 2),
            child: child,
          )
        : child;
  }
}

/// Icon Button Bone
final class IconButtonBone extends Bone {
  // ignore: public_member_api_docs
  const IconButtonBone({super.key, final double? iconSize, final ButtonStyle? style})
    : _iconSize = iconSize,
      _style = style,
      super(width: null, height: null, contextPadding: EdgeInsets.zero, shape: null);

  final double? _iconSize;
  final ButtonStyle? _style;

  @override
  Widget build(final BuildContext context) {
    final IconButtonThemeData(style: ButtonStyle? themedStyle) = IconButtonTheme.of(context);
    final ButtonStyle? style = _style ?? themedStyle;

    final double iconSize = _iconSize ?? style?.iconSize?.resolve(<WidgetState>{}) ?? 24.0;
    final EdgeInsetsGeometry contentPadding = style?.padding?.resolve(<WidgetState>{}) ?? const EdgeInsets.all(8);
    final double size = iconSize + contentPadding.vertical;

    return size < kMinInteractiveDimension
        ? Padding(
            padding: EdgeInsets.all((kMinInteractiveDimension - size) / 2),
            child: IconBone(size: size),
          )
        : IconBone(size: size);
  }
}
