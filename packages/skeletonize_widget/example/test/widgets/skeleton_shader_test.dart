import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:skeletonize_widget/src/effects/effect.dart';
import 'package:skeletonize_widget/src/widgets/bone/_widget.dart';
import 'package:skeletonize_widget/src/widgets/effect_loading.dart';
import 'package:skeletonize_widget/src/widgets/skeleton_shader.dart';

void main() {
  group("SkeletonShader", () {
    testGoldens("loading", (final WidgetTester tester) async {
      await tester.pumpWidgetBuilder(
        Center(
          child: EffectLoading(
            effect: ShimmerEffect(),
            isLoading: true,
            child: const SkeletonShader(
              child: ColoredBox(
                color: Colors.red,
                child: SizedBox.square(dimension: 48),
              ),
            ),
          ),
        ),
        wrapper: materialAppWrapper(),
        surfaceSize: const Size(60, 60),
      );

      await screenMatchesGolden(
        tester,
        "skeleton_shader/loading",
        customPump: (final WidgetTester tester) => tester.pump(),
      );
    });

    testGoldens("replaced", (final WidgetTester tester) async {
      await tester.pumpWidgetBuilder(
        Center(
          child: EffectLoading(
            effect: ShimmerEffect(),
            isLoading: true,
            child: const SkeletonShader(
              bone: CircleBone(radius: 24),
              child: ColoredBox(
                color: Colors.red,
                child: SizedBox.square(dimension: 48),
              ),
            ),
          ),
        ),
        wrapper: materialAppWrapper(),
        surfaceSize: const Size(60, 60),
      );

      await screenMatchesGolden(
        tester,
        "skeleton_shader/replaced",
        customPump: (final WidgetTester tester) => tester.pump(),
      );
    });

    testGoldens("not loading", (final WidgetTester tester) async {
      await tester.pumpWidgetBuilder(
        Center(
          child: EffectLoading(
            effect: ShimmerEffect(),
            isLoading: false,
            child: const SkeletonShader(
              child: ColoredBox(
                color: Colors.red,
                child: SizedBox.square(dimension: 48),
              ),
            ),
          ),
        ),
        wrapper: materialAppWrapper(),
        surfaceSize: const Size(60, 60),
      );

      await screenMatchesGolden(
        tester,
        "skeleton_shader/not_loading",
        customPump: (final WidgetTester tester) => tester.pump(),
      );
    });
  });
}
