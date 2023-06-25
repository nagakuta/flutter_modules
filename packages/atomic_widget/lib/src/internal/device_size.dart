// ignore_for_file: public_member_api_docs

import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

part 'device_size.freezed.dart';

@visibleForTesting
@freezed
class DeviceSize with _$DeviceSize {
  const factory DeviceSize.galaxyS8() = GalaxyS8DeviceSize;

  const factory DeviceSize.iPhoneSE() = iPhoneSEDeviceSize;

  const factory DeviceSize.iPhoneXR() = iPhoneXRDeviceSize;

  const factory DeviceSize.iPhone12Pro() = iPhone12ProDeviceSize;

  const factory DeviceSize.pixel5() = Pixel5DeviceSize;

  const factory DeviceSize.galaxyS8Plus() = GalaxyS8PlusDeviceSize;

  const factory DeviceSize.galaxyS20Ultra() = GalaxyS20UltraDeviceSize;

  const factory DeviceSize.iPadAir() = iPadAirDeviceSize;

  const factory DeviceSize.iPadMini() = iPadMiniDeviceSize;

  const factory DeviceSize.surfacePro7() = SurfacePro7DeviceSize;

  const factory DeviceSize.surfaceDuo() = SurfaceDuoDeviceSize;

  const factory DeviceSize.galaxyFold() = GalaxyFoldDeviceSize;

  const factory DeviceSize.galaxyA51() = GalaxyA51DeviceSize;

  const factory DeviceSize.nestHub() = NestHubDeviceSize;

  const factory DeviceSize.nestHubMax() = NestHubMaxDeviceSize;

  const DeviceSize._();

  static List<DeviceSize> get all => <DeviceSize>[
        const DeviceSize.galaxyS8(),
        const DeviceSize.iPhoneSE(),
        const DeviceSize.iPhoneXR(),
        const DeviceSize.iPhone12Pro(),
        const DeviceSize.pixel5(),
        const DeviceSize.galaxyS8Plus(),
        const DeviceSize.galaxyS20Ultra(),
        const DeviceSize.iPadAir(),
        const DeviceSize.iPadMini(),
        const DeviceSize.surfacePro7(),
        const DeviceSize.surfaceDuo(),
        const DeviceSize.galaxyFold(),
        const DeviceSize.galaxyA51(),
        const DeviceSize.nestHub(),
        const DeviceSize.nestHubMax(),
      ];
}

@visibleForTesting
extension DeviceSizeExtension on DeviceSize {
  Device get device => when(
        galaxyS8: () => const Device(
          size: Size(360, 740),
          devicePixelRatio: 3,
          name: "Galaxy S8",
        ),
        iPhoneSE: () => const Device(
          size: Size(375, 667),
          devicePixelRatio: 2,
          name: "iPhone SE",
        ),
        iPhoneXR: () => const Device(
          size: Size(414, 896),
          devicePixelRatio: 2,
          name: "iPhone XR",
        ),
        iPhone12Pro: () => const Device(
          size: Size(390, 844),
          devicePixelRatio: 3,
          name: "iPhone 12 Pro",
        ),
        pixel5: () => const Device(
          size: Size(393, 851),
          devicePixelRatio: 2.8,
          name: "Pixel 5",
        ),
        galaxyS8Plus: () => const Device(
          size: Size(360, 740),
          devicePixelRatio: 4,
          name: "Galaxy S8+",
        ),
        galaxyS20Ultra: () => const Device(
          size: Size(412, 915),
          devicePixelRatio: 3.5,
          name: "Galaxy S20 Ultra",
        ),
        iPadAir: () => const Device(
          size: Size(820, 1180),
          devicePixelRatio: 2,
          name: "iPad Air",
        ),
        iPadMini: () => const Device(
          size: Size(768, 1024),
          devicePixelRatio: 2,
          name: "iPad Mini",
        ),
        surfacePro7: () => const Device(
          size: Size(912, 1368),
          devicePixelRatio: 2,
          name: "Surface Pro 7",
        ),
        surfaceDuo: () => const Device(
          size: Size(540, 720),
          devicePixelRatio: 2.5,
          name: "Surface Duo",
        ),
        galaxyFold: () => const Device(
          size: Size(280, 653),
          devicePixelRatio: 3,
          name: "Galaxy Fold",
        ),
        galaxyA51: () => const Device(
          size: Size(412, 914),
          devicePixelRatio: 2.6,
          name: "Galaxy A51",
        ),
        nestHub: () => const Device(
          size: Size(1024, 600),
          devicePixelRatio: 2,
          name: "Nest Hub",
        ),
        nestHubMax: () => const Device(
          size: Size(1280, 800),
          devicePixelRatio: 2,
          name: "Nest Hub Max",
        ),
      );
}
