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
  nestHubMax;

  Device get config => switch (this) {
        DeviceSize.iPhoneSE => const Device(
            size: Size(375, 667),
            devicePixelRatio: 2,
            name: "iPhone SE",
          ),
        DeviceSize.iPhoneXR => const Device(
            size: Size(414, 896),
            devicePixelRatio: 2,
            name: "iPhone XR",
          ),
        DeviceSize.iPhone12Pro => const Device(
            size: Size(390, 844),
            devicePixelRatio: 3,
            name: "iPhone 12 Pro",
          ),
        DeviceSize.iPhone14ProMax => const Device(
            size: Size(430, 932),
            devicePixelRatio: 3,
            name: "iPhone 14 Pro Max",
          ),
        DeviceSize.pixel7 => const Device(
            size: Size(412, 915),
            devicePixelRatio: 2.6,
            name: "Pixel 5",
          ),
        DeviceSize.galaxyS8Plus => const Device(
            size: Size(360, 740),
            devicePixelRatio: 4,
            name: "Galaxy S8+",
          ),
        DeviceSize.galaxyS20Ultra => const Device(
            size: Size(412, 915),
            devicePixelRatio: 3.5,
            name: "Galaxy S20 Ultra",
          ),
        DeviceSize.iPadAir => const Device(
            size: Size(820, 1180),
            devicePixelRatio: 2,
            name: "iPad Air",
          ),
        DeviceSize.iPadMini => const Device(
            size: Size(768, 1024),
            devicePixelRatio: 2,
            name: "iPad Mini",
          ),
        DeviceSize.iPadPro => const Device(
            size: Size(1024, 1366),
            devicePixelRatio: 2,
            name: "iPad Pro",
          ),
        DeviceSize.surfacePro7 => const Device(
            size: Size(912, 1368),
            devicePixelRatio: 2,
            name: "Surface Pro 7",
          ),
        DeviceSize.surfaceDuo => const Device(
            size: Size(540, 720),
            devicePixelRatio: 2.5,
            name: "Surface Duo",
          ),
        DeviceSize.galaxyFold => const Device(
            size: Size(280, 653),
            devicePixelRatio: 3,
            name: "Galaxy Fold",
          ),
        DeviceSize.galaxyA51 => const Device(
            size: Size(412, 914),
            devicePixelRatio: 2.6,
            name: "Galaxy A51",
          ),
        DeviceSize.nestHub => const Device(
            size: Size(1024, 600),
            devicePixelRatio: 2,
            name: "Nest Hub",
          ),
        DeviceSize.nestHubMax => const Device(
            size: Size(1280, 800),
            devicePixelRatio: 2,
            name: "Nest Hub Max",
          ),
      };
}
