import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skeletonize_widget/skeletonize_widget.dart';

Future<void> main() async {
  await goldenTest(
    "TextBone",
    fileName: "text",
    builder: () => GoldenTestGroup(
      columns: 2,
      children: <Widget>[
        GoldenTestScenario.builder(
          name: "single",
          builder: (final BuildContext context) {
            final TextTheme(
              :TextStyle? displayLarge,
              :TextStyle? displayMedium,
              :TextStyle? displaySmall,
              :TextStyle? headlineLarge,
              :TextStyle? headlineMedium,
              :TextStyle? headlineSmall,
              :TextStyle? titleLarge,
              :TextStyle? titleMedium,
              :TextStyle? titleSmall,
              :TextStyle? labelLarge,
              :TextStyle? labelMedium,
              :TextStyle? labelSmall,
              :TextStyle? bodyLarge,
              :TextStyle? bodyMedium,
              :TextStyle? bodySmall,
            ) = Theme.of(context).textTheme;

            return Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: <Widget>[
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(child: Text("Display Large", style: displayLarge)),
                    Flexible(child: TextBone.fromText(FAKE_NAME, style: displayLarge!)),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(child: Text("Display Medium", style: displayMedium)),
                    Flexible(child: TextBone.fromText(FAKE_NAME, style: displayMedium!)),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(child: Text("Display Small", style: displaySmall)),
                    Flexible(child: TextBone.fromText(FAKE_NAME, style: displaySmall!)),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(child: Text("Headline Large", style: headlineLarge)),
                    Flexible(child: TextBone.fromText(FAKE_NAME, style: headlineLarge!)),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(child: Text("Headline Medium", style: headlineMedium)),
                    Flexible(child: TextBone.fromText(FAKE_NAME, style: headlineMedium!)),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(child: Text("Headline Small", style: headlineSmall)),
                    Flexible(child: TextBone.fromText(FAKE_NAME, style: headlineSmall!)),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(child: Text("Title Large", style: titleLarge)),
                    Flexible(child: TextBone.fromText(FAKE_NAME, style: titleLarge!)),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(child: Text("Title Medium", style: titleMedium)),
                    Flexible(child: TextBone.fromText(FAKE_NAME, style: titleMedium!)),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(child: Text("Title Small", style: titleSmall)),
                    Flexible(child: TextBone.fromText(FAKE_NAME, style: titleSmall!)),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(child: Text("Label Large", style: labelLarge)),
                    Flexible(child: TextBone.fromText(FAKE_NAME, style: labelLarge!)),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(child: Text("Label Medium", style: labelMedium)),
                    Flexible(child: TextBone.fromText(FAKE_NAME, style: labelMedium!)),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(child: Text("Label Small", style: labelSmall)),
                    Flexible(child: TextBone.fromText(FAKE_NAME, style: labelSmall!)),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(child: Text("Body Large", style: bodyLarge)),
                    Flexible(child: TextBone.fromText(FAKE_NAME, style: bodyLarge!)),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(child: Text("Body Medium", style: bodyMedium)),
                    Flexible(child: TextBone.fromText(FAKE_NAME, style: bodyMedium!)),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(child: Text("Body Small", style: bodySmall)),
                    Flexible(child: TextBone.fromText(FAKE_NAME, style: bodySmall!)),
                  ],
                ),
              ],
            );
          },
        ),
        GoldenTestScenario.builder(
          name: "multiline",
          constraints: const BoxConstraints.tightFor(width: 400),
          builder: (final BuildContext context) {
            final TextTheme(
              :TextStyle? labelLarge,
            ) = Theme.of(context).textTheme;

            return Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: <Widget>[
                Row(
                  spacing: 8,
                  children: <Widget>[
                    Flexible(child: Text(FAKE_PARAGRAPH, style: labelLarge)),
                    Flexible(
                      child: MultiLineTextBone(
                        style: labelLarge!,
                        lines: 7,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    ),
  );
}
