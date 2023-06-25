import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'types.freezed.dart';

// ignore: constant_identifier_names
const double _MINIMUM_WIDTH = 359;

/// Breakpoint
@Freezed(
  map: FreezedMapOptions.none,
  when: FreezedWhenOptions.none,
)
class Breakpoint with _$Breakpoint {
  // ignore: public_member_api_docs
  const factory Breakpoint({
    required final LayoutType layoutType,
    required final WindowType windowType,
  }) = _Breakpoint;

  const Breakpoint._();

  // ignore: public_member_api_docs
  factory Breakpoint.fromConstraints(final BoxConstraints constraints) {
    final LayoutType layoutType = LayoutType.fromConstraints(constraints);
    final WindowType windowType = WindowType.fromConstraints(constraints);

    return Breakpoint(
      layoutType: layoutType,
      windowType: windowType,
    );
  }

  // ignore: public_member_api_docs
  factory Breakpoint.fromMediaQuery(final BuildContext context) {
    final LayoutType layoutType = LayoutType.fromMediaQuery(context);
    final WindowType windowType = WindowType.fromMediaQuery(context);

    return Breakpoint(
      layoutType: layoutType,
      windowType: windowType,
    );
  }
}

/// Layout Type
@freezed
class LayoutType with _$LayoutType {
  // ignore: public_member_api_docs
  const factory LayoutType.smallHandset() = SmallHandsetLayoutType;

  // ignore: public_member_api_docs
  const factory LayoutType.mediumHandset() = MediumHandsetLayoutType;

  // ignore: public_member_api_docs
  const factory LayoutType.largeHandset() = LargeHandsetLayoutType;

  // ignore: public_member_api_docs
  const factory LayoutType.smallTablet() = SmallTabletLayoutType;

  // ignore: public_member_api_docs
  const factory LayoutType.largeTablet() = LargeTabletLayoutType;

  // ignore: public_member_api_docs
  const factory LayoutType.desktop() = DesktopLayoutType;

  const LayoutType._();

  // ignore: public_member_api_docs
  factory LayoutType.fromConstraints(final BoxConstraints constraints) {
    final bool isConstraintsValid = constraints.debugAssertIsValid();
    final double maxWidth = isConstraintsValid ? constraints.normalize().maxWidth : _MINIMUM_WIDTH;
    final bool isLandscape = isConstraintsValid && constraints.maxWidth > constraints.maxHeight;

    return LayoutType._calculate(isLandscape ? maxWidth + 120 : maxWidth);
  }

  // ignore: public_member_api_docs
  factory LayoutType.fromMediaQuery(final BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final Orientation orientation = MediaQuery.orientationOf(context);
    final bool isLandscape = orientation == Orientation.landscape;

    return LayoutType._calculate(isLandscape ? width + 120 : width);
  }

  // ignore: public_member_api_docs
  factory LayoutType._calculate(final double width) => width >= 1024
      ? const LayoutType.desktop()
      : width >= 720
          ? const LayoutType.largeTablet()
          : width >= 600
              ? const LayoutType.smallTablet()
              : width >= 400
                  ? const LayoutType.largeHandset()
                  : width >= 360
                      ? const LayoutType.mediumHandset()
                      : const LayoutType.smallHandset();
}

/// Window Type
@freezed
class WindowType with _$WindowType {
  // ignore: public_member_api_docs
  const factory WindowType.xsmall() = XSmallWindowType;

  // ignore: public_member_api_docs
  const factory WindowType.small() = SmallWindowType;

  // ignore: public_member_api_docs
  const factory WindowType.medium() = MediumWindowType;

  // ignore: public_member_api_docs
  const factory WindowType.large() = LargeWindowType;

  // ignore: public_member_api_docs
  const factory WindowType.xlarge() = XLargeWindowType;

  const WindowType._();

  // ignore: public_member_api_docs
  factory WindowType.fromConstraints(final BoxConstraints constraints) {
    final bool isConstraintsValid = constraints.debugAssertIsValid();
    final double maxWidth = isConstraintsValid ? constraints.normalize().maxWidth : _MINIMUM_WIDTH;
    final bool isLandscape = isConstraintsValid && constraints.maxWidth > constraints.maxHeight;

    return WindowType._calculate(isLandscape ? maxWidth + 120 : maxWidth);
  }

  // ignore: public_member_api_docs
  factory WindowType.fromMediaQuery(final BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final Orientation orientation = MediaQuery.orientationOf(context);
    final bool isLandscape = orientation == Orientation.landscape;

    return WindowType._calculate(isLandscape ? width + 120 : width);
  }

  // ignore: public_member_api_docs
  factory WindowType._calculate(final double width) => width >= 1920
      ? const WindowType.xlarge()
      : width >= 1440
          ? const WindowType.large()
          : width >= 1024
              ? const WindowType.medium()
              : width >= 600
                  ? const WindowType.small()
                  : const WindowType.xsmall();
}
