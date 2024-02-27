// ignore_for_file: public_member_api_docs

import 'package:flutter/widgets.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

@visibleForTesting
enum DeviceSize {
  iPhoneSE,
  iPhoneXR,
  iPhone12Pro,
  iPhone14ProMax,
  pixel7,
  galaxyS8Plus,
  galaxyS20Ultra,
  iPadAir,
  iPadMini,
  iPadPro,
  surfacePro7,
  surfaceDuo,
  galaxyFold,
  galaxyA51,
  nestHub,
  nestHubMax,
  webBrowser,
  fullScreenWebBrowser;

  Device get config => switch (this) {
        DeviceSize.iPhoneSE => Device(
            size: const Size(375, 667),
            devicePixelRatio: 2,
            name: name,
          ),
        DeviceSize.iPhoneXR => Device(
            size: const Size(414, 896),
            devicePixelRatio: 2,
            name: name,
          ),
        DeviceSize.iPhone12Pro => Device(
            size: const Size(390, 844),
            devicePixelRatio: 3,
            name: name,
          ),
        DeviceSize.iPhone14ProMax => Device(
            size: const Size(430, 932),
            devicePixelRatio: 3,
            name: name,
          ),
        DeviceSize.pixel7 => Device(
            size: const Size(412, 915),
            devicePixelRatio: 2.6,
            name: name,
          ),
        DeviceSize.galaxyS8Plus => Device(
            size: const Size(360, 740),
            devicePixelRatio: 4,
            name: name,
          ),
        DeviceSize.galaxyS20Ultra => Device(
            size: const Size(412, 915),
            devicePixelRatio: 3.5,
            name: name,
          ),
        DeviceSize.iPadAir => Device(
            size: const Size(820, 1180),
            devicePixelRatio: 2,
            name: name,
          ),
        DeviceSize.iPadMini => Device(
            size: const Size(768, 1024),
            devicePixelRatio: 2,
            name: name,
          ),
        DeviceSize.iPadPro => Device(
            size: const Size(1024, 1366),
            devicePixelRatio: 2,
            name: name,
          ),
        DeviceSize.surfacePro7 => Device(
            size: const Size(912, 1368),
            devicePixelRatio: 2,
            name: name,
          ),
        DeviceSize.surfaceDuo => Device(
            size: const Size(540, 720),
            devicePixelRatio: 2.5,
            name: name,
          ),
        DeviceSize.galaxyFold => Device(
            size: const Size(280, 653),
            devicePixelRatio: 3,
            name: name,
          ),
        DeviceSize.galaxyA51 => Device(
            size: const Size(412, 914),
            devicePixelRatio: 2.6,
            name: name,
          ),
        DeviceSize.nestHub => Device(
            size: const Size(1024, 600),
            devicePixelRatio: 2,
            name: name,
          ),
        DeviceSize.nestHubMax => Device(
            size: const Size(1280, 800),
            devicePixelRatio: 2,
            name: name,
          ),
        DeviceSize.webBrowser => Device(
            size: const Size(1600, 900),
            name: name,
          ),
        DeviceSize.fullScreenWebBrowser => Device(
            size: const Size(1920, 1080),
            name: name,
          ),
      };

  static List<DeviceSize> get android => <DeviceSize>[
        DeviceSize.galaxyA51,
        DeviceSize.galaxyFold,
        DeviceSize.galaxyS20Ultra,
        DeviceSize.galaxyS8Plus,
        DeviceSize.nestHub,
        DeviceSize.nestHubMax,
        DeviceSize.pixel7,
        DeviceSize.surfaceDuo,
        DeviceSize.surfacePro7,
      ];

  static List<DeviceSize> get iOS => <DeviceSize>[
        DeviceSize.iPadAir,
        DeviceSize.iPadMini,
        DeviceSize.iPadPro,
        DeviceSize.iPhone12Pro,
        DeviceSize.iPhone14ProMax,
        DeviceSize.iPhoneSE,
        DeviceSize.iPhoneXR,
      ];

  static List<DeviceSize> get web => <DeviceSize>[
        DeviceSize.webBrowser,
        DeviceSize.fullScreenWebBrowser,
      ];

  static List<DeviceSize> get smallHandsets =>
      DeviceSize.values.where((final DeviceSize device) => device.config.size.width < 360).toList(growable: false);

  static List<DeviceSize> get mediumHandsets => DeviceSize.values
      .where((final DeviceSize device) => device.config.size.width >= 360 && device.config.size.width < 400)
      .toList(growable: false);

  static List<DeviceSize> get largeHandsets => DeviceSize.values
      .where((final DeviceSize device) => device.config.size.width >= 400 && device.config.size.width < 600)
      .toList(growable: false);

  static List<DeviceSize> get smallTablets => DeviceSize.values
      .where((final DeviceSize device) => device.config.size.width >= 600 && device.config.size.width < 720)
      .toList(growable: false);

  static List<DeviceSize> get largeTablets => DeviceSize.values
      .where((final DeviceSize device) => device.config.size.width >= 720 && device.config.size.width < 1024)
      .toList(growable: false);

  static List<DeviceSize> get desktops =>
      DeviceSize.values.where((final DeviceSize device) => device.config.size.width >= 1024).toList(growable: false);
}
