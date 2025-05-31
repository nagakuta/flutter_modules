// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:adaptive_widget/src/_extensions/box_constraints.dart';
import 'package:adaptive_widget/src/_utils/_const.dart';
import 'package:adaptive_widget/src/_utils/types.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("BoxConstraints", () {
    group("layout type", () {
      const double DLLW = DESKTOP_LANDSCAPE_LAYOUT_MIN_WIDTH;
      const double LTLLW = LARGE_TABLET_LANDSCAPE_LAYOUT_MIN_WIDTH;
      const double STLLW = SMALL_TABLET_LANDSCAPE_LAYOUT_MIN_WIDTH;
      const double LHLLW = LARGE_HANDSET_LANDSCAPE_LAYOUT_MIN_WIDTH;
      const double MHLLW = MEDIUM_HANDSET_LANDSCAPE_LAYOUT_MIN_WIDTH;
      const double SHLLW = SMALL_HANDSET_LANDSCAPE_LAYOUT_MIN_WIDTH;

      const double DPLW = DESKTOP_PORTRAIT_LAYOUT_MIN_WIDTH;
      const double LTPLW = LARGE_TABLET_PORTRAIT_LAYOUT_MIN_WIDTH;
      const double STPLW = SMALL_TABLET_PORTRAIT_LAYOUT_MIN_WIDTH;
      const double LHPLW = LARGE_HANDSET_PORTRAIT_LAYOUT_MIN_WIDTH;
      const double MHPLW = MEDIUM_HANDSET_PORTRAIT_LAYOUT_MIN_WIDTH;
      const double SHPLW = SMALL_HANDSET_PORTRAIT_LAYOUT_MIN_WIDTH;

      test("landscape", () {
        for (int i = 0; i < 100; i++) {
          final List<(Size, LayoutType)> testCases = <(Size, LayoutType)>[
            (
              Size(DLLW + Random().nextInt((1600 - DLLW).round()), Random().nextDouble() * DLLW),
              LayoutType.desktop,
            ),
            (
              Size(LTLLW + Random().nextInt((DLLW - LTLLW).round()), Random().nextDouble() * LTLLW),
              LayoutType.largeTablet,
            ),
            (
              Size(STLLW + Random().nextInt((LTLLW - STLLW).round()), Random().nextDouble() * STLLW),
              LayoutType.smallTablet,
            ),
            (
              Size(LHLLW + Random().nextInt((STLLW - LHLLW).round()), Random().nextDouble() * LHLLW),
              LayoutType.largeHandset,
            ),
            (
              Size(MHLLW + Random().nextInt((LHLLW - MHLLW).round()), Random().nextDouble() * MHLLW),
              LayoutType.mediumHandset,
            ),
            (
              Size(SHLLW + Random().nextInt((MHLLW - SHLLW).round()), Random().nextDouble() * SHLLW),
              LayoutType.smallHandset,
            ),
          ];

          for (final (Size size, LayoutType expected) in testCases) {
            final LayoutType type = BoxConstraints.loose(size).layoutType;
            expect(type, equals(expected));
          }
        }
      });

      test("portrait", () {
        for (int i = 0; i < 100; i++) {
          final List<(Size, LayoutType)> testCases = <(Size, LayoutType)>[
            (
              Size(DPLW + Random().nextInt((1600 - DPLW).round()), 1600.0 + Random().nextDouble() * DPLW),
              LayoutType.desktop,
            ),
            (
              Size(LTPLW + Random().nextInt((DPLW - LTPLW).round()), DPLW + Random().nextDouble() * LTPLW),
              LayoutType.largeTablet,
            ),
            (
              Size(STPLW + Random().nextInt((LTPLW - STPLW).round()), LTPLW + Random().nextDouble() * STPLW),
              LayoutType.smallTablet,
            ),
            (
              Size(LHPLW + Random().nextInt((STPLW - LHPLW).round()), STPLW + Random().nextDouble() * LHPLW),
              LayoutType.largeHandset,
            ),
            (
              Size(MHPLW + Random().nextInt((LHPLW - MHPLW).round()), LHPLW + Random().nextDouble() * MHPLW),
              LayoutType.mediumHandset,
            ),
            (
              Size(SHPLW + Random().nextInt((MHPLW - SHPLW).round()), MHPLW + Random().nextDouble() * SHPLW),
              LayoutType.smallHandset,
            ),
          ];

          for (final (Size size, LayoutType expected) in testCases) {
            final LayoutType type = BoxConstraints.loose(size).layoutType;
            expect(type, equals(expected));
          }
        }
      });
    });

    test("window type", () {
      const double ELWW = EXTRA_LARGE_WINDOW_MIN_WIDTH;
      const double LWW = LARGE_WINDOW_MIN_WIDTH;
      const double EWW = EXPANDED_WINDOW_MIN_WIDTH;
      const double MWW = MEDIUM_WINDOW_MIN_WIDTH;
      const double CWW = COMPACT_WINDOW_MIN_WIDTH;

      for (int i = 0; i < 100; i++) {
        final List<(Size, WindowType)> testCases = <(Size, WindowType)>[
          (Size(ELWW + Random().nextInt((2400 - ELWW).round()), Random().nextDouble() * ELWW), WindowType.extraLarge),
          (Size(LWW + Random().nextInt((ELWW - LWW).round()), Random().nextDouble() * LWW), WindowType.large),
          (Size(EWW + Random().nextInt((LWW - EWW).round()), Random().nextDouble() * EWW), WindowType.expanded),
          (Size(MWW + Random().nextInt((EWW - MWW).round()), Random().nextDouble() * MWW), WindowType.medium),
          (Size(CWW + Random().nextInt((MWW - CWW).round()), Random().nextDouble() * CWW), WindowType.compact),
        ];

        for (final (Size size, WindowType expected) in testCases) {
          final WindowType type = BoxConstraints.loose(size).windowType;
          expect(type, equals(expected));
        }
      }
    });
  });
}
