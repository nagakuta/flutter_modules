import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skeletonize_widget/src/widgets/bone/_widget.dart';

Future<void> main() async {
  await goldenTest(
    "ButtonBone",
    fileName: "button",
    builder: () => GoldenTestGroup(
      columns: 2,
      children: <Widget>[
        GoldenTestScenario(
          name: "elevated",
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Elevated"),
          ),
        ),
        GoldenTestScenario(
          name: "bone",
          child: const ButtonBone.elevated(),
        ),
        GoldenTestScenario(
          name: "filled",
          child: FilledButton(
            onPressed: () {},
            child: const Text("Filled"),
          ),
        ),
        GoldenTestScenario(
          name: "bone",
          child: const ButtonBone.filled(),
        ),
        GoldenTestScenario(
          name: "outlined",
          child: OutlinedButton(
            onPressed: () {},
            child: const Text("Outlined"),
          ),
        ),
        GoldenTestScenario(
          name: "bone",
          child: const ButtonBone.outlined(),
        ),
        GoldenTestScenario(
          name: "text",
          child: TextButton(
            onPressed: () {},
            child: const Text("Text"),
          ),
        ),
        GoldenTestScenario(
          name: "bone",
          child: const ButtonBone.text(),
        ),
      ],
    ),
  );

  await goldenTest(
    "IconButtonBone",
    fileName: "icon_button",
    builder: () => GoldenTestGroup(
      columns: 2,
      children: <Widget>[
        GoldenTestScenario(
          name: "icon",
          child: IconButton.filled(
            onPressed: () {},
            icon: const Icon(Icons.abc),
          ),
        ),
        GoldenTestScenario(
          name: "bone",
          child: const IconButtonBone(),
        ),
      ],
    ),
  );
}
