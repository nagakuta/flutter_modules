import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skeletonize_widget/src/widgets/bone/_widget.dart';

Future<void> main() async {
  await goldenTest(
    "CircleBone",
    fileName: "circle",
    builder: () => GoldenTestGroup(
      columns: 2,
      children: <Widget>[
        GoldenTestScenario(
          name: "circle",
          child: const DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: SizedBox.square(dimension: 24.0 * 2),
          ),
        ),
        GoldenTestScenario(
          name: "bone",
          child: const CircleBone(radius: 24),
        ),
      ],
    ),
  );
}
