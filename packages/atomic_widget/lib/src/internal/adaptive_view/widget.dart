import 'package:flutter/widgets.dart';

/// Adaptive View
abstract base class AdaptiveWidget extends StatelessWidget {
  // ignore: public_member_api_docs
  const AdaptiveWidget({
    super.key,
  });

  /// Build a widget for small handset.
  Widget? buildSmallHandset(final BuildContext context) => null;

  /// Build a widget for medium handset.
  Widget? buildMediumHandset(final BuildContext context) => null;

  /// Build a widget for large handset.
  Widget? buildLargeHandset(final BuildContext context) => null;

  /// Build a widget for small tablet.
  Widget? buildSmallTablet(final BuildContext context) => null;

  /// Build a widget for large tablet.
  Widget? buildLargeTablet(final BuildContext context) => null;

  /// Build a widget for destop.
  Widget? buildDesktop(final BuildContext context) => null;
}
