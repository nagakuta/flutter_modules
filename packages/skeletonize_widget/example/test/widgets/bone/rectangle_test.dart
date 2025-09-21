import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skeletonize_widget/src/widgets/bone/_widget.dart';

Future<void> main() async {
  await goldenTest(
    "RectangleBone",
    fileName: "rectangle",
    builder: () => GoldenTestGroup(
      columns: 2,
      children: <Widget>[
        GoldenTestScenario(
          name: "rectangle",
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const SizedBox.square(dimension: 48),
          ),
        ),
        GoldenTestScenario(
          name: "bone",
          child: RectangleBone(
            size: const Size.square(48),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    ),
  );
}
