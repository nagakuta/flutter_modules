part of '_widget.dart';

/// Layout Template Widget
abstract base class LayoutTemplateWidget extends SafeArea with AdaptiveWithLayoutType {
  // ignore: public_member_api_docs
  const LayoutTemplateWidget({super.key}) : super(child: const SizedBox.shrink());

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
    builder: (final BuildContext context, final BoxConstraints constraints) => switch (constraints.layoutType) {
      LayoutType.desktop =>
        buildDesktop(context) ??
            buildLargeTablet(context) ??
            buildSmallTablet(context) ??
            buildLargeHandset(context) ??
            buildMediumHandset(context) ??
            buildSmallHandset(context) ??
            buildTemplate(context),
      LayoutType.largeTablet =>
        buildLargeTablet(context) ??
            buildSmallTablet(context) ??
            buildLargeHandset(context) ??
            buildMediumHandset(context) ??
            buildSmallHandset(context) ??
            buildTemplate(context),
      LayoutType.smallTablet =>
        buildSmallTablet(context) ??
            buildLargeHandset(context) ??
            buildMediumHandset(context) ??
            buildSmallHandset(context) ??
            buildTemplate(context),
      LayoutType.largeHandset =>
        buildLargeHandset(context) ??
            buildMediumHandset(context) ??
            buildSmallHandset(context) ??
            buildTemplate(context),
      LayoutType.mediumHandset => buildMediumHandset(context) ?? buildSmallHandset(context) ?? buildTemplate(context),
      LayoutType.smallHandset => buildSmallHandset(context) ?? buildTemplate(context),
    },
  );

  /// Build a template widget.
  @protected
  Widget buildTemplate(final BuildContext context);
}
