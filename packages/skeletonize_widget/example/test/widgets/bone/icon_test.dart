import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skeletonize_widget/src/widgets/bone/_widget.dart';

Future<void> main() async {
  await goldenTest(
    "IconBone",
    fileName: "icon",
    builder: () => GoldenTestGroup(
      columns: 2,
      children: <Widget>[
        GoldenTestScenario(
          name: "icon",
          child: const Icon(Icons.abc),
        ),
        GoldenTestScenario(
          name: "bone",
          child: const IconBone(),
        ),
      ],
    ),
  );
}
