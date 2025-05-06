import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension GoogleFontsExtension on GoogleFonts {
  static CupertinoTextThemeData notoSansJpCupertinoTextTheme([final TextTheme? textTheme]) {
    final TextTheme(:TextStyle? headlineLarge, :TextStyle? titleLarge, :TextStyle? bodyMedium, :TextStyle? labelSmall) =
        GoogleFonts.notoSansJpTextTheme(textTheme);

    return CupertinoTextThemeData(
      textStyle: bodyMedium?.copyWith(
        inherit: _kDefaultTextStyle.inherit,
        fontSize: _kDefaultTextStyle.fontSize,
        fontWeight: _kDefaultTextStyle.fontWeight,
        letterSpacing: _kDefaultTextStyle.letterSpacing,
        color: _kDefaultTextStyle.color,
        decoration: _kDefaultTextStyle.decoration,
      ),
      actionTextStyle: bodyMedium?.copyWith(
        inherit: _kDefaultActionTextStyle.inherit,
        fontSize: _kDefaultActionTextStyle.fontSize,
        fontWeight: _kDefaultActionTextStyle.fontWeight,
        letterSpacing: _kDefaultActionTextStyle.letterSpacing,
        color: _kDefaultActionTextStyle.color,
        decoration: _kDefaultActionTextStyle.decoration,
      ),
      tabLabelTextStyle: labelSmall?.copyWith(
        inherit: _kDefaultTabLabelTextStyle.inherit,
        fontSize: _kDefaultTabLabelTextStyle.fontSize,
        fontWeight: _kDefaultTabLabelTextStyle.fontWeight,
        letterSpacing: _kDefaultTabLabelTextStyle.letterSpacing,
        color: _kDefaultTabLabelTextStyle.color,
        decoration: _kDefaultTabLabelTextStyle.decoration,
      ),
      navTitleTextStyle: bodyMedium?.copyWith(
        inherit: _kDefaultMiddleTitleTextStyle.inherit,
        fontSize: _kDefaultMiddleTitleTextStyle.fontSize,
        fontWeight: _kDefaultMiddleTitleTextStyle.fontWeight,
        letterSpacing: _kDefaultMiddleTitleTextStyle.letterSpacing,
        color: _kDefaultMiddleTitleTextStyle.color,
        decoration: _kDefaultMiddleTitleTextStyle.decoration,
      ),
      navLargeTitleTextStyle: headlineLarge?.copyWith(
        inherit: _kDefaultLargeTitleTextStyle.inherit,
        fontSize: _kDefaultLargeTitleTextStyle.fontSize,
        fontWeight: _kDefaultLargeTitleTextStyle.fontWeight,
        letterSpacing: _kDefaultLargeTitleTextStyle.letterSpacing,
        color: _kDefaultLargeTitleTextStyle.color,
        decoration: _kDefaultLargeTitleTextStyle.decoration,
      ),
      navActionTextStyle: bodyMedium?.copyWith(
        inherit: _kDefaultActionTextStyle.inherit,
        fontSize: _kDefaultActionTextStyle.fontSize,
        fontWeight: _kDefaultActionTextStyle.fontWeight,
        letterSpacing: _kDefaultActionTextStyle.letterSpacing,
        color: _kDefaultActionTextStyle.color,
        decoration: _kDefaultActionTextStyle.decoration,
      ),
      pickerTextStyle: titleLarge?.copyWith(
        inherit: _kDefaultPickerTextStyle.inherit,
        fontSize: _kDefaultPickerTextStyle.fontSize,
        fontWeight: _kDefaultPickerTextStyle.fontWeight,
        letterSpacing: _kDefaultPickerTextStyle.letterSpacing,
        color: _kDefaultPickerTextStyle.color,
        decoration: _kDefaultPickerTextStyle.decoration,
      ),
      dateTimePickerTextStyle: titleLarge?.copyWith(
        inherit: _kDefaultDateTimePickerTextStyle.inherit,
        fontSize: _kDefaultDateTimePickerTextStyle.fontSize,
        fontWeight: _kDefaultDateTimePickerTextStyle.fontWeight,
        letterSpacing: _kDefaultDateTimePickerTextStyle.letterSpacing,
        color: _kDefaultDateTimePickerTextStyle.color,
        decoration: _kDefaultDateTimePickerTextStyle.decoration,
      ),
    );
  }
}

//! Copied from https://github.com/flutter/flutter/blob/master/packages/flutter/lib/src/cupertino/text_theme.dart .

// Please update _TextThemeDefaultsBuilder accordingly after changing the default
// color here, as their implementation depends on the default value of the color
// field.
//
// Values derived from https://developer.apple.com/design/resources/.
const TextStyle _kDefaultTextStyle = TextStyle(
  inherit: false,
  fontSize: 17,
  letterSpacing: -0.41,
  color: CupertinoColors.label,
  decoration: TextDecoration.none,
);

// Please update _TextThemeDefaultsBuilder accordingly after changing the default
// color here, as their implementation depends on the default value of the color
// field.
//
// Values derived from https://developer.apple.com/design/resources/.
const TextStyle _kDefaultActionTextStyle = TextStyle(
  inherit: false,
  fontSize: 17,
  letterSpacing: -0.41,
  color: CupertinoColors.activeBlue,
  decoration: TextDecoration.none,
);

// Please update _TextThemeDefaultsBuilder accordingly after changing the default
// color here, as their implementation depends on the default value of the color
// field.
//
// Values derived from https://developer.apple.com/design/resources/.
const TextStyle _kDefaultTabLabelTextStyle = TextStyle(
  inherit: false,
  fontSize: 10,
  fontWeight: FontWeight.w500,
  letterSpacing: -0.24,
  color: CupertinoColors.inactiveGray,
);

const TextStyle _kDefaultMiddleTitleTextStyle = TextStyle(
  inherit: false,
  fontSize: 17,
  fontWeight: FontWeight.w600,
  letterSpacing: -0.41,
  color: CupertinoColors.label,
);

const TextStyle _kDefaultLargeTitleTextStyle = TextStyle(
  inherit: false,
  fontSize: 34,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.38,
  color: CupertinoColors.label,
);

// Please update _TextThemeDefaultsBuilder accordingly after changing the default
// color here, as their implementation depends on the default value of the color
// field.
//
// Inspected on iOS 13 simulator with "Debug View Hierarchy".
// Value extracted from off-center labels. Centered labels have a font size of 25pt.
//
// The letterSpacing sourced from iOS 14 simulator screenshots for comparison.
// See also:
//
// * https://github.com/flutter/flutter/pull/65501#discussion_r486557093
const TextStyle _kDefaultPickerTextStyle = TextStyle(
  inherit: false,
  fontSize: 21,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.6,
  color: CupertinoColors.label,
);

// Please update _TextThemeDefaultsBuilder accordingly after changing the default
// color here, as their implementation depends on the default value of the color
// field.
//
// Inspected on iOS 13 simulator with "Debug View Hierarchy".
// Value extracted from off-center labels. Centered labels have a font size of 25pt.
const TextStyle _kDefaultDateTimePickerTextStyle = TextStyle(
  inherit: false,
  fontSize: 21,
  letterSpacing: 0.4,
  fontWeight: FontWeight.normal,
  color: CupertinoColors.label,
);
