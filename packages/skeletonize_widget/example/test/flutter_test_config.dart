import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> testExecutable(final FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  return GoldenToolkit.runWithConfiguration(
    config: GoldenToolkitConfiguration(
      //! Currently, goldens are not generated/validated in CI for this repo.
      //! We have settled on the goldens for this package being captured/validated by developers running on MacOSX.
      //! We may revisit this in the future if there is a reason to invest in more sophistication.
      // skipGoldenAssertion: () => !Platform.isMacOS,
      deviceFileNameFactory: (final String name, final Device device) => "goldens/$name/${device.name}.png",
      enableRealShadows: true,
    ),
    () async {
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
  await loadAppFonts(); // Load material icons
}
