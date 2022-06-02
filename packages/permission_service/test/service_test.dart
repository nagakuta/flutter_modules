import 'package:analytics_service/analytics_service.dart';
import 'package:crashlytics_service/crashlytics_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:permission_handler/permission_handler.dart' as handler;
import 'package:permission_service/src/client.dart';
import 'package:permission_service/src/service.dart';
import 'package:permission_service/src/types.dart';
import 'package:riverpod/riverpod.dart';

import 'client.mocks.dart';

void main() {
  group("PermissionService", () {
    final MockPermissionClient mockPermissionClient = MockPermissionClient();
    final MockAnalyticsService mockAnalyticsService = MockAnalyticsService();
    final MockCrashlyticsService mockCrashlyticsService =
        MockCrashlyticsService();

    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        permissionClientProvider.overrideWithValue(mockPermissionClient),
        analyticsServiceProvider.overrideWithProvider(
          (final _) => Provider<AnalyticsService>(
            (final _) => mockAnalyticsService,
          ),
        ),
        crashlyticsServiceProvider.overrideWithValue(mockCrashlyticsService),
      ],
    );

    setUp(() {
      reset(mockPermissionClient);
      reset(mockAnalyticsService);
      reset(mockCrashlyticsService);
      when(
        mockPermissionClient.getAccessMediaLocationStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getAccessNotificationPolicyStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getActivityRecognitionStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getAppTrackingTransparencyStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getBluetoothAdvertiseStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getBluetoothConnectStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getBluetoothScanStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getBluetoothStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getCalendarStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getCameraStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getContactsStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getCriticalAlertsStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getIgnoreBatteryOptimizationsStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getLocationAlwaysStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getLocationStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getLocationWhenInUseStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getManageExternalStorageStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getMediaLibraryStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getMicrophoneStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getNotificationStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getPhoneStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getPhotosAddOnlyStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getPhotosStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getRemindersStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getRequestInstallPackagesStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getSensorsStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getSmsStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getSpeechStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getStorageStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getSystemAlertWindowStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getUnknownStatus(),
      ).thenAnswer(
        (final _) async => handler.PermissionStatus.denied,
      );
      when(
        mockPermissionClient.getLocationAlwaysServiceStatus(),
      ).thenAnswer(
        (final _) async => handler.ServiceStatus.disabled,
      );
      when(
        mockPermissionClient.getLocationServiceStatus(),
      ).thenAnswer(
        (final _) async => handler.ServiceStatus.disabled,
      );
      when(
        mockPermissionClient.getLocationWhenInUseServiceStatus(),
      ).thenAnswer(
        (final _) async => handler.ServiceStatus.disabled,
      );
      when(
        mockPermissionClient.getPhoneServiceStatus(),
      ).thenAnswer(
        (final _) async => handler.ServiceStatus.disabled,
      );
    });

    group("setCurrentPermissionStatus", () {
      test("succeeded", () async {
        final PermissionService service =
            container.refresh(permissionServiceProvider);

        try {
          await service.setCurrentPermissionStatus();

          expect(service.debugState, isNotNull);
          expect(service.debugState, isA<Permission>());
          expect(
            service.debugState.accessMediaLocation,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.accessNotificationPolicy,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.activityRecognition,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.appTrackingTransparency,
            isA<DeniedPermissionStatus>(),
          );
          expect(service.debugState.bluetooth, isA<DeniedPermissionStatus>());
          expect(
            service.debugState.bluetoothAdvertise,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.bluetoothConnect,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.bluetoothScan,
            isA<DeniedPermissionStatus>(),
          );
          expect(service.debugState.calendar, isA<DeniedPermissionStatus>());
          expect(service.debugState.camera, isA<DeniedPermissionStatus>());
          expect(service.debugState.contacts, isA<DeniedPermissionStatus>());
          expect(
            service.debugState.criticalAlerts,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.ignoreBatteryOptimizations,
            isA<DeniedPermissionStatus>(),
          );
          expect(service.debugState.location, isA<DeniedPermissionStatus>());
          expect(
            service.debugState.locationAlways,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.locationWhenInUse,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.manageExternalStorage,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.mediaLibrary,
            isA<DeniedPermissionStatus>(),
          );
          expect(service.debugState.microphone, isA<DeniedPermissionStatus>());
          expect(
            service.debugState.notification,
            isA<DeniedPermissionStatus>(),
          );
          expect(service.debugState.phone, isA<DeniedPermissionStatus>());
          expect(service.debugState.photos, isA<DeniedPermissionStatus>());
          expect(
            service.debugState.photosAddOnly,
            isA<DeniedPermissionStatus>(),
          );
          expect(service.debugState.reminders, isA<DeniedPermissionStatus>());
          expect(
            service.debugState.requestInstallPackages,
            isA<DeniedPermissionStatus>(),
          );
          expect(service.debugState.sensors, isA<DeniedPermissionStatus>());
          expect(service.debugState.sms, isA<DeniedPermissionStatus>());
          expect(service.debugState.speech, isA<DeniedPermissionStatus>());
          expect(service.debugState.storage, isA<DeniedPermissionStatus>());
          expect(
            service.debugState.systemAlertWindow,
            isA<DeniedPermissionStatus>(),
          );
          expect(service.debugState.unknown, isA<DeniedPermissionStatus>());

          verifyInOrder(
            <Future<dynamic>>[
              mockPermissionClient.getCalendarStatus(),
              mockPermissionClient.getCameraStatus(),
              mockPermissionClient.getContactsStatus(),
              mockPermissionClient.getLocationServiceStatus(),
              mockPermissionClient.getLocationAlwaysServiceStatus(),
              mockPermissionClient.getLocationWhenInUseServiceStatus(),
              mockPermissionClient.getMediaLibraryStatus(),
              mockPermissionClient.getMicrophoneStatus(),
              mockPermissionClient.getPhoneServiceStatus(),
              mockPermissionClient.getPhotosStatus(),
              mockPermissionClient.getPhotosAddOnlyStatus(),
              mockPermissionClient.getRemindersStatus(),
              mockPermissionClient.getSensorsStatus(),
              mockPermissionClient.getSmsStatus(),
              mockPermissionClient.getSpeechStatus(),
              mockPermissionClient.getStorageStatus(),
              mockPermissionClient.getIgnoreBatteryOptimizationsStatus(),
              mockPermissionClient.getNotificationStatus(),
              mockPermissionClient.getAccessMediaLocationStatus(),
              mockPermissionClient.getActivityRecognitionStatus(),
              mockPermissionClient.getUnknownStatus(),
              mockPermissionClient.getBluetoothStatus(),
              mockPermissionClient.getManageExternalStorageStatus(),
              mockPermissionClient.getSystemAlertWindowStatus(),
              mockPermissionClient.getRequestInstallPackagesStatus(),
              mockPermissionClient.getAppTrackingTransparencyStatus(),
              mockPermissionClient.getCriticalAlertsStatus(),
              mockPermissionClient.getAccessNotificationPolicyStatus(),
              mockPermissionClient.getBluetoothScanStatus(),
              mockPermissionClient.getBluetoothAdvertiseStatus(),
              mockPermissionClient.getBluetoothConnectStatus(),
              mockPermissionClient.getLocationStatus(),
              mockPermissionClient.getLocationAlwaysStatus(),
              mockPermissionClient.getLocationWhenInUseStatus(),
              mockPermissionClient.getPhoneStatus(),
            ],
          );
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockPermissionClient.getAccessMediaLocationStatus(),
        ).thenThrow(
          Exception("MOCKED GET ACCESS MEDIA LOCATION STATUS EXCEPTION"),
        );

        final PermissionService service =
            container.refresh(permissionServiceProvider);

        try {
          await service.setCurrentPermissionStatus();

          expect(service.debugState, isNotNull);
          expect(service.debugState, isA<Permission>());
          expect(
            service.debugState.accessMediaLocation,
            isA<NotDeterminedPermissionStatus>(),
          );
          expect(
            service.debugState.accessNotificationPolicy,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.activityRecognition,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.appTrackingTransparency,
            isA<DeniedPermissionStatus>(),
          );
          expect(service.debugState.bluetooth, isA<DeniedPermissionStatus>());
          expect(
            service.debugState.bluetoothAdvertise,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.bluetoothConnect,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.bluetoothScan,
            isA<DeniedPermissionStatus>(),
          );
          expect(service.debugState.calendar, isA<DeniedPermissionStatus>());
          expect(service.debugState.camera, isA<DeniedPermissionStatus>());
          expect(service.debugState.contacts, isA<DeniedPermissionStatus>());
          expect(
            service.debugState.criticalAlerts,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.ignoreBatteryOptimizations,
            isA<DeniedPermissionStatus>(),
          );
          expect(service.debugState.location, isA<DeniedPermissionStatus>());
          expect(
            service.debugState.locationAlways,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.locationWhenInUse,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.manageExternalStorage,
            isA<DeniedPermissionStatus>(),
          );
          expect(
            service.debugState.mediaLibrary,
            isA<DeniedPermissionStatus>(),
          );
          expect(service.debugState.microphone, isA<DeniedPermissionStatus>());
          expect(
            service.debugState.notification,
            isA<DeniedPermissionStatus>(),
          );
          expect(service.debugState.phone, isA<DeniedPermissionStatus>());
          expect(service.debugState.photos, isA<DeniedPermissionStatus>());
          expect(
            service.debugState.photosAddOnly,
            isA<DeniedPermissionStatus>(),
          );
          expect(service.debugState.reminders, isA<DeniedPermissionStatus>());
          expect(
            service.debugState.requestInstallPackages,
            isA<DeniedPermissionStatus>(),
          );
          expect(service.debugState.sensors, isA<DeniedPermissionStatus>());
          expect(service.debugState.sms, isA<DeniedPermissionStatus>());
          expect(service.debugState.speech, isA<DeniedPermissionStatus>());
          expect(service.debugState.storage, isA<DeniedPermissionStatus>());
          expect(
            service.debugState.systemAlertWindow,
            isA<DeniedPermissionStatus>(),
          );
          expect(service.debugState.unknown, isA<DeniedPermissionStatus>());

          verifyInOrder(
            <Future<dynamic>>[
              mockPermissionClient.getCalendarStatus(),
              mockPermissionClient.getCameraStatus(),
              mockPermissionClient.getContactsStatus(),
              mockPermissionClient.getLocationServiceStatus(),
              mockPermissionClient.getLocationAlwaysServiceStatus(),
              mockPermissionClient.getLocationWhenInUseServiceStatus(),
              mockPermissionClient.getMediaLibraryStatus(),
              mockPermissionClient.getMicrophoneStatus(),
              mockPermissionClient.getPhoneServiceStatus(),
              mockPermissionClient.getPhotosStatus(),
              mockPermissionClient.getPhotosAddOnlyStatus(),
              mockPermissionClient.getRemindersStatus(),
              mockPermissionClient.getSensorsStatus(),
              mockPermissionClient.getSmsStatus(),
              mockPermissionClient.getSpeechStatus(),
              mockPermissionClient.getStorageStatus(),
              mockPermissionClient.getIgnoreBatteryOptimizationsStatus(),
              mockPermissionClient.getNotificationStatus(),
              mockPermissionClient.getAccessMediaLocationStatus(),
              mockPermissionClient.getActivityRecognitionStatus(),
              mockPermissionClient.getUnknownStatus(),
              mockPermissionClient.getBluetoothStatus(),
              mockPermissionClient.getManageExternalStorageStatus(),
              mockPermissionClient.getSystemAlertWindowStatus(),
              mockPermissionClient.getRequestInstallPackagesStatus(),
              mockPermissionClient.getAppTrackingTransparencyStatus(),
              mockPermissionClient.getCriticalAlertsStatus(),
              mockPermissionClient.getAccessNotificationPolicyStatus(),
              mockPermissionClient.getBluetoothScanStatus(),
              mockPermissionClient.getBluetoothAdvertiseStatus(),
              mockPermissionClient.getBluetoothConnectStatus(),
              mockPermissionClient.getLocationStatus(),
              mockPermissionClient.getLocationAlwaysStatus(),
              mockPermissionClient.getLocationWhenInUseStatus(),
              mockPermissionClient.getPhoneStatus(),
            ],
          );
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("getServiceStatus", () {
      group("location", () {
        setUp(() {
          when(
            mockPermissionClient.getLocationServiceStatus(),
          ).thenAnswer(
            (final _) async => handler.ServiceStatus.disabled,
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            final ServiceStatus status =
                await service.getServiceStatus(ServiceType.location);

            expect(status, isNotNull);
            expect(status, isA<DisabledServiceStatus>());

            verify(
              mockPermissionClient.getLocationServiceStatus(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.getLocationServiceStatus(),
          ).thenThrow(
            Exception("MOCKED GET LOCATION SERVICE STATUS EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.getServiceStatus(ServiceType.location),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED GET LOCATION SERVICE STATUS EXCEPTION",
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.getLocationServiceStatus(),
          ).called(1);
        });
      });

      group("locationAlways", () {
        setUp(() {
          when(
            mockPermissionClient.getLocationAlwaysServiceStatus(),
          ).thenAnswer(
            (final _) async => handler.ServiceStatus.disabled,
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            final ServiceStatus status =
                await service.getServiceStatus(ServiceType.locationAlways);

            expect(status, isNotNull);
            expect(status, isA<DisabledServiceStatus>());

            verify(
              mockPermissionClient.getLocationAlwaysServiceStatus(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.getLocationAlwaysServiceStatus(),
          ).thenThrow(
            Exception("MOCKED GET LOCATION ALWAYS SERVICE STATUS EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.getServiceStatus(ServiceType.locationAlways),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED GET LOCATION ALWAYS SERVICE STATUS EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.getLocationAlwaysServiceStatus(),
          ).called(1);
        });
      });

      group("locationWhenInUse", () {
        setUp(() {
          when(
            mockPermissionClient.getLocationWhenInUseServiceStatus(),
          ).thenAnswer(
            (final _) async => handler.ServiceStatus.disabled,
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            final ServiceStatus status =
                await service.getServiceStatus(ServiceType.locationWhenInUse);

            expect(status, isNotNull);
            expect(status, isA<DisabledServiceStatus>());

            verify(
              mockPermissionClient.getLocationWhenInUseServiceStatus(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.getLocationWhenInUseServiceStatus(),
          ).thenThrow(
            Exception(
              "MOCKED GET LOCATION WHEN IN USE SERVICE STATUS EXCEPTION",
            ),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.getServiceStatus(ServiceType.locationWhenInUse),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED GET LOCATION WHEN IN USE SERVICE STATUS EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.getLocationWhenInUseServiceStatus(),
          ).called(1);
        });
      });

      group("phone", () {
        setUp(() {
          when(
            mockPermissionClient.getPhoneServiceStatus(),
          ).thenAnswer(
            (final _) async => handler.ServiceStatus.disabled,
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            final ServiceStatus status =
                await service.getServiceStatus(ServiceType.phone);

            expect(status, isNotNull);
            expect(status, isA<DisabledServiceStatus>());

            verify(
              mockPermissionClient.getPhoneServiceStatus(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.getPhoneServiceStatus(),
          ).thenThrow(
            Exception("MOCKED GET PHONE SERVICE STATUS EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.getServiceStatus(ServiceType.phone),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("Exception: MOCKED GET PHONE SERVICE STATUS EXCEPTION"),
              ),
            ),
          );

          verify(
            mockPermissionClient.getPhoneServiceStatus(),
          ).called(1);
        });
      });
    });

    group("requestPermissions", () {
      setUp(() {
        when(
          mockPermissionClient.getAccessMediaLocationStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getAccessNotificationPolicyStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getActivityRecognitionStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getAppTrackingTransparencyStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getBluetoothAdvertiseStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getBluetoothConnectStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getBluetoothScanStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getBluetoothStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getCalendarStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getCameraStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getContactsStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getCriticalAlertsStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getIgnoreBatteryOptimizationsStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getLocationAlwaysStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getLocationStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getLocationWhenInUseStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getManageExternalStorageStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getMediaLibraryStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getMicrophoneStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getNotificationStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getPhoneStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getPhotosAddOnlyStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getPhotosStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getRemindersStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getRequestInstallPackagesStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getSensorsStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getSmsStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getSpeechStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getStorageStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getSystemAlertWindowStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
        when(
          mockPermissionClient.getUnknownStatus(),
        ).thenAnswer(
          (final _) async => handler.PermissionStatus.denied,
        );
      });

      group("accessMediaLocation", () {
        setUp(() {
          when(
            mockPermissionClient.requestAccessMediaLocationPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  accessMediaLocation: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.accessMediaLocation),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestAccessMediaLocationPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service
                .requestPermissions(PermissionType.accessMediaLocation);

            expect(
              service.debugState.accessMediaLocation,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestAccessMediaLocationPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestAccessMediaLocationPermission(),
          ).thenThrow(
            Exception(
              "MOCKED REQUEST ACCESS MEDIA LOCATION PERMISSION EXCEPTION",
            ),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.accessMediaLocation),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST ACCESS MEDIA LOCATION PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestAccessMediaLocationPermission(),
          ).called(1);
        });
      });

      group("accessNotificationPolicy", () {
        setUp(() {
          when(
            mockPermissionClient.requestAccessNotificationPolicyPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  accessNotificationPolicy: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.accessNotificationPolicy),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestAccessNotificationPolicyPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service
                .requestPermissions(PermissionType.accessNotificationPolicy);

            expect(service.debugState.accessNotificationPolicy, isNotNull);
            expect(
              service.debugState.accessNotificationPolicy,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestAccessNotificationPolicyPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestAccessNotificationPolicyPermission(),
          ).thenThrow(
            Exception(
              "MOCKED REQUEST ACCESS NOTIFICATION POLICY PERMISSION EXCEPTION",
            ),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.accessNotificationPolicy),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST ACCESS NOTIFICATION POLICY PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestAccessNotificationPolicyPermission(),
          ).called(1);
        });
      });

      group("activityRecognition", () {
        setUp(() {
          when(
            mockPermissionClient.requestActivityRecognitionPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  activityRecognition: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.activityRecognition),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestActivityRecognitionPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service
                .requestPermissions(PermissionType.activityRecognition);

            expect(service.debugState.activityRecognition, isNotNull);
            expect(
              service.debugState.activityRecognition,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestActivityRecognitionPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestActivityRecognitionPermission(),
          ).thenThrow(
            Exception(
              "MOCKED REQUEST ACTIVITY RECOGNITION PERMISSION EXCEPTION",
            ),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.activityRecognition),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST ACTIVITY RECOGNITION PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestActivityRecognitionPermission(),
          ).called(1);
        });
      });

      group("appTrackingTransparency", () {
        setUp(() {
          when(
            mockPermissionClient.requestAppTrackingTransparencyPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  appTrackingTransparency: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.appTrackingTransparency),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestAppTrackingTransparencyPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service
                .requestPermissions(PermissionType.appTrackingTransparency);

            expect(service.debugState.appTrackingTransparency, isNotNull);
            expect(
              service.debugState.appTrackingTransparency,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestAppTrackingTransparencyPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestAppTrackingTransparencyPermission(),
          ).thenThrow(
            Exception(
              "MOCKED REQUEST APP TRACKING TRANSPARENCY PERMISSION EXCEPTION",
            ),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.appTrackingTransparency),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST APP TRACKING TRANSPARENCY PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestAppTrackingTransparencyPermission(),
          ).called(1);
        });
      });

      group("bluetoothAdvertise", () {
        setUp(() {
          when(
            mockPermissionClient.requestBluetoothAdvertisePermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  bluetoothAdvertise: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.bluetoothAdvertise),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestBluetoothAdvertisePermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.bluetoothAdvertise);

            expect(service.debugState.bluetoothAdvertise, isNotNull);
            expect(
              service.debugState.bluetoothAdvertise,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestBluetoothAdvertisePermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestBluetoothAdvertisePermission(),
          ).thenThrow(
            Exception(
              "MOCKED REQUEST BLUETOOTH ADVERTISE PERMISSION EXCEPTION",
            ),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.bluetoothAdvertise),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST BLUETOOTH ADVERTISE PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestBluetoothAdvertisePermission(),
          ).called(1);
        });
      });

      group("bluetoothConnect", () {
        setUp(() {
          when(
            mockPermissionClient.requestBluetoothConnectPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  bluetoothConnect: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.bluetoothConnect),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestBluetoothConnectPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.bluetoothConnect);

            expect(service.debugState.bluetoothConnect, isNotNull);
            expect(
              service.debugState.bluetoothConnect,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestBluetoothConnectPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestBluetoothConnectPermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST BLUETOOTH CONNECT PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.bluetoothConnect),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST BLUETOOTH CONNECT PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestBluetoothConnectPermission(),
          ).called(1);
        });
      });

      group("bluetooth", () {
        setUp(() {
          when(
            mockPermissionClient.requestBluetoothPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  bluetooth: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.bluetooth),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestBluetoothPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.bluetooth);

            expect(service.debugState.bluetooth, isNotNull);
            expect(
              service.debugState.bluetooth,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestBluetoothPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestBluetoothPermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST BLUETOOTH PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.bluetooth),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST BLUETOOTH PERMISSION EXCEPTION",
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestBluetoothPermission(),
          ).called(1);
        });
      });

      group("bluetoothScan", () {
        setUp(() {
          when(
            mockPermissionClient.requestBluetoothScanPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  bluetoothScan: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.bluetoothScan),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestBluetoothScanPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.bluetoothScan);

            expect(service.debugState.bluetoothScan, isNotNull);
            expect(
              service.debugState.bluetoothScan,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestBluetoothScanPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestBluetoothScanPermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST BLUETOOTH SCAN PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.bluetoothScan),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST BLUETOOTH SCAN PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestBluetoothScanPermission(),
          ).called(1);
        });
      });

      group("calendar", () {
        setUp(() {
          when(
            mockPermissionClient.requestCalendarPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  calendar: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.calendar),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestCalendarPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.calendar);

            expect(service.debugState.calendar, isNotNull);
            expect(service.debugState.calendar, isA<GrantedPermissionStatus>());

            verify(
              mockPermissionClient.requestCalendarPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestCalendarPermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST CALENDAR PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.calendar),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST CALENDAR PERMISSION EXCEPTION",
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestCalendarPermission(),
          ).called(1);
        });
      });

      group("camera", () {
        setUp(() {
          when(
            mockPermissionClient.requestCameraPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  camera: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.camera),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestCameraPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.camera);

            expect(service.debugState.camera, isNotNull);
            expect(service.debugState.camera, isA<GrantedPermissionStatus>());

            verify(
              mockPermissionClient.requestCameraPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestCameraPermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST CAMERA PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.camera),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST CAMERA PERMISSION EXCEPTION",
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestCameraPermission(),
          ).called(1);
        });
      });

      group("contacts", () {
        setUp(() {
          when(
            mockPermissionClient.requestContactsPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  contacts: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.contacts),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestContactsPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.contacts);

            expect(service.debugState.contacts, isNotNull);
            expect(service.debugState.contacts, isA<GrantedPermissionStatus>());

            verify(
              mockPermissionClient.requestContactsPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestContactsPermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST CONTACTS PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.contacts),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST CONTACTS PERMISSION EXCEPTION",
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestContactsPermission(),
          ).called(1);
        });
      });

      group("criticalAlerts", () {
        setUp(() {
          when(
            mockPermissionClient.requestCriticalAlertsPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  criticalAlerts: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.criticalAlerts),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestCriticalAlertsPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.criticalAlerts);

            expect(service.debugState.criticalAlerts, isNotNull);
            expect(
              service.debugState.criticalAlerts,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestCriticalAlertsPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestCriticalAlertsPermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST CRITICAL ALERTS PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.criticalAlerts),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST CRITICAL ALERTS PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestCriticalAlertsPermission(),
          ).called(1);
        });
      });

      group("ignoreBatteryOptimizations", () {
        setUp(() {
          when(
            mockPermissionClient.requestIgnoreBatteryOptimizationsPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  ignoreBatteryOptimizations: PermissionStatus.granted(),
                );

          await expectLater(
            service
                .requestPermissions(PermissionType.ignoreBatteryOptimizations),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestIgnoreBatteryOptimizationsPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service
                .requestPermissions(PermissionType.ignoreBatteryOptimizations);

            expect(service.debugState.ignoreBatteryOptimizations, isNotNull);
            expect(
              service.debugState.ignoreBatteryOptimizations,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient
                  .requestIgnoreBatteryOptimizationsPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestIgnoreBatteryOptimizationsPermission(),
          ).thenThrow(
            Exception(
              "MOCKED REQUEST IGNORE BATTERY OPTIMIZATIONS PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
            ),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service
                .requestPermissions(PermissionType.ignoreBatteryOptimizations),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST IGNORE BATTERY OPTIMIZATIONS PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestIgnoreBatteryOptimizationsPermission(),
          ).called(1);
        });
      });

      group("locationAlways", () {
        setUp(() {
          when(
            mockPermissionClient.getLocationAlwaysServiceStatus(),
          ).thenAnswer(
            (final _) async => handler.ServiceStatus.enabled,
          );
          when(
            mockPermissionClient.requestLocationAlwaysPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  locationAlways: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.locationAlways),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.getLocationAlwaysServiceStatus(),
          );

          verifyNever(
            mockPermissionClient.requestLocationAlwaysPermission(),
          );
        });

        test("service is not enabled", () async {
          when(
            mockPermissionClient.getLocationAlwaysServiceStatus(),
          ).thenAnswer(
            (final _) async => handler.ServiceStatus.disabled,
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.locationAlways),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Service not supported."),
              ),
            ),
          );

          verify(
            mockPermissionClient.getLocationAlwaysServiceStatus(),
          ).called(1);

          verifyNever(
            mockPermissionClient.requestLocationAlwaysPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.locationAlways);

            expect(service.debugState.locationAlways, isNotNull);
            expect(
              service.debugState.locationAlways,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.getLocationAlwaysServiceStatus(),
            ).called(1);

            verify(
              mockPermissionClient.requestLocationAlwaysPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        group("failed", () {
          test("get service status has error ", () async {
            when(
              mockPermissionClient.getLocationAlwaysServiceStatus(),
            ).thenThrow(
              Exception("MOCKED GET LOCATION ALWAYS SERVICE STATUS EXCEPTION"),
            );

            final PermissionService service =
                container.refresh(permissionServiceProvider);

            await expectLater(
              service.requestPermissions(PermissionType.locationAlways),
              throwsA(
                isException.having(
                  (final Exception exception) => exception.toString(),
                  "message",
                  equals(
                    "Exception: MOCKED GET LOCATION ALWAYS SERVICE STATUS EXCEPTION", // ignore: lines_longer_than_80_chars
                  ),
                ),
              ),
            );

            verify(
              mockPermissionClient.getLocationAlwaysServiceStatus(),
            ).called(1);

            verifyNever(
              mockPermissionClient.requestLocationAlwaysPermission(),
            );
          });

          test("request permission has error", () async {
            when(
              mockPermissionClient.requestLocationAlwaysPermission(),
            ).thenThrow(
              Exception("MOCKED REQUEST LOCATION ALWAYS PERMISSION EXCEPTION"),
            );

            final PermissionService service =
                container.refresh(permissionServiceProvider);

            await expectLater(
              service.requestPermissions(PermissionType.locationAlways),
              throwsA(
                isException.having(
                  (final Exception exception) => exception.toString(),
                  "message",
                  equals(
                    "Exception: MOCKED REQUEST LOCATION ALWAYS PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                  ),
                ),
              ),
            );

            verify(
              mockPermissionClient.getLocationAlwaysServiceStatus(),
            ).called(1);

            verify(
              mockPermissionClient.requestLocationAlwaysPermission(),
            ).called(1);
          });
        });
      });

      group("location", () {
        setUp(() {
          when(
            mockPermissionClient.getLocationServiceStatus(),
          ).thenAnswer(
            (final _) async => handler.ServiceStatus.enabled,
          );
          when(
            mockPermissionClient.requestLocationPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  location: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.location),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.getLocationServiceStatus(),
          );

          verifyNever(
            mockPermissionClient.requestLocationPermission(),
          );
        });

        test("service is not enabled", () async {
          when(
            mockPermissionClient.getLocationServiceStatus(),
          ).thenAnswer(
            (final _) async => handler.ServiceStatus.disabled,
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.location),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Service not supported."),
              ),
            ),
          );

          verify(
            mockPermissionClient.getLocationServiceStatus(),
          ).called(1);

          verifyNever(
            mockPermissionClient.requestLocationPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.location);

            expect(service.debugState.location, isNotNull);
            expect(service.debugState.location, isA<GrantedPermissionStatus>());

            verify(
              mockPermissionClient.getLocationServiceStatus(),
            ).called(1);

            verify(
              mockPermissionClient.requestLocationPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        group("failed", () {
          test("get service status has error ", () async {
            when(
              mockPermissionClient.getLocationServiceStatus(),
            ).thenThrow(
              Exception("MOCKED GET LOCATION SERVICE STATUS EXCEPTION"),
            );

            final PermissionService service =
                container.refresh(permissionServiceProvider);

            await expectLater(
              service.requestPermissions(PermissionType.location),
              throwsA(
                isException.having(
                  (final Exception exception) => exception.toString(),
                  "message",
                  equals(
                    "Exception: MOCKED GET LOCATION SERVICE STATUS EXCEPTION", // ignore: lines_longer_than_80_chars
                  ),
                ),
              ),
            );

            verify(
              mockPermissionClient.getLocationServiceStatus(),
            ).called(1);

            verifyNever(
              mockPermissionClient.requestLocationPermission(),
            );
          });

          test("request permission has error", () async {
            when(
              mockPermissionClient.requestLocationPermission(),
            ).thenThrow(
              Exception("MOCKED REQUEST LOCATION PERMISSION EXCEPTION"),
            );

            final PermissionService service =
                container.refresh(permissionServiceProvider);

            await expectLater(
              service.requestPermissions(PermissionType.location),
              throwsA(
                isException.having(
                  (final Exception exception) => exception.toString(),
                  "message",
                  equals(
                    "Exception: MOCKED REQUEST LOCATION PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                  ),
                ),
              ),
            );

            verify(
              mockPermissionClient.getLocationServiceStatus(),
            ).called(1);

            verify(
              mockPermissionClient.requestLocationPermission(),
            ).called(1);
          });
        });
      });

      group("locationWhenInUse", () {
        setUp(() {
          when(
            mockPermissionClient.getLocationWhenInUseServiceStatus(),
          ).thenAnswer(
            (final _) async => handler.ServiceStatus.enabled,
          );
          when(
            mockPermissionClient.requestLocationWhenInUsePermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  locationWhenInUse: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.locationWhenInUse),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.getLocationWhenInUseServiceStatus(),
          );

          verifyNever(
            mockPermissionClient.requestLocationWhenInUsePermission(),
          );
        });

        test("service is not enabled", () async {
          when(
            mockPermissionClient.getLocationWhenInUseServiceStatus(),
          ).thenAnswer(
            (final _) async => handler.ServiceStatus.disabled,
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.locationWhenInUse),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Service not supported."),
              ),
            ),
          );

          verify(
            mockPermissionClient.getLocationWhenInUseServiceStatus(),
          ).called(1);

          verifyNever(
            mockPermissionClient.requestLocationWhenInUsePermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.locationWhenInUse);

            expect(service.debugState.locationWhenInUse, isNotNull);
            expect(
              service.debugState.locationWhenInUse,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.getLocationWhenInUseServiceStatus(),
            ).called(1);

            verify(
              mockPermissionClient.requestLocationWhenInUsePermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        group("failed", () {
          test("get service status has error ", () async {
            when(
              mockPermissionClient.getLocationWhenInUseServiceStatus(),
            ).thenThrow(
              Exception(
                "MOCKED GET LOCATION WHEN IN USE SERVICE STATUS EXCEPTION",
              ),
            );

            final PermissionService service =
                container.refresh(permissionServiceProvider);

            await expectLater(
              service.requestPermissions(PermissionType.locationWhenInUse),
              throwsA(
                isException.having(
                  (final Exception exception) => exception.toString(),
                  "message",
                  equals(
                    "Exception: MOCKED GET LOCATION WHEN IN USE SERVICE STATUS EXCEPTION", // ignore: lines_longer_than_80_chars
                  ),
                ),
              ),
            );

            verify(
              mockPermissionClient.getLocationWhenInUseServiceStatus(),
            ).called(1);

            verifyNever(
              mockPermissionClient.requestLocationWhenInUsePermission(),
            );
          });

          test("request permission has error", () async {
            when(
              mockPermissionClient.requestLocationWhenInUsePermission(),
            ).thenThrow(
              Exception(
                "MOCKED REQUEST LOCATION WHEN IN USE PERMISSION EXCEPTION",
              ),
            );

            final PermissionService service =
                container.refresh(permissionServiceProvider);

            await expectLater(
              service.requestPermissions(PermissionType.locationWhenInUse),
              throwsA(
                isException.having(
                  (final Exception exception) => exception.toString(),
                  "message",
                  equals(
                    "Exception: MOCKED REQUEST LOCATION WHEN IN USE PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                  ),
                ),
              ),
            );

            verify(
              mockPermissionClient.getLocationWhenInUseServiceStatus(),
            ).called(1);

            verify(
              mockPermissionClient.requestLocationWhenInUsePermission(),
            ).called(1);
          });
        });
      });

      group("manageExternalStorage", () {
        setUp(() {
          when(
            mockPermissionClient.requestManageExternalStoragePermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  manageExternalStorage: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.manageExternalStorage),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestManageExternalStoragePermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service
                .requestPermissions(PermissionType.manageExternalStorage);

            expect(service.debugState.manageExternalStorage, isNotNull);
            expect(
              service.debugState.manageExternalStorage,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestManageExternalStoragePermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestManageExternalStoragePermission(),
          ).thenThrow(
            Exception(
              "MOCKED REQUEST MANAGE EXTERNAL STORAGE PERMISSION EXCEPTION",
            ),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.manageExternalStorage),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST MANAGE EXTERNAL STORAGE PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestManageExternalStoragePermission(),
          ).called(1);
        });
      });

      group("mediaLibrary", () {
        setUp(() {
          when(
            mockPermissionClient.requestMediaLibraryPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  ignoreBatteryOptimizations: PermissionStatus.granted(),
                );

          await expectLater(
            service
                .requestPermissions(PermissionType.ignoreBatteryOptimizations),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestMediaLibraryPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.mediaLibrary);

            expect(service.debugState.mediaLibrary, isNotNull);
            expect(
              service.debugState.mediaLibrary,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestMediaLibraryPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestMediaLibraryPermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST MEDIA LIBRARY PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.mediaLibrary),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST MEDIA LIBRARY PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestMediaLibraryPermission(),
          ).called(1);
        });
      });

      group("microphone", () {
        setUp(() {
          when(
            mockPermissionClient.requestMicrophonePermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  microphone: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.microphone),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestMicrophonePermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.microphone);

            expect(service.debugState.microphone, isNotNull);
            expect(
              service.debugState.microphone,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestMicrophonePermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestMicrophonePermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST MICROPHONE PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.microphone),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST MICROPHONE PERMISSION EXCEPTION",
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestMicrophonePermission(),
          ).called(1);
        });
      });

      group("notification", () {
        setUp(() {
          when(
            mockPermissionClient.requestNotificationPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  notification: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.notification),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestNotificationPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.notification);

            expect(service.debugState.notification, isNotNull);
            expect(
              service.debugState.notification,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestNotificationPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestNotificationPermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST NOTIFICATION PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.notification),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST NOTIFICATION PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestNotificationPermission(),
          ).called(1);
        });
      });

      group("phone", () {
        setUp(() {
          when(
            mockPermissionClient.getPhoneServiceStatus(),
          ).thenAnswer(
            (final _) async => handler.ServiceStatus.enabled,
          );
          when(
            mockPermissionClient.requestPhonePermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  phone: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.phone),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.getPhoneServiceStatus(),
          );

          verifyNever(
            mockPermissionClient.requestPhonePermission(),
          );
        });

        test("service is not enabled", () async {
          when(
            mockPermissionClient.getPhoneServiceStatus(),
          ).thenAnswer(
            (final _) async => handler.ServiceStatus.disabled,
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.phone),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Service not supported."),
              ),
            ),
          );

          verify(
            mockPermissionClient.getPhoneServiceStatus(),
          ).called(1);

          verifyNever(
            mockPermissionClient.requestPhonePermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.phone);

            expect(service.debugState.phone, isNotNull);
            expect(service.debugState.phone, isA<GrantedPermissionStatus>());

            verify(
              mockPermissionClient.getPhoneServiceStatus(),
            ).called(1);

            verify(
              mockPermissionClient.requestPhonePermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        group("failed", () {
          test("get service status has error ", () async {
            when(
              mockPermissionClient.getPhoneServiceStatus(),
            ).thenThrow(
              Exception("MOCKED GET PHONE SERVICE STATUS EXCEPTION"),
            );

            final PermissionService service =
                container.refresh(permissionServiceProvider);

            await expectLater(
              service.requestPermissions(PermissionType.phone),
              throwsA(
                isException.having(
                  (final Exception exception) => exception.toString(),
                  "message",
                  equals(
                    "Exception: MOCKED GET PHONE SERVICE STATUS EXCEPTION", // ignore: lines_longer_than_80_chars
                  ),
                ),
              ),
            );

            verify(
              mockPermissionClient.getPhoneServiceStatus(),
            ).called(1);

            verifyNever(
              mockPermissionClient.requestPhonePermission(),
            );
          });

          test("request permission has error", () async {
            when(
              mockPermissionClient.requestPhonePermission(),
            ).thenThrow(
              Exception("MOCKED REQUEST PHONE PERMISSION EXCEPTION"),
            );

            final PermissionService service =
                container.refresh(permissionServiceProvider);

            await expectLater(
              service.requestPermissions(PermissionType.phone),
              throwsA(
                isException.having(
                  (final Exception exception) => exception.toString(),
                  "message",
                  equals(
                    "Exception: MOCKED REQUEST PHONE PERMISSION EXCEPTION",
                  ),
                ),
              ),
            );

            verify(
              mockPermissionClient.getPhoneServiceStatus(),
            ).called(1);

            verify(
              mockPermissionClient.requestPhonePermission(),
            ).called(1);
          });
        });
      });

      group("photosAddOnly", () {
        setUp(() {
          when(
            mockPermissionClient.requestPhotosAddOnlyPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  photosAddOnly: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.photosAddOnly),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestPhotosAddOnlyPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.photosAddOnly);

            expect(service.debugState.photosAddOnly, isNotNull);
            expect(
              service.debugState.photosAddOnly,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestPhotosAddOnlyPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestPhotosAddOnlyPermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST PHOTOS ADD ONLY PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.photosAddOnly),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST PHOTOS ADD ONLY PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestPhotosAddOnlyPermission(),
          ).called(1);
        });
      });

      group("photos", () {
        setUp(() {
          when(
            mockPermissionClient.requestPhotosPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  photos: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.photos),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestPhotosPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.photos);

            expect(service.debugState.photos, isNotNull);
            expect(service.debugState.photos, isA<GrantedPermissionStatus>());

            verify(
              mockPermissionClient.requestPhotosPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestPhotosPermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST PHOTOS PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.photos),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST PHOTOS PERMISSION EXCEPTION",
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestPhotosPermission(),
          ).called(1);
        });
      });

      group("reminders", () {
        setUp(() {
          when(
            mockPermissionClient.requestRemindersPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  reminders: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.reminders),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestRemindersPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.reminders);

            expect(service.debugState.reminders, isNotNull);
            expect(
              service.debugState.reminders,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestRemindersPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestRemindersPermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST REMINDERS PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.reminders),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST REMINDERS PERMISSION EXCEPTION",
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestRemindersPermission(),
          ).called(1);
        });
      });

      group("requestInstallPackages", () {
        setUp(() {
          when(
            mockPermissionClient.requestInstallPackagesPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  requestInstallPackages: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.requestInstallPackages),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestInstallPackagesPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service
                .requestPermissions(PermissionType.requestInstallPackages);

            expect(service.debugState.requestInstallPackages, isNotNull);
            expect(
              service.debugState.requestInstallPackages,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestInstallPackagesPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestInstallPackagesPermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST INSTALL PACKAGES PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.requestInstallPackages),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST INSTALL PACKAGES PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestInstallPackagesPermission(),
          ).called(1);
        });
      });

      group("sms", () {
        setUp(() {
          when(
            mockPermissionClient.requestSmsPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  sms: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.sms),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestSmsPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.sms);

            expect(service.debugState.sms, isNotNull);
            expect(service.debugState.sms, isA<GrantedPermissionStatus>());

            verify(
              mockPermissionClient.requestSmsPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestSmsPermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST SMS PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.sms),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST SMS PERMISSION EXCEPTION",
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestSmsPermission(),
          ).called(1);
        });
      });

      group("speech", () {
        setUp(() {
          when(
            mockPermissionClient.requestSpeechPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  speech: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.speech),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestSpeechPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.speech);

            expect(service.debugState.speech, isNotNull);
            expect(service.debugState.speech, isA<GrantedPermissionStatus>());

            verify(
              mockPermissionClient.requestSpeechPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestSpeechPermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST SPEECH PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.speech),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST SPEECH PERMISSION EXCEPTION",
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestSpeechPermission(),
          ).called(1);
        });
      });

      group("storage", () {
        setUp(() {
          when(
            mockPermissionClient.requestStoragePermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  storage: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.storage),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestStoragePermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.storage);

            expect(service.debugState.storage, isNotNull);
            expect(service.debugState.storage, isA<GrantedPermissionStatus>());

            verify(
              mockPermissionClient.requestStoragePermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestStoragePermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST STORAGE PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.storage),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST STORAGE PERMISSION EXCEPTION",
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestStoragePermission(),
          ).called(1);
        });
      });

      group("systemAlertWindow", () {
        setUp(() {
          when(
            mockPermissionClient.requestSystemAlertWindowPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  systemAlertWindow: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.systemAlertWindow),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestSystemAlertWindowPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.systemAlertWindow);

            expect(service.debugState.systemAlertWindow, isNotNull);
            expect(
              service.debugState.systemAlertWindow,
              isA<GrantedPermissionStatus>(),
            );

            verify(
              mockPermissionClient.requestSystemAlertWindowPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestSystemAlertWindowPermission(),
          ).thenThrow(
            Exception(
              "MOCKED REQUEST SYSTEM ALERT WINDOW PERMISSION EXCEPTION",
            ),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.systemAlertWindow),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                // ignore: lines_longer_than_80_chars
                equals(
                  "Exception: MOCKED REQUEST SYSTEM ALERT WINDOW PERMISSION EXCEPTION", // ignore: lines_longer_than_80_chars
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestSystemAlertWindowPermission(),
          ).called(1);
        });
      });

      group("unknown", () {
        setUp(() {
          when(
            mockPermissionClient.requestUnkwownPermission(),
          ).thenAnswer(
            (final _) async => handler.PermissionStatus.granted,
          );
        });

        test("already enabled", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider)
                // ignore: invalid_use_of_protected_member
                ..state = const Permission(
                  unknown: PermissionStatus.granted(),
                );

          await expectLater(
            service.requestPermissions(PermissionType.unknown),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals("PermissionServiceException: Already granted."),
              ),
            ),
          );

          verifyNever(
            mockPermissionClient.requestUnkwownPermission(),
          );
        });

        test("succeeded", () async {
          final PermissionService service =
              container.refresh(permissionServiceProvider);

          try {
            await service.requestPermissions(PermissionType.unknown);

            expect(service.debugState.unknown, isNotNull);
            expect(service.debugState.unknown, isA<GrantedPermissionStatus>());

            verify(
              mockPermissionClient.requestUnkwownPermission(),
            ).called(1);
          } on Exception catch (exception) {
            fail(exception.toString());
          }
        });

        test("failed", () async {
          when(
            mockPermissionClient.requestUnkwownPermission(),
          ).thenThrow(
            Exception("MOCKED REQUEST UNKNOWN PERMISSION EXCEPTION"),
          );

          final PermissionService service =
              container.refresh(permissionServiceProvider);

          await expectLater(
            service.requestPermissions(PermissionType.unknown),
            throwsA(
              isException.having(
                (final Exception exception) => exception.toString(),
                "message",
                equals(
                  "Exception: MOCKED REQUEST UNKNOWN PERMISSION EXCEPTION",
                ),
              ),
            ),
          );

          verify(
            mockPermissionClient.requestUnkwownPermission(),
          ).called(1);
        });
      });
    });

    group("openAppSettings", () {
      setUp(() {
        when(
          mockPermissionClient.openAppSettings(),
        ).thenAnswer(
          (final _) async => true,
        );
      });

      test("succeeded", () async {
        final PermissionService service =
            container.refresh(permissionServiceProvider);

        try {
          await service.openAppSettings();

          verify(
            mockPermissionClient.openAppSettings(),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockPermissionClient.openAppSettings(),
        ).thenAnswer(
          (final _) async => false,
        );

        final PermissionService service =
            container.refresh(permissionServiceProvider);

        await expectLater(
          service.openAppSettings(),
          throwsA(
            isException.having(
              (final Exception exception) => exception.toString(),
              "message",
              equals("PermissionServiceException: Cannot open app settings."),
            ),
          ),
        );
      });

      test("throws exception", () async {
        when(
          mockPermissionClient.openAppSettings(),
        ).thenThrow(
          Exception("MOCKED OPEN APP SETTINGS"),
        );

        final PermissionService service =
            container.refresh(permissionServiceProvider);

        await expectLater(
          service.openAppSettings(),
          throwsA(
            isException.having(
              (final Exception exception) => exception.toString(),
              "message",
              equals("Exception: MOCKED OPEN APP SETTINGS"),
            ),
          ),
        );
      });
    });
  });
}
