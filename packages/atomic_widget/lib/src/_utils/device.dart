// ignore_for_file: public_member_api_docs

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/src/_utils/adaptive/types.dart';

part 'device.freezed.dart';

@visibleForTesting
@Freezed(
  fromJson: false,
  toJson: false,
  map: FreezedMapOptions.none,
  when: FreezedWhenOptions.none,
)
sealed class GoldenDevice with _$GoldenDevice {
  const factory GoldenDevice.iPhoneSE({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = IPhoneSE;

  const factory GoldenDevice.iPhoneXR({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = IPhoneXR;

  const factory GoldenDevice.iPhone12Pro({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = IPhone12Pro;

  const factory GoldenDevice.iPhone14ProMax({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = IPhone14ProMax;

  const factory GoldenDevice.pixel7({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = Pixel7;

  const factory GoldenDevice.galaxyS8Plus({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = GalaxyS8Plus;

  const factory GoldenDevice.galaxyS20Ultra({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = GalaxyS20Ultra;

  const factory GoldenDevice.iPadAir({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = IPadAir;

  const factory GoldenDevice.iPadMini({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = IPadMini;

  const factory GoldenDevice.iPadPro({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = IPadPro;

  const factory GoldenDevice.surfacePro7({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = SurfacePro7;

  const factory GoldenDevice.surfaceDuo({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = SurfaceDuo;

  const factory GoldenDevice.galaxyFold({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = GalaxyFold;

  const factory GoldenDevice.galaxyA51({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = GalaxyA51;

  const factory GoldenDevice.nestHub({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = NestHub;

  const factory GoldenDevice.nestHubMax({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = NestHubMax;

  const factory GoldenDevice.webBrowser({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = WebBrowser;

  const factory GoldenDevice.fullScreenWebBrowser({
    @Default(1.0) final double textScale,
    @Default(Brightness.light) final Brightness brightness,
  }) = FullScreenWebBrowser;

  const GoldenDevice._();

  static List<GoldenDevice> get all => const <GoldenDevice>[
        IPhoneSE(),
        IPhoneXR(),
        IPhone12Pro(),
        IPhone14ProMax(),
        Pixel7(),
        GalaxyS8Plus(),
        GalaxyS20Ultra(),
        IPadAir(),
        IPadMini(),
        IPadPro(),
        SurfacePro7(),
        SurfaceDuo(),
        GalaxyFold(),
        GalaxyA51(),
        NestHub(),
        NestHubMax(),
        WebBrowser(),
        FullScreenWebBrowser(),
      ];

  static List<GoldenDevice> get android => all
      .where(
        (final GoldenDevice device) => switch (device.platform) {
          TargetPlatform.android => true,
          _ => false,
        },
      )
      .toList(growable: false);

  static List<GoldenDevice> get iOS => all
      .where(
        (final GoldenDevice device) => switch (device.platform) {
          TargetPlatform.iOS || TargetPlatform.macOS => true,
          _ => false,
        },
      )
      .toList(growable: false);

  static List<GoldenDevice> get smallHandsets => all
      .where((final GoldenDevice device) => device.breakpoint.layoutType == LayoutType.smallHandset)
      .toList(growable: false);

  static List<GoldenDevice> get mediumHandsets => all
      .where((final GoldenDevice device) => device.breakpoint.layoutType == LayoutType.mediumHandset)
      .toList(growable: false);

  static List<GoldenDevice> get largeHandsets => all
      .where((final GoldenDevice device) => device.breakpoint.layoutType == LayoutType.largeHandset)
      .toList(growable: false);

  static List<GoldenDevice> get smallTablets => all
      .where((final GoldenDevice device) => device.breakpoint.layoutType == LayoutType.smallTablet)
      .toList(growable: false);

  static List<GoldenDevice> get largeTablets => all
      .where((final GoldenDevice device) => device.breakpoint.layoutType == LayoutType.largeTablet)
      .toList(growable: false);

  static List<GoldenDevice> get desktops => all
      .where((final GoldenDevice device) => device.breakpoint.layoutType == LayoutType.desktop)
      .toList(growable: false);

  static List<GoldenDevice> get compacts => all
      .where((final GoldenDevice device) => device.breakpoint.windowType == WindowType.compact)
      .toList(growable: false);

  static List<GoldenDevice> get mediums => all
      .where((final GoldenDevice device) => device.breakpoint.windowType == WindowType.medium)
      .toList(growable: false);

  static List<GoldenDevice> get expandeds => all
      .where((final GoldenDevice device) => device.breakpoint.windowType == WindowType.expanded)
      .toList(growable: false);

  static List<GoldenDevice> get larges => all
      .where((final GoldenDevice device) => device.breakpoint.windowType == WindowType.large)
      .toList(growable: false);

  static List<GoldenDevice> get extraLarges => all
      .where((final GoldenDevice device) => device.breakpoint.windowType == WindowType.extraLarge)
      .toList(growable: false);

  Size get size => switch (this) {
        IPhoneSE() => const Size(375, 667),
        IPhoneXR() => const Size(414, 896),
        IPhone12Pro() => const Size(390, 844),
        IPhone14ProMax() => const Size(430, 932),
        Pixel7() => const Size(412, 915),
        GalaxyS8Plus() => const Size(360, 740),
        GalaxyS20Ultra() => const Size(412, 915),
        IPadAir() => const Size(820, 1180),
        IPadMini() => const Size(768, 1024),
        IPadPro() => const Size(1024, 1366),
        SurfacePro7() => const Size(912, 1368),
        SurfaceDuo() => const Size(540, 720),
        GalaxyFold() => const Size(280, 653),
        GalaxyA51() => const Size(412, 914),
        NestHub() => const Size(1024, 600),
        NestHubMax() => const Size(1280, 800),
        WebBrowser() => const Size(1600, 900),
        FullScreenWebBrowser() => const Size(1920, 1080),
      };

  Breakpoint get breakpoint => Breakpoint.fromSize(size);

  String get name => switch (this) {
        IPhoneSE() => "iPhoneSE",
        IPhoneXR() => "iPhoneXR",
        IPhone12Pro() => "iPhone12Pro",
        IPhone14ProMax() => "iPhone14ProMax",
        Pixel7() => "Pixel7",
        GalaxyS8Plus() => "GalaxyS8Plus",
        GalaxyS20Ultra() => "GalaxyS20Ultra",
        IPadAir() => "iPadAir",
        IPadMini() => "iPadMini",
        IPadPro() => "iPadPro",
        SurfacePro7() => "SurfacePro7",
        SurfaceDuo() => "SurfaceDuo",
        GalaxyFold() => "GalaxyFold",
        GalaxyA51() => "GalaxyA51",
        NestHub() => "NestHub",
        NestHubMax() => "NestHubMax",
        WebBrowser() => "WebBrowser",
        FullScreenWebBrowser() => "FullScreenWebBrowser",
      };

  TargetPlatform get platform => switch (this) {
        IPhoneSE() ||
        IPhoneXR() ||
        IPhone12Pro() ||
        IPhone14ProMax() ||
        IPadAir() ||
        IPadMini() ||
        IPadPro() =>
          TargetPlatform.iOS,
        Pixel7() ||
        GalaxyS8Plus() ||
        GalaxyS20Ultra() ||
        SurfacePro7() ||
        SurfaceDuo() ||
        GalaxyFold() ||
        GalaxyA51() ||
        NestHub() ||
        NestHubMax() =>
          TargetPlatform.android,
        _ => throw UnsupportedError("$name not supported."),
      };

  double get pixelRatio => switch (this) {
        IPhoneSE() ||
        IPhoneXR() ||
        IPadAir() ||
        IPadMini() ||
        IPadPro() ||
        SurfacePro7() ||
        NestHub() ||
        NestHubMax() =>
          2.0,
        SurfaceDuo() => 2.5,
        Pixel7() || GalaxyA51() => 2.6,
        IPhone12Pro() || IPhone14ProMax() || GalaxyFold() => 3.0,
        GalaxyS20Ultra() => 3.5,
        GalaxyS8Plus() => 4.0,
        _ => 1.0,
      };
}
