import 'package:flutter/widgets.dart';

import '/src/_utils/types.dart';

export 'src/_utils/device.dart';
export 'src/_utils/types.dart';

/// Adaptive with layout type
base mixin AdaptiveWithLayoutType on StatelessWidget {
  /// Build a widget for desktop.
  @protected
  Widget? buildDesktop(final BuildContext context) => null;

  /// Build a widget for large tablet.
  @protected
  Widget? buildLargeTablet(final BuildContext context) => null;

  /// Build a widget for small tablet.
  @protected
  Widget? buildSmallTablet(final BuildContext context) => null;

  /// Build a widget for large handset.
  @protected
  Widget? buildLargeHandset(final BuildContext context) => null;

  /// Build a widget for medium handset.
  @protected
  Widget? buildMediumHandset(final BuildContext context) => null;

  /// Build a widget for small handset.
  @protected
  Widget? buildSmallHandset(final BuildContext context) => null;

  /// Build a widget by layout type.
  @protected
  Widget buildLayout(final BuildContext context) => LayoutBuilder(
        builder: (
          final BuildContext context,
          final BoxConstraints constraints,
        ) =>
            switch (LayoutType.fromConstraints(constraints)) {
          LayoutType.desktop => buildDesktop(context) ??
              buildLargeTablet(context) ??
              buildSmallTablet(context) ??
              buildLargeHandset(context) ??
              buildMediumHandset(context) ??
              buildSmallHandset(context) ??
              (throw UnimplementedError()),
          LayoutType.largeTablet => buildLargeTablet(context) ??
              buildSmallTablet(context) ??
              buildLargeHandset(context) ??
              buildMediumHandset(context) ??
              buildSmallHandset(context) ??
              (throw UnimplementedError()),
          LayoutType.smallTablet => buildSmallTablet(context) ??
              buildLargeHandset(context) ??
              buildMediumHandset(context) ??
              buildSmallHandset(context) ??
              (throw UnimplementedError()),
          LayoutType.largeHandset => buildLargeHandset(context) ??
              buildMediumHandset(context) ??
              buildSmallHandset(context) ??
              (throw UnimplementedError()),
          LayoutType.mediumHandset =>
            buildMediumHandset(context) ?? buildSmallHandset(context) ?? (throw UnimplementedError()),
          LayoutType.smallHandset => buildSmallHandset(context) ?? (throw UnimplementedError()),
        },
      );
}

/// Adaptive with window type
base mixin AdaptiveWithWindowType on StatelessWidget {
  /// Build a widget for extra large.
  @protected
  Widget? buildExtraLarge(final BuildContext context) => null;

  /// Build a widget for large.
  @protected
  Widget? buildLarge(final BuildContext context) => null;

  /// Build a widget for expanded.
  @protected
  Widget? buildExpanded(final BuildContext context) => null;

  /// Build a widget for medium.
  @protected
  Widget? buildMedium(final BuildContext context) => null;

  /// Build a widget for compact.
  @protected
  Widget? buildCompact(final BuildContext context) => null;

  /// Build a widget by window type.
  @protected
  Widget buildLayout(final BuildContext context) => LayoutBuilder(
        builder: (
          final BuildContext context,
          final BoxConstraints constraints,
        ) =>
            switch (WindowType.fromConstraints(constraints)) {
          WindowType.extraLarge => buildExtraLarge(context) ??
              buildLarge(context) ??
              buildExpanded(context) ??
              buildMedium(context) ??
              buildCompact(context) ??
              (throw UnimplementedError()),
          WindowType.large => buildLarge(context) ??
              buildExpanded(context) ??
              buildMedium(context) ??
              buildCompact(context) ??
              (throw UnimplementedError()),
          WindowType.expanded =>
            buildExpanded(context) ?? buildMedium(context) ?? buildCompact(context) ?? (throw UnimplementedError()),
          WindowType.medium => buildMedium(context) ?? buildCompact(context) ?? (throw UnimplementedError()),
          WindowType.compact => buildCompact(context) ?? (throw UnimplementedError()),
        },
      );
}
