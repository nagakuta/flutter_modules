// ignore_for_file: camel_case_types, constant_identifier_names

import 'dart:math';

import 'package:adaptive_widget/src/_utils/_const.dart';
import 'package:adaptive_widget/src/_utils/types.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

typedef LAYOUT_TYPE_FROM_CONSTRAINTS_TEST_CASE = (Size, LayoutType);
typedef WINDOW_TYPE_FROM_CONSTRAINTS_TEST_CASE = (Size, WindowType);

void main() {
  group("LayoutType", () {
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

    final List<LAYOUT_TYPE_FROM_CONSTRAINTS_TEST_CASE> landscapeTestCases =
        List<List<LAYOUT_TYPE_FROM_CONSTRAINTS_TEST_CASE>>.generate(
      100,
      growable: false,
      (final _) => <LAYOUT_TYPE_FROM_CONSTRAINTS_TEST_CASE>[
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
      ],
    ).expand((final List<LAYOUT_TYPE_FROM_CONSTRAINTS_TEST_CASE> element) => element).toList(growable: false);

    final List<LAYOUT_TYPE_FROM_CONSTRAINTS_TEST_CASE> portraitTestCases =
        List<List<LAYOUT_TYPE_FROM_CONSTRAINTS_TEST_CASE>>.generate(
      100,
      growable: false,
      (final _) => <LAYOUT_TYPE_FROM_CONSTRAINTS_TEST_CASE>[
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
      ],
    ).expand((final List<LAYOUT_TYPE_FROM_CONSTRAINTS_TEST_CASE> element) => element).toList(growable: false);

    group("from constraints", () {
      test("landscape", () {
        for (final (Size size, LayoutType expected) in landscapeTestCases) {
          final LayoutType type = LayoutType.fromConstraints(BoxConstraints.loose(size));
          expect(type, equals(expected));
        }
      });

      test("portrait", () {
        for (final (Size size, LayoutType expected) in portraitTestCases) {
          final LayoutType type = LayoutType.fromConstraints(BoxConstraints.loose(size));
          expect(type, equals(expected));
        }
      });
    });

    group("from size", () {
      test("landscape", () {
        for (final (Size size, LayoutType expected) in landscapeTestCases) {
          final LayoutType type = LayoutType.fromSize(size);
          expect(type, equals(expected));
        }
      });

      test("portrait", () {
        for (final (Size size, LayoutType expected) in portraitTestCases) {
          final LayoutType type = LayoutType.fromSize(size);
          expect(type, equals(expected));
        }
      });
    });

    group("compare", () {
      test("less than", () {
        final List<((LayoutType, LayoutType), bool)> testCases = <((LayoutType, LayoutType), bool)>[
          ((LayoutType.desktop, LayoutType.desktop), false),
          ((LayoutType.desktop, LayoutType.largeTablet), false),
          ((LayoutType.desktop, LayoutType.smallTablet), false),
          ((LayoutType.desktop, LayoutType.largeHandset), false),
          ((LayoutType.desktop, LayoutType.mediumHandset), false),
          ((LayoutType.desktop, LayoutType.smallHandset), false),
          ((LayoutType.largeTablet, LayoutType.desktop), true),
          ((LayoutType.largeTablet, LayoutType.largeTablet), false),
          ((LayoutType.largeTablet, LayoutType.smallTablet), false),
          ((LayoutType.largeTablet, LayoutType.largeHandset), false),
          ((LayoutType.largeTablet, LayoutType.mediumHandset), false),
          ((LayoutType.largeTablet, LayoutType.smallHandset), false),
          ((LayoutType.smallTablet, LayoutType.desktop), true),
          ((LayoutType.smallTablet, LayoutType.largeTablet), true),
          ((LayoutType.smallTablet, LayoutType.smallTablet), false),
          ((LayoutType.smallTablet, LayoutType.largeHandset), false),
          ((LayoutType.smallTablet, LayoutType.mediumHandset), false),
          ((LayoutType.smallTablet, LayoutType.smallHandset), false),
          ((LayoutType.largeHandset, LayoutType.desktop), true),
          ((LayoutType.largeHandset, LayoutType.largeTablet), true),
          ((LayoutType.largeHandset, LayoutType.smallTablet), true),
          ((LayoutType.largeHandset, LayoutType.largeHandset), false),
          ((LayoutType.largeHandset, LayoutType.mediumHandset), false),
          ((LayoutType.largeHandset, LayoutType.smallHandset), false),
          ((LayoutType.mediumHandset, LayoutType.desktop), true),
          ((LayoutType.mediumHandset, LayoutType.largeTablet), true),
          ((LayoutType.mediumHandset, LayoutType.smallTablet), true),
          ((LayoutType.mediumHandset, LayoutType.largeHandset), true),
          ((LayoutType.mediumHandset, LayoutType.mediumHandset), false),
          ((LayoutType.mediumHandset, LayoutType.smallHandset), false),
          ((LayoutType.smallHandset, LayoutType.desktop), true),
          ((LayoutType.smallHandset, LayoutType.largeTablet), true),
          ((LayoutType.smallHandset, LayoutType.smallTablet), true),
          ((LayoutType.smallHandset, LayoutType.largeHandset), true),
          ((LayoutType.smallHandset, LayoutType.mediumHandset), true),
          ((LayoutType.smallHandset, LayoutType.smallHandset), false),
        ];

        for (final ((LayoutType lhs, LayoutType rhs), bool expected) in testCases) {
          expect(lhs < rhs, equals(expected));
        }
      });

      test("less than or equal", () {
        final List<((LayoutType, LayoutType), bool)> testCases = <((LayoutType, LayoutType), bool)>[
          ((LayoutType.desktop, LayoutType.desktop), true),
          ((LayoutType.desktop, LayoutType.largeTablet), false),
          ((LayoutType.desktop, LayoutType.smallTablet), false),
          ((LayoutType.desktop, LayoutType.largeHandset), false),
          ((LayoutType.desktop, LayoutType.mediumHandset), false),
          ((LayoutType.desktop, LayoutType.smallHandset), false),
          ((LayoutType.largeTablet, LayoutType.desktop), true),
          ((LayoutType.largeTablet, LayoutType.largeTablet), true),
          ((LayoutType.largeTablet, LayoutType.smallTablet), false),
          ((LayoutType.largeTablet, LayoutType.largeHandset), false),
          ((LayoutType.largeTablet, LayoutType.mediumHandset), false),
          ((LayoutType.largeTablet, LayoutType.smallHandset), false),
          ((LayoutType.smallTablet, LayoutType.desktop), true),
          ((LayoutType.smallTablet, LayoutType.largeTablet), true),
          ((LayoutType.smallTablet, LayoutType.smallTablet), true),
          ((LayoutType.smallTablet, LayoutType.largeHandset), false),
          ((LayoutType.smallTablet, LayoutType.mediumHandset), false),
          ((LayoutType.smallTablet, LayoutType.smallHandset), false),
          ((LayoutType.largeHandset, LayoutType.desktop), true),
          ((LayoutType.largeHandset, LayoutType.largeTablet), true),
          ((LayoutType.largeHandset, LayoutType.smallTablet), true),
          ((LayoutType.largeHandset, LayoutType.largeHandset), true),
          ((LayoutType.largeHandset, LayoutType.mediumHandset), false),
          ((LayoutType.largeHandset, LayoutType.smallHandset), false),
          ((LayoutType.mediumHandset, LayoutType.desktop), true),
          ((LayoutType.mediumHandset, LayoutType.largeTablet), true),
          ((LayoutType.mediumHandset, LayoutType.smallTablet), true),
          ((LayoutType.mediumHandset, LayoutType.largeHandset), true),
          ((LayoutType.mediumHandset, LayoutType.mediumHandset), true),
          ((LayoutType.mediumHandset, LayoutType.smallHandset), false),
          ((LayoutType.smallHandset, LayoutType.desktop), true),
          ((LayoutType.smallHandset, LayoutType.largeTablet), true),
          ((LayoutType.smallHandset, LayoutType.smallTablet), true),
          ((LayoutType.smallHandset, LayoutType.largeHandset), true),
          ((LayoutType.smallHandset, LayoutType.mediumHandset), true),
          ((LayoutType.smallHandset, LayoutType.smallHandset), true),
        ];

        for (final ((LayoutType lhs, LayoutType rhs), bool expected) in testCases) {
          expect(lhs <= rhs, equals(expected));
        }
      });

      test("greater than", () {
        final List<((LayoutType, LayoutType), bool)> testCases = <((LayoutType, LayoutType), bool)>[
          ((LayoutType.desktop, LayoutType.desktop), false),
          ((LayoutType.desktop, LayoutType.largeTablet), true),
          ((LayoutType.desktop, LayoutType.smallTablet), true),
          ((LayoutType.desktop, LayoutType.largeHandset), true),
          ((LayoutType.desktop, LayoutType.mediumHandset), true),
          ((LayoutType.desktop, LayoutType.smallHandset), true),
          ((LayoutType.largeTablet, LayoutType.desktop), false),
          ((LayoutType.largeTablet, LayoutType.largeTablet), false),
          ((LayoutType.largeTablet, LayoutType.smallTablet), true),
          ((LayoutType.largeTablet, LayoutType.largeHandset), true),
          ((LayoutType.largeTablet, LayoutType.mediumHandset), true),
          ((LayoutType.largeTablet, LayoutType.smallHandset), true),
          ((LayoutType.smallTablet, LayoutType.desktop), false),
          ((LayoutType.smallTablet, LayoutType.largeTablet), false),
          ((LayoutType.smallTablet, LayoutType.smallTablet), false),
          ((LayoutType.smallTablet, LayoutType.largeHandset), true),
          ((LayoutType.smallTablet, LayoutType.mediumHandset), true),
          ((LayoutType.smallTablet, LayoutType.smallHandset), true),
          ((LayoutType.largeHandset, LayoutType.desktop), false),
          ((LayoutType.largeHandset, LayoutType.largeTablet), false),
          ((LayoutType.largeHandset, LayoutType.smallTablet), false),
          ((LayoutType.largeHandset, LayoutType.largeHandset), false),
          ((LayoutType.largeHandset, LayoutType.mediumHandset), true),
          ((LayoutType.largeHandset, LayoutType.smallHandset), true),
          ((LayoutType.mediumHandset, LayoutType.desktop), false),
          ((LayoutType.mediumHandset, LayoutType.largeTablet), false),
          ((LayoutType.mediumHandset, LayoutType.smallTablet), false),
          ((LayoutType.mediumHandset, LayoutType.largeHandset), false),
          ((LayoutType.mediumHandset, LayoutType.mediumHandset), false),
          ((LayoutType.mediumHandset, LayoutType.smallHandset), true),
          ((LayoutType.smallHandset, LayoutType.desktop), false),
          ((LayoutType.smallHandset, LayoutType.largeTablet), false),
          ((LayoutType.smallHandset, LayoutType.smallTablet), false),
          ((LayoutType.smallHandset, LayoutType.largeHandset), false),
          ((LayoutType.smallHandset, LayoutType.mediumHandset), false),
          ((LayoutType.smallHandset, LayoutType.smallHandset), false),
        ];

        for (final ((LayoutType lhs, LayoutType rhs), bool expected) in testCases) {
          expect(lhs > rhs, equals(expected));
        }
      });

      test("greater than or equal", () {
        final List<((LayoutType, LayoutType), bool)> testCases = <((LayoutType, LayoutType), bool)>[
          ((LayoutType.desktop, LayoutType.desktop), true),
          ((LayoutType.desktop, LayoutType.largeTablet), true),
          ((LayoutType.desktop, LayoutType.smallTablet), true),
          ((LayoutType.desktop, LayoutType.largeHandset), true),
          ((LayoutType.desktop, LayoutType.mediumHandset), true),
          ((LayoutType.desktop, LayoutType.smallHandset), true),
          ((LayoutType.largeTablet, LayoutType.desktop), false),
          ((LayoutType.largeTablet, LayoutType.largeTablet), true),
          ((LayoutType.largeTablet, LayoutType.smallTablet), true),
          ((LayoutType.largeTablet, LayoutType.largeHandset), true),
          ((LayoutType.largeTablet, LayoutType.mediumHandset), true),
          ((LayoutType.largeTablet, LayoutType.smallHandset), true),
          ((LayoutType.smallTablet, LayoutType.desktop), false),
          ((LayoutType.smallTablet, LayoutType.largeTablet), false),
          ((LayoutType.smallTablet, LayoutType.smallTablet), true),
          ((LayoutType.smallTablet, LayoutType.largeHandset), true),
          ((LayoutType.smallTablet, LayoutType.mediumHandset), true),
          ((LayoutType.smallTablet, LayoutType.smallHandset), true),
          ((LayoutType.largeHandset, LayoutType.desktop), false),
          ((LayoutType.largeHandset, LayoutType.largeTablet), false),
          ((LayoutType.largeHandset, LayoutType.smallTablet), false),
          ((LayoutType.largeHandset, LayoutType.largeHandset), true),
          ((LayoutType.largeHandset, LayoutType.mediumHandset), true),
          ((LayoutType.largeHandset, LayoutType.smallHandset), true),
          ((LayoutType.mediumHandset, LayoutType.desktop), false),
          ((LayoutType.mediumHandset, LayoutType.largeTablet), false),
          ((LayoutType.mediumHandset, LayoutType.smallTablet), false),
          ((LayoutType.mediumHandset, LayoutType.largeHandset), false),
          ((LayoutType.mediumHandset, LayoutType.mediumHandset), true),
          ((LayoutType.mediumHandset, LayoutType.smallHandset), true),
          ((LayoutType.smallHandset, LayoutType.desktop), false),
          ((LayoutType.smallHandset, LayoutType.largeTablet), false),
          ((LayoutType.smallHandset, LayoutType.smallTablet), false),
          ((LayoutType.smallHandset, LayoutType.largeHandset), false),
          ((LayoutType.smallHandset, LayoutType.mediumHandset), false),
          ((LayoutType.smallHandset, LayoutType.smallHandset), true),
        ];

        for (final ((LayoutType lhs, LayoutType rhs), bool expected) in testCases) {
          expect(lhs >= rhs, equals(expected));
        }
      });
    });
  });

  group("WindowType", () {
    const double ELWW = EXTRA_LARGE_WINDOW_MIN_WIDTH;
    const double LWW = LARGE_WINDOW_MIN_WIDTH;
    const double EWW = EXPANDED_WINDOW_MIN_WIDTH;
    const double MWW = MEDIUM_WINDOW_MIN_WIDTH;
    const double CWW = COMPACT_WINDOW_MIN_WIDTH;

    final List<WINDOW_TYPE_FROM_CONSTRAINTS_TEST_CASE> testCases =
        List<List<WINDOW_TYPE_FROM_CONSTRAINTS_TEST_CASE>>.generate(
      100,
      growable: false,
      (final _) => <WINDOW_TYPE_FROM_CONSTRAINTS_TEST_CASE>[
        (Size(ELWW + Random().nextInt((2400 - ELWW).round()), Random().nextDouble() * ELWW), WindowType.extraLarge),
        (Size(LWW + Random().nextInt((ELWW - LWW).round()), Random().nextDouble() * LWW), WindowType.large),
        (Size(EWW + Random().nextInt((LWW - EWW).round()), Random().nextDouble() * EWW), WindowType.expanded),
        (Size(MWW + Random().nextInt((EWW - MWW).round()), Random().nextDouble() * MWW), WindowType.medium),
        (Size(CWW + Random().nextInt((MWW - CWW).round()), Random().nextDouble() * CWW), WindowType.compact),
      ],
    ).expand((final List<WINDOW_TYPE_FROM_CONSTRAINTS_TEST_CASE> element) => element).toList(growable: false);

    test("from constraints", () {
      for (final (Size size, WindowType expected) in testCases) {
        final WindowType type = WindowType.fromConstraints(BoxConstraints.loose(size));
        expect(type, equals(expected));
      }
    });

    test("from size", () {
      for (final (Size size, WindowType expected) in testCases) {
        final WindowType type = WindowType.fromSize(size);
        expect(type, equals(expected));
      }
    });

    group("compare", () {
      test("less than", () {
        final List<((WindowType, WindowType), bool)> testCases = <((WindowType, WindowType), bool)>[
          ((WindowType.extraLarge, WindowType.extraLarge), false),
          ((WindowType.extraLarge, WindowType.large), false),
          ((WindowType.extraLarge, WindowType.expanded), false),
          ((WindowType.extraLarge, WindowType.medium), false),
          ((WindowType.extraLarge, WindowType.compact), false),
          ((WindowType.large, WindowType.extraLarge), true),
          ((WindowType.large, WindowType.large), false),
          ((WindowType.large, WindowType.expanded), false),
          ((WindowType.large, WindowType.medium), false),
          ((WindowType.large, WindowType.compact), false),
          ((WindowType.expanded, WindowType.extraLarge), true),
          ((WindowType.expanded, WindowType.large), true),
          ((WindowType.expanded, WindowType.expanded), false),
          ((WindowType.expanded, WindowType.medium), false),
          ((WindowType.expanded, WindowType.compact), false),
          ((WindowType.medium, WindowType.extraLarge), true),
          ((WindowType.medium, WindowType.large), true),
          ((WindowType.medium, WindowType.expanded), true),
          ((WindowType.medium, WindowType.medium), false),
          ((WindowType.medium, WindowType.compact), false),
          ((WindowType.compact, WindowType.extraLarge), true),
          ((WindowType.compact, WindowType.large), true),
          ((WindowType.compact, WindowType.expanded), true),
          ((WindowType.compact, WindowType.medium), true),
          ((WindowType.compact, WindowType.compact), false),
        ];

        for (final ((WindowType lhs, WindowType rhs), bool expected) in testCases) {
          expect(lhs < rhs, equals(expected));
        }
      });

      test("less than or equal", () {
        final List<((WindowType, WindowType), bool)> testCases = <((WindowType, WindowType), bool)>[
          ((WindowType.extraLarge, WindowType.extraLarge), true),
          ((WindowType.extraLarge, WindowType.large), false),
          ((WindowType.extraLarge, WindowType.expanded), false),
          ((WindowType.extraLarge, WindowType.medium), false),
          ((WindowType.extraLarge, WindowType.compact), false),
          ((WindowType.large, WindowType.extraLarge), true),
          ((WindowType.large, WindowType.large), true),
          ((WindowType.large, WindowType.expanded), false),
          ((WindowType.large, WindowType.medium), false),
          ((WindowType.large, WindowType.compact), false),
          ((WindowType.expanded, WindowType.extraLarge), true),
          ((WindowType.expanded, WindowType.large), true),
          ((WindowType.expanded, WindowType.expanded), true),
          ((WindowType.expanded, WindowType.medium), false),
          ((WindowType.expanded, WindowType.compact), false),
          ((WindowType.medium, WindowType.extraLarge), true),
          ((WindowType.medium, WindowType.large), true),
          ((WindowType.medium, WindowType.expanded), true),
          ((WindowType.medium, WindowType.medium), true),
          ((WindowType.medium, WindowType.compact), false),
          ((WindowType.compact, WindowType.extraLarge), true),
          ((WindowType.compact, WindowType.large), true),
          ((WindowType.compact, WindowType.expanded), true),
          ((WindowType.compact, WindowType.medium), true),
          ((WindowType.compact, WindowType.compact), true),
        ];

        for (final ((WindowType lhs, WindowType rhs), bool expected) in testCases) {
          expect(lhs <= rhs, equals(expected));
        }
      });

      test("greater than", () {
        final List<((WindowType, WindowType), bool)> testCases = <((WindowType, WindowType), bool)>[
          ((WindowType.extraLarge, WindowType.extraLarge), false),
          ((WindowType.extraLarge, WindowType.large), true),
          ((WindowType.extraLarge, WindowType.expanded), true),
          ((WindowType.extraLarge, WindowType.medium), true),
          ((WindowType.extraLarge, WindowType.compact), true),
          ((WindowType.large, WindowType.extraLarge), false),
          ((WindowType.large, WindowType.large), false),
          ((WindowType.large, WindowType.expanded), true),
          ((WindowType.large, WindowType.medium), true),
          ((WindowType.large, WindowType.compact), true),
          ((WindowType.expanded, WindowType.extraLarge), false),
          ((WindowType.expanded, WindowType.large), false),
          ((WindowType.expanded, WindowType.expanded), false),
          ((WindowType.expanded, WindowType.medium), true),
          ((WindowType.expanded, WindowType.compact), true),
          ((WindowType.medium, WindowType.extraLarge), false),
          ((WindowType.medium, WindowType.large), false),
          ((WindowType.medium, WindowType.expanded), false),
          ((WindowType.medium, WindowType.medium), false),
          ((WindowType.medium, WindowType.compact), true),
          ((WindowType.compact, WindowType.extraLarge), false),
          ((WindowType.compact, WindowType.large), false),
          ((WindowType.compact, WindowType.expanded), false),
          ((WindowType.compact, WindowType.medium), false),
          ((WindowType.compact, WindowType.compact), false),
        ];

        for (final ((WindowType lhs, WindowType rhs), bool expected) in testCases) {
          expect(lhs > rhs, equals(expected));
        }
      });

      test("greater than or equal", () {
        final List<((WindowType, WindowType), bool)> testCases = <((WindowType, WindowType), bool)>[
          ((WindowType.extraLarge, WindowType.extraLarge), true),
          ((WindowType.extraLarge, WindowType.large), true),
          ((WindowType.extraLarge, WindowType.expanded), true),
          ((WindowType.extraLarge, WindowType.medium), true),
          ((WindowType.extraLarge, WindowType.compact), true),
          ((WindowType.large, WindowType.extraLarge), false),
          ((WindowType.large, WindowType.large), true),
          ((WindowType.large, WindowType.expanded), true),
          ((WindowType.large, WindowType.medium), true),
          ((WindowType.large, WindowType.compact), true),
          ((WindowType.expanded, WindowType.extraLarge), false),
          ((WindowType.expanded, WindowType.large), false),
          ((WindowType.expanded, WindowType.expanded), true),
          ((WindowType.expanded, WindowType.medium), true),
          ((WindowType.expanded, WindowType.compact), true),
          ((WindowType.medium, WindowType.extraLarge), false),
          ((WindowType.medium, WindowType.large), false),
          ((WindowType.medium, WindowType.expanded), false),
          ((WindowType.medium, WindowType.medium), true),
          ((WindowType.medium, WindowType.compact), true),
          ((WindowType.compact, WindowType.extraLarge), false),
          ((WindowType.compact, WindowType.large), false),
          ((WindowType.compact, WindowType.expanded), false),
          ((WindowType.compact, WindowType.medium), false),
          ((WindowType.compact, WindowType.compact), true),
        ];

        for (final ((WindowType lhs, WindowType rhs), bool expected) in testCases) {
          expect(lhs >= rhs, equals(expected));
        }
      });
    });
  });
}
