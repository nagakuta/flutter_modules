part of '_widget.dart';

/// Window Template Widget
abstract base class WindowTemplateWidget extends SafeArea with AdaptiveWithWindowType {
  // ignore: public_member_api_docs
  const WindowTemplateWidget({
    super.key,
  }) : super(child: const SizedBox.shrink());

  @override
  bool get left => true;

  @override
  bool get top => true;

  @override
  bool get right => true;

  @override
  bool get bottom => true;

  @override
  EdgeInsets get minimum => EdgeInsets.zero;

  @override
  bool get maintainBottomViewPadding => false;

  @override
  Widget get child => LayoutBuilder(
        builder: (
          final BuildContext context,
          final BoxConstraints constraints,
        ) =>
            switch (constraints.windowType) {
          WindowType.extraLarge => buildExtraLarge(context) ??
              buildLarge(context) ??
              buildExpanded(context) ??
              buildMedium(context) ??
              buildCompact(context) ??
              buildTemplate(context),
          WindowType.large => buildLarge(context) ??
              buildExpanded(context) ??
              buildMedium(context) ??
              buildCompact(context) ??
              buildTemplate(context),
          WindowType.expanded =>
            buildExpanded(context) ?? buildMedium(context) ?? buildCompact(context) ?? buildTemplate(context),
          WindowType.medium => buildMedium(context) ?? buildCompact(context) ?? buildTemplate(context),
          WindowType.compact => buildCompact(context) ?? buildTemplate(context),
        },
      );

  /// Build a template widget.
  @protected
  Widget buildTemplate(final BuildContext context);
}
