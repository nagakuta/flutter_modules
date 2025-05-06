import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonize_widget/src/_utils/fakes.dart';
import 'package:skeletonize_widget/src/widgets/bone/_widget.dart';

void main() {
  testGoldens("TextBone", (final WidgetTester tester) async {
    await tester.pumpWidgetBuilder(
      Builder(
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: Text("Display Large", style: displayLarge)),
                  Flexible(child: TextBone.fromText(FAKE_NAME, style: displayLarge!)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Display Medium", style: displayMedium)),
                  Flexible(child: TextBone.fromText(FAKE_NAME, style: displayMedium!)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Display Small", style: displaySmall)),
                  Flexible(child: TextBone.fromText(FAKE_NAME, style: displaySmall!)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Headline Large", style: headlineLarge)),
                  Flexible(child: TextBone.fromText(FAKE_NAME, style: headlineLarge!)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Headline Medium", style: headlineMedium)),
                  Flexible(child: TextBone.fromText(FAKE_NAME, style: headlineMedium!)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Headline Small", style: headlineSmall)),
                  Flexible(child: TextBone.fromText(FAKE_NAME, style: headlineSmall!)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Title Large", style: titleLarge)),
                  Flexible(child: TextBone.fromText(FAKE_NAME, style: titleLarge!)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Title Medium", style: titleMedium)),
                  Flexible(child: TextBone.fromText(FAKE_NAME, style: titleMedium!)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Title Small", style: titleSmall)),
                  Flexible(child: TextBone.fromText(FAKE_NAME, style: titleSmall!)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Label Large", style: labelLarge)),
                  Flexible(child: TextBone.fromText(FAKE_NAME, style: labelLarge!)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Label Medium", style: labelMedium)),
                  Flexible(child: TextBone.fromText(FAKE_NAME, style: labelMedium!)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Label Small", style: labelSmall)),
                  Flexible(child: TextBone.fromText(FAKE_NAME, style: labelSmall!)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Body Large", style: bodyLarge)),
                  Flexible(child: TextBone.fromText(FAKE_NAME, style: bodyLarge!)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Body Medium", style: bodyMedium)),
                  Flexible(child: TextBone.fromText(FAKE_NAME, style: bodyMedium!)),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Body Small", style: bodySmall)),
                  Flexible(child: TextBone.fromText(FAKE_NAME, style: bodySmall!)),
                ],
              ),
            ],
          );
        },
      ),
      wrapper: materialAppWrapper(
        theme: ThemeData(textTheme: GoogleFonts.notoSansJpTextTheme()),
      ),
    );

    await screenMatchesGolden(tester, "text/single");
  });

  testGoldens("MultiLineTextBone", (final WidgetTester tester) async {
    await tester.pumpWidgetBuilder(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Builder(
          builder: (final BuildContext context) {
            final TextTheme(:TextStyle? labelLarge) = Theme.of(context).textTheme;
            return Row(
              children: <Widget>[
                Flexible(child: Text(FAKE_PARAGRAPH, style: labelLarge)),
                const SizedBox(width: 8),
                Flexible(
                  child: MultiLineTextBone(
                    style: labelLarge!,
                    lines: 5,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      wrapper: materialAppWrapper(
        theme: ThemeData(textTheme: GoogleFonts.notoSansJpTextTheme()),
      ),
      surfaceSize: const Size(480, 120),
    );

    await screenMatchesGolden(tester, "text/multi_line");
  });
}
