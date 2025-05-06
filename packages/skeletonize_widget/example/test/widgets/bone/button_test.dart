import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonize_widget/src/widgets/bone/_widget.dart';

void main() {
  group("ButtonBone", () {
    testGoldens("elevated", (final WidgetTester tester) async {
      await tester.pumpWidgetBuilder(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: const Text("Elevated"),
            ),
            const ButtonBone.elevated(),
          ],
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData(textTheme: GoogleFonts.notoSansJpTextTheme()),
        ),
        surfaceSize: const Size(240, 60),
      );

      await screenMatchesGolden(tester, "button/elevated");
    });

    testGoldens("filled", (final WidgetTester tester) async {
      await tester.pumpWidgetBuilder(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FilledButton(
              onPressed: () {},
              child: const Text("Filled"),
            ),
            const ButtonBone.filled(),
          ],
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData(textTheme: GoogleFonts.notoSansJpTextTheme()),
        ),
        surfaceSize: const Size(240, 60),
      );

      await screenMatchesGolden(tester, "button/filled");
    });

    testGoldens("outlined", (final WidgetTester tester) async {
      await tester.pumpWidgetBuilder(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            OutlinedButton(
              onPressed: () {},
              child: const Text("Outlined"),
            ),
            const ButtonBone.outlined(),
          ],
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData(textTheme: GoogleFonts.notoSansJpTextTheme()),
        ),
        surfaceSize: const Size(240, 60),
      );

      await screenMatchesGolden(tester, "button/outlined");
    });

    testGoldens("text", (final WidgetTester tester) async {
      await tester.pumpWidgetBuilder(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(
              onPressed: () {},
              child: const Text("Text"),
            ),
            const ButtonBone.text(),
          ],
        ),
        wrapper: materialAppWrapper(
          theme: ThemeData(textTheme: GoogleFonts.notoSansJpTextTheme()),
        ),
        surfaceSize: const Size(240, 60),
      );

      await screenMatchesGolden(tester, "button/text");
    });
  });

  testGoldens("IconButtonBone", (final WidgetTester tester) async {
    await tester.pumpWidgetBuilder(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton.filled(
            onPressed: () {},
            icon: const Icon(Icons.abc),
          ),
          const IconButtonBone(),
        ],
      ),
      wrapper: materialAppWrapper(),
      surfaceSize: const Size(120, 60),
    );

    await screenMatchesGolden(tester, "button/icon");
  });
}
