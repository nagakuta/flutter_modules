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
              LayoutType.fromConstraints(constraints).when(
            smallHandset: () => buildSmallHandset(context) ?? buildTemplate(context),
            mediumHandset: () => buildMediumHandset(context) ?? buildSmallHandset(context) ?? buildTemplate(context),
            largeHandset: () =>
                buildLargeHandset(context) ??
                buildMediumHandset(context) ??
                buildSmallHandset(context) ??
                buildTemplate(context),
            smallTablet: () =>
                buildSmallTablet(context) ??
                buildLargeHandset(context) ??
                buildMediumHandset(context) ??
                buildSmallHandset(context) ??
                buildTemplate(context),
            largeTablet: () =>
                buildLargeTablet(context) ??
                buildSmallTablet(context) ??
                buildLargeHandset(context) ??
                buildMediumHandset(context) ??
                buildSmallHandset(context) ??
                buildTemplate(context),
            desktop: () =>
                buildDesktop(context) ??
                buildLargeTablet(context) ??
                buildSmallTablet(context) ??
                buildLargeHandset(context) ??
                buildMediumHandset(context) ??
                buildSmallHandset(context) ??
                buildTemplate(context),
          ),
        ),
      );
}
