import 'package:flutter/widgets.dart';

import '/src/internal/adaptive_view/types.dart';
import '/src/internal/adaptive_view/widget.dart';

/// Template Widget
abstract base class TemplateWidget extends AdaptiveWidget {
  // ignore: public_member_api_docs
  const TemplateWidget({
    super.key,
  });

  /// Build a template widget.
  Widget buildTemplate(final BuildContext context);

  /// Build a safe area.
  SafeArea buildSafeArea(
    final BuildContext context,
    final Widget child,
  ) =>
      SafeArea(child: child);

  @override
  Widget build(final BuildContext context) => buildSafeArea(
        context,
        LayoutBuilder(
          builder: (
            final BuildContext context,
            final BoxConstraints constraints,
          ) =>
              switch (LayoutType.fromConstraints(constraints)) {
            LayoutType.smallHandset => buildSmallHandset(context) ?? buildTemplate(context),
            LayoutType.mediumHandset =>
              buildMediumHandset(context) ?? buildSmallHandset(context) ?? buildTemplate(context),
            LayoutType.largeHandset => buildLargeHandset(context) ??
                buildMediumHandset(context) ??
                buildSmallHandset(context) ??
                buildTemplate(context),
            LayoutType.smallTablet => buildSmallTablet(context) ??
                buildLargeHandset(context) ??
                buildMediumHandset(context) ??
                buildSmallHandset(context) ??
                buildTemplate(context),
            LayoutType.largeTablet => buildLargeTablet(context) ??
                buildSmallTablet(context) ??
                buildLargeHandset(context) ??
                buildMediumHandset(context) ??
                buildSmallHandset(context) ??
                buildTemplate(context),
            LayoutType.desktop => buildDesktop(context) ??
                buildLargeTablet(context) ??
                buildSmallTablet(context) ??
                buildLargeHandset(context) ??
                buildMediumHandset(context) ??
                buildSmallHandset(context) ??
                buildTemplate(context),
          },
        ),
      );
}
