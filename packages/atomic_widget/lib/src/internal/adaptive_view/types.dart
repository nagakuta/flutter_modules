// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'types.freezed.dart';

@visibleForTesting
// ignore: constant_identifier_names
const double MINIMUM_WIDTH = 359;

/// Breakpoint
@Freezed(
  copyWith: false,
  fromJson: false,
  toJson: false,
  map: FreezedMapOptions.none,
  when: FreezedWhenOptions.none,
)
class Breakpoint with _$Breakpoint {
  const factory Breakpoint({
    required final LayoutType layoutType,
    required final WindowType windowType,
  }) = _Breakpoint;

  const Breakpoint._();

  factory Breakpoint.fromConstraints(final BoxConstraints constraints) {
    final LayoutType layoutType = LayoutType.fromConstraints(constraints);
    final WindowType windowType = WindowType.fromConstraints(constraints);

    return Breakpoint(
      layoutType: layoutType,
      windowType: windowType,
    );
  }

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
enum LayoutType {
  smallHandset,
  mediumHandset,
  largeHandset,
  smallTablet,
  largeTablet,
  desktop;

  factory LayoutType.fromConstraints(final BoxConstraints constraints) {
    final bool isConstraintsValid = constraints.debugAssertIsValid();
    final double maxWidth = isConstraintsValid ? constraints.normalize().maxWidth : MINIMUM_WIDTH;
    final bool isLandscape = isConstraintsValid && constraints.maxWidth > constraints.maxHeight;

    return LayoutType._calculate(isLandscape ? maxWidth + 120 : maxWidth);
  }

  factory LayoutType.fromMediaQuery(final BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final Orientation orientation = MediaQuery.orientationOf(context);
    final bool isLandscape = orientation == Orientation.landscape;

    return LayoutType._calculate(isLandscape ? width + 120 : width);
  }

  factory LayoutType._calculate(final double width) => switch (width) {
        >= 1024 => LayoutType.desktop,
        >= 720 => LayoutType.largeTablet,
        >= 600 => LayoutType.smallTablet,
        >= 400 => LayoutType.largeHandset,
        >= 360 => LayoutType.mediumHandset,
        _ => LayoutType.smallHandset,
      };
}

/// Window Type
enum WindowType {
  xsmall,
  small,
  medium,
  large,
  xlarge;

  factory WindowType.fromConstraints(final BoxConstraints constraints) {
    final bool isConstraintsValid = constraints.debugAssertIsValid();
    final double maxWidth = isConstraintsValid ? constraints.normalize().maxWidth : MINIMUM_WIDTH;
    final bool isLandscape = isConstraintsValid && constraints.maxWidth > constraints.maxHeight;

    return WindowType._calculate(isLandscape ? maxWidth + 120 : maxWidth);
  }

  factory WindowType.fromMediaQuery(final BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final Orientation orientation = MediaQuery.orientationOf(context);
    final bool isLandscape = orientation == Orientation.landscape;

    return WindowType._calculate(isLandscape ? width + 120 : width);
  }

  factory WindowType._calculate(final double width) => switch (width) {
        >= 1920 => WindowType.xlarge,
        >= 1440 => WindowType.large,
        >= 1024 => WindowType.medium,
        >= 600 => WindowType.small,
        _ => WindowType.xsmall,
      };
}
