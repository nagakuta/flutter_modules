import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skeletonize_widget/src/effects/effect.dart';
import 'package:skeletonize_widget/src/widgets/bone/_widget.dart';
import 'package:skeletonize_widget/src/widgets/effect_loading.dart';
import 'package:skeletonize_widget/src/widgets/skeleton_shader.dart';

Future<void> main() async {
  await goldenTest(
    "SkeletonShader",
    fileName: "skeleton_shader",
    pumpBeforeTest: pumpOnce,
    builder: () => GoldenTestGroup(
      columns: 3,
      children: <Widget>[
        GoldenTestScenario(
          name: "loading",
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
        GoldenTestScenario(
          name: "replaced",
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
        GoldenTestScenario(
          name: "not loading",
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
      ],
    ),
  );
}
