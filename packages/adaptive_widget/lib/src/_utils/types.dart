// ignore_for_file: public_member_api_docs

import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/src/_utils/_const.dart';

part 'types.freezed.dart';

/// Breakpoint
@Freezed(
  copyWith: false,
  fromJson: false,
  toJson: false,
  map: FreezedMapOptions.none,
  when: FreezedWhenOptions.none,
)
abstract class Breakpoint with _$Breakpoint {
  const factory Breakpoint({
    required final LayoutType layoutType,
    required final WindowType windowType,
  }) = _Breakpoint;

  const Breakpoint._();

  /// Breakpoint from size.
  factory Breakpoint.fromSize(final Size size) => Breakpoint(
        layoutType: LayoutType.fromSize(size),
        windowType: WindowType.fromSize(size),
      );
}

/// Layout Type for Material 1
/// reference: https://m1.material.io/layout/responsive-ui.html
enum LayoutType {
  smallHandset,
  mediumHandset,
  largeHandset,
  smallTablet,
  largeTablet,
  desktop;

  /// Layout type from size.
  factory LayoutType.fromSize(final Size size) {
    final Size(:double width, :double height) = size;
    final bool isLandscape = width >= height;

    return LayoutType._fromWidth(width, isLandscape: isLandscape);
  }

  factory LayoutType._fromWidth(
    final double width, {
    final bool isLandscape = false,
  }) =>
      isLandscape
          ? switch (width) {
              >= DESKTOP_LANDSCAPE_LAYOUT_MIN_WIDTH => LayoutType.desktop,
              >= LARGE_TABLET_LANDSCAPE_LAYOUT_MIN_WIDTH => LayoutType.largeTablet,
              >= SMALL_TABLET_LANDSCAPE_LAYOUT_MIN_WIDTH => LayoutType.smallTablet,
              >= LARGE_HANDSET_LANDSCAPE_LAYOUT_MIN_WIDTH => LayoutType.largeHandset,
              >= MEDIUM_HANDSET_LANDSCAPE_LAYOUT_MIN_WIDTH => LayoutType.mediumHandset,
              _ => LayoutType.smallHandset,
            }
          : switch (width) {
              >= DESKTOP_PORTRAIT_LAYOUT_MIN_WIDTH => LayoutType.desktop,
              >= LARGE_TABLET_PORTRAIT_LAYOUT_MIN_WIDTH => LayoutType.largeTablet,
              >= SMALL_TABLET_PORTRAIT_LAYOUT_MIN_WIDTH => LayoutType.smallTablet,
              >= LARGE_HANDSET_PORTRAIT_LAYOUT_MIN_WIDTH => LayoutType.largeHandset,
              >= MEDIUM_HANDSET_PORTRAIT_LAYOUT_MIN_WIDTH => LayoutType.mediumHandset,
              _ => LayoutType.smallHandset,
            };

  bool operator <(final LayoutType other) => index < other.index;

  bool operator <=(final LayoutType other) => index <= other.index;

  bool operator >(final LayoutType other) => index > other.index;

  bool operator >=(final LayoutType other) => index >= other.index;
}

/// Window Type for Material 3
/// reference: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
enum WindowType {
  compact,
  medium,
  expanded,
  large,
  extraLarge;

  /// Window type from size.
  factory WindowType.fromSize(final Size size) => WindowType._fromWidth(size.width);

  factory WindowType._fromWidth(final double width) => switch (width) {
        >= EXTRA_LARGE_WINDOW_MIN_WIDTH => WindowType.extraLarge,
        >= LARGE_WINDOW_MIN_WIDTH => WindowType.large,
        >= EXPANDED_WINDOW_MIN_WIDTH => WindowType.expanded,
        >= MEDIUM_WINDOW_MIN_WIDTH => WindowType.medium,
        _ => WindowType.compact,
      };

  bool operator <(final WindowType other) => index < other.index;

  bool operator <=(final WindowType other) => index <= other.index;

  bool operator >(final WindowType other) => index > other.index;

  bool operator >=(final WindowType other) => index >= other.index;
}
