import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> testExecutable(final FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final TextTheme textTheme = GoogleFonts.notoSansJpTextTheme();

  return AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      goldenTestTheme: GoldenTestTheme(
        backgroundColor: Colors.white,
        borderColor: Colors.black87,
        nameTextStyle: textTheme.labelMedium!,
        padding: const EdgeInsets.all(8),
      ),
      theme: ThemeData.light().copyWith(textTheme: textTheme),
    ),
    run: () async {
      GoogleFonts.config.allowRuntimeFetching = false;
      await _loadCustomFonts();

      await testMain();
    },
  );
}

Future<void> _loadCustomFonts() async {
  final FontLoader fontLoader = FontLoader("Roboto")
    ..addFont(rootBundle.load("assets/google_fonts/NotoSansJP-Black.ttf"))
    ..addFont(rootBundle.load("assets/google_fonts/NotoSansJP-Bold.ttf"))
    ..addFont(rootBundle.load("assets/google_fonts/NotoSansJP-ExtraBold.ttf"))
    ..addFont(rootBundle.load("assets/google_fonts/NotoSansJP-ExtraLight.ttf"))
    ..addFont(rootBundle.load("assets/google_fonts/NotoSansJP-Light.ttf"))
    ..addFont(rootBundle.load("assets/google_fonts/NotoSansJP-Medium.ttf"))
    ..addFont(rootBundle.load("assets/google_fonts/NotoSansJP-Regular.ttf"))
    ..addFont(rootBundle.load("assets/google_fonts/NotoSansJP-SemiBold.ttf"))
    ..addFont(rootBundle.load("assets/google_fonts/NotoSansJP-Thin.ttf"));

  await fontLoader.load(); // Load custom fonts
}
