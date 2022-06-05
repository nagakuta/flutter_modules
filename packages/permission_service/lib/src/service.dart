import 'package:analytics_service/analytics_service.dart';
import 'package:crashlytics_service/crashlytics_service.dart';
import 'package:mockito/annotations.dart';
import 'package:permission_handler/permission_handler.dart' as handler;
import 'package:riverpod/riverpod.dart';

import '/src/client.dart';
import '/src/exception.dart';
import '/src/types.dart';

/// Permission Service
@GenerateMocks(<Type>[PermissionService])
class PermissionService extends StateNotifier<Permission> {
  // ignore: public_member_api_docs
  PermissionService({
    required final PermissionClient permissionClient,
    required final AnalyticsService analyticsService,
    required final CrashlyticsService crashlyticsService,
  })  : _permissionClient = permissionClient,
        _analyticsService = analyticsService,
        _crashlyticsService = crashlyticsService,
        super(const Permission());

  final PermissionClient _permissionClient;
  final AnalyticsService _analyticsService;
  final CrashlyticsService _crashlyticsService;

  /// 現在の許可状態を反映
  Future<void> setCurrentPermissionStatus() async {
    await Future.wait<void>(
      PermissionType.values.map(
        (final PermissionType type) async {
          try {
            await _fetchPermissionStatus(type);
          } on Exception catch (exception) {
            _crashlyticsService.recordException(exception, StackTrace.current);
          }
        },
      ),
    );

    _analyticsService.logEvent(
      name: "set_current_permission_status",
      parameters: <String, dynamic>{
        "permissions": <String, dynamic>{
          PermissionType.accessMediaLocation.toString():
              state.accessMediaLocation.toString(),
          PermissionType.accessNotificationPolicy.toString():
              state.accessNotificationPolicy.toString(),
          PermissionType.activityRecognition.toString():
              state.activityRecognition.toString(),
          PermissionType.appTrackingTransparency.toString():
              state.appTrackingTransparency.toString(),
          PermissionType.bluetooth.toString(): state.bluetooth.toString(),
          PermissionType.bluetoothAdvertise.toString():
              state.bluetoothAdvertise.toString(),
          PermissionType.bluetoothConnect.toString():
              state.bluetoothConnect.toString(),
          PermissionType.bluetoothScan.toString():
              state.bluetoothScan.toString(),
          PermissionType.calendar.toString(): state.calendar.toString(),
          PermissionType.camera.toString(): state.camera.toString(),
          PermissionType.contacts.toString(): state.contacts.toString(),
          PermissionType.criticalAlerts.toString():
              state.criticalAlerts.toString(),
          PermissionType.ignoreBatteryOptimizations.toString():
              state.ignoreBatteryOptimizations.toString(),
          PermissionType.location.toString(): state.location.toString(),
          PermissionType.locationAlways.toString():
              state.locationAlways.toString(),
          PermissionType.locationWhenInUse.toString():
              state.locationWhenInUse.toString(),
          PermissionType.manageExternalStorage.toString():
              state.manageExternalStorage.toString(),
          PermissionType.mediaLibrary.toString(): state.mediaLibrary.toString(),
          PermissionType.microphone.toString(): state.microphone.toString(),
          PermissionType.notification.toString(): state.notification.toString(),
          PermissionType.phone.toString(): state.phone.toString(),
          PermissionType.photos.toString(): state.photos.toString(),
          PermissionType.photosAddOnly.toString():
              state.photosAddOnly.toString(),
          PermissionType.reminders.toString(): state.reminders.toString(),
          PermissionType.requestInstallPackages.toString():
              state.requestInstallPackages.toString(),
          PermissionType.sensors.toString(): state.sensors.toString(),
          PermissionType.sms.toString(): state.sms.toString(),
          PermissionType.speech.toString(): state.sms.toString(),
          PermissionType.storage.toString(): state.storage.toString(),
          PermissionType.systemAlertWindow.toString():
              state.systemAlertWindow.toString(),
          PermissionType.unknown.toString(): state.unknown.toString(),
        },
      },
    );
  }

  /// 機能権限の取得
  Future<ServiceStatus> getServiceStatus(final ServiceType type) async {
    final ServiceStatus serviceStatus = await _fetchServiceStatus(type);

    _analyticsService.logEvent(
      name: "get_service_status",
      parameters: <String, dynamic>{
        type.toString(): serviceStatus.toString(),
      },
    );

    return serviceStatus;
  }

  /// 利用権限をリクエスト
  Future<void> requestPermissions(
    final PermissionType type,
  ) async {
    if (state.getPermissionStatus(type) is GrantedPermissionStatus) {
      throw const PermissionServiceException.alreadyGranted();
    }

    final PermissionStatus status = await _requestPermissionStatus(type);

    _analyticsService.logEvent(
      name: "request_permissions",
      parameters: <String, dynamic>{
        type.toString(): status.toString(),
      },
    );
  }

  /// OS 内のアプリの設定を開く
  Future<void> openAppSettings() async {
    final bool hasOpened = await _permissionClient.openAppSettings();

    if (!hasOpened) {
      throw const PermissionServiceException.cannotOpenAppSettings();
    }
  }

  Future<ServiceStatus> _fetchServiceStatus(final ServiceType type) async {
    switch (type) {
      case ServiceType.location:
        final handler.ServiceStatus status =
            await _permissionClient.getLocationServiceStatus();
        return ServiceStatus.fromStatus(status);

      case ServiceType.locationAlways:
        final handler.ServiceStatus status =
            await _permissionClient.getLocationAlwaysServiceStatus();
        return ServiceStatus.fromStatus(status);

      case ServiceType.locationWhenInUse:
        final handler.ServiceStatus status =
            await _permissionClient.getLocationWhenInUseServiceStatus();
        return ServiceStatus.fromStatus(status);

      case ServiceType.phone:
        final handler.ServiceStatus status =
            await _permissionClient.getPhoneServiceStatus();
        return ServiceStatus.fromStatus(status);
    }
  }

  Future<PermissionStatus> _fetchPermissionStatus(
    final PermissionType type,
  ) async {
    switch (type) {
      case PermissionType.calendar:
        final handler.PermissionStatus status =
            await _permissionClient.getCalendarStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(calendar: permission);

        return permission;

      case PermissionType.camera:
        final handler.PermissionStatus status =
            await _permissionClient.getCameraStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(camera: permission);

        return permission;

      case PermissionType.contacts:
        final handler.PermissionStatus status =
            await _permissionClient.getContactsStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(contacts: permission);

        return permission;

      case PermissionType.location:
        final ServiceStatus serviceStatus =
            await getServiceStatus(ServiceType.location);

        if (serviceStatus is NotApplicableServiceStatus) {
          throw const PermissionServiceException.serviceNotSupported();
        }

        final handler.PermissionStatus status =
            await _permissionClient.getLocationStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(location: permission);

        return permission;

      case PermissionType.locationAlways:
        final ServiceStatus serviceStatus =
            await getServiceStatus(ServiceType.locationAlways);

        if (serviceStatus is NotApplicableServiceStatus) {
          throw const PermissionServiceException.serviceNotSupported();
        }

        final handler.PermissionStatus status =
            await _permissionClient.getLocationAlwaysStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(locationAlways: permission);

        return permission;

      case PermissionType.locationWhenInUse:
        final ServiceStatus serviceStatus =
            await _fetchServiceStatus(ServiceType.locationWhenInUse);

        if (serviceStatus is NotApplicableServiceStatus) {
          throw const PermissionServiceException.serviceNotSupported();
        }

        final handler.PermissionStatus status =
            await _permissionClient.getLocationWhenInUseStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(locationWhenInUse: permission);

        return permission;

      case PermissionType.mediaLibrary:
        final handler.PermissionStatus status =
            await _permissionClient.getMediaLibraryStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(mediaLibrary: permission);

        return permission;

      case PermissionType.microphone:
        final handler.PermissionStatus status =
            await _permissionClient.getMicrophoneStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(microphone: permission);

        return permission;

      case PermissionType.phone:
        final ServiceStatus serviceStatus =
            await getServiceStatus(ServiceType.phone);

        if (serviceStatus is NotApplicableServiceStatus) {
          throw const PermissionServiceException.serviceNotSupported();
        }

        final handler.PermissionStatus status =
            await _permissionClient.getPhoneStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(phone: permission);

        return permission;

      case PermissionType.photos:
        final handler.PermissionStatus status =
            await _permissionClient.getPhotosStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(photos: permission);

        return permission;

      case PermissionType.photosAddOnly:
        final handler.PermissionStatus status =
            await _permissionClient.getPhotosAddOnlyStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(photosAddOnly: permission);

        return permission;

      case PermissionType.reminders:
        final handler.PermissionStatus status =
            await _permissionClient.getRemindersStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(reminders: permission);

        return permission;

      case PermissionType.sensors:
        final handler.PermissionStatus status =
            await _permissionClient.getSensorsStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(sensors: permission);

        return permission;

      case PermissionType.sms:
        final handler.PermissionStatus status =
            await _permissionClient.getSmsStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(sms: permission);

        return permission;

      case PermissionType.speech:
        final handler.PermissionStatus status =
            await _permissionClient.getSpeechStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(speech: permission);

        return permission;

      case PermissionType.storage:
        final handler.PermissionStatus status =
            await _permissionClient.getStorageStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(storage: permission);

        return permission;

      case PermissionType.ignoreBatteryOptimizations:
        final handler.PermissionStatus status =
            await _permissionClient.getIgnoreBatteryOptimizationsStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(ignoreBatteryOptimizations: permission);

        return permission;

      case PermissionType.notification:
        final handler.PermissionStatus status =
            await _permissionClient.getNotificationStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(notification: permission);

        return permission;

      case PermissionType.accessMediaLocation:
        final handler.PermissionStatus status =
            await _permissionClient.getAccessMediaLocationStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(accessMediaLocation: permission);

        return permission;

      case PermissionType.activityRecognition:
        final handler.PermissionStatus status =
            await _permissionClient.getActivityRecognitionStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(activityRecognition: permission);

        return permission;

      case PermissionType.unknown:
        final handler.PermissionStatus status =
            await _permissionClient.getUnknownStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(unknown: permission);

        return permission;

      case PermissionType.bluetooth:
        final handler.PermissionStatus status =
            await _permissionClient.getBluetoothStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(bluetooth: permission);

        return permission;

      case PermissionType.manageExternalStorage:
        final handler.PermissionStatus status =
            await _permissionClient.getManageExternalStorageStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(manageExternalStorage: permission);

        return permission;

      case PermissionType.systemAlertWindow:
        final handler.PermissionStatus status =
            await _permissionClient.getSystemAlertWindowStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(systemAlertWindow: permission);

        return permission;

      case PermissionType.requestInstallPackages:
        final handler.PermissionStatus status =
            await _permissionClient.getRequestInstallPackagesStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(requestInstallPackages: permission);

        return permission;

      case PermissionType.appTrackingTransparency:
        final handler.PermissionStatus status =
            await _permissionClient.getAppTrackingTransparencyStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(appTrackingTransparency: permission);

        return permission;

      case PermissionType.criticalAlerts:
        final handler.PermissionStatus status =
            await _permissionClient.getCriticalAlertsStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(criticalAlerts: permission);

        return permission;

      case PermissionType.accessNotificationPolicy:
        final handler.PermissionStatus status =
            await _permissionClient.getAccessNotificationPolicyStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(accessNotificationPolicy: permission);

        return permission;

      case PermissionType.bluetoothScan:
        final handler.PermissionStatus status =
            await _permissionClient.getBluetoothScanStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(bluetoothScan: permission);

        return permission;

      case PermissionType.bluetoothAdvertise:
        final handler.PermissionStatus status =
            await _permissionClient.getBluetoothAdvertiseStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(bluetoothAdvertise: permission);

        return permission;

      case PermissionType.bluetoothConnect:
        final handler.PermissionStatus status =
            await _permissionClient.getBluetoothConnectStatus();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(bluetoothConnect: permission);

        return permission;
    }
  }

  Future<PermissionStatus> _requestPermissionStatus(
    final PermissionType type,
  ) async {
    switch (type) {
      case PermissionType.calendar:
        final handler.PermissionStatus status =
            await _permissionClient.requestCalendarPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(calendar: permission);

        return permission;

      case PermissionType.camera:
        final handler.PermissionStatus status =
            await _permissionClient.requestCameraPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(camera: permission);

        return permission;

      case PermissionType.contacts:
        final handler.PermissionStatus status =
            await _permissionClient.requestContactsPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(contacts: permission);

        return permission;

      case PermissionType.location:
        final ServiceStatus serviceStatus =
            await getServiceStatus(ServiceType.location);

        if (serviceStatus is! EnabledServiceStatus) {
          throw const PermissionServiceException.serviceNotSupported();
        }

        final handler.PermissionStatus status =
            await _permissionClient.requestLocationPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(location: permission);

        return permission;

      case PermissionType.locationAlways:
        final ServiceStatus serviceStatus =
            await getServiceStatus(ServiceType.locationAlways);

        if (serviceStatus is! EnabledServiceStatus) {
          throw const PermissionServiceException.serviceNotSupported();
        }

        final handler.PermissionStatus status =
            await _permissionClient.requestLocationAlwaysPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(locationAlways: permission);

        return permission;

      case PermissionType.locationWhenInUse:
        final ServiceStatus serviceStatus =
            await getServiceStatus(ServiceType.locationWhenInUse);

        if (serviceStatus is! EnabledServiceStatus) {
          throw const PermissionServiceException.serviceNotSupported();
        }

        final handler.PermissionStatus status =
            await _permissionClient.requestLocationWhenInUsePermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(locationWhenInUse: permission);

        return permission;

      case PermissionType.mediaLibrary:
        final handler.PermissionStatus status =
            await _permissionClient.requestMediaLibraryPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(mediaLibrary: permission);

        return permission;

      case PermissionType.microphone:
        final handler.PermissionStatus status =
            await _permissionClient.requestMicrophonePermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(microphone: permission);

        return permission;

      case PermissionType.phone:
        final ServiceStatus serviceStatus =
            await getServiceStatus(ServiceType.phone);

        if (serviceStatus is! EnabledServiceStatus) {
          throw const PermissionServiceException.serviceNotSupported();
        }

        final handler.PermissionStatus status =
            await _permissionClient.requestPhonePermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(phone: permission);

        return permission;

      case PermissionType.photos:
        final handler.PermissionStatus status =
            await _permissionClient.requestPhotosPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(photos: permission);

        return permission;

      case PermissionType.photosAddOnly:
        final handler.PermissionStatus status =
            await _permissionClient.requestPhotosAddOnlyPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(photosAddOnly: permission);

        return permission;

      case PermissionType.reminders:
        final handler.PermissionStatus status =
            await _permissionClient.requestRemindersPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(reminders: permission);

        return permission;

      case PermissionType.sensors:
        final handler.PermissionStatus status =
            await _permissionClient.requestSensorsPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(sensors: permission);

        return permission;

      case PermissionType.sms:
        final handler.PermissionStatus status =
            await _permissionClient.requestSmsPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(sms: permission);

        return permission;

      case PermissionType.speech:
        final handler.PermissionStatus status =
            await _permissionClient.requestSpeechPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(speech: permission);

        return permission;

      case PermissionType.storage:
        final handler.PermissionStatus status =
            await _permissionClient.requestStoragePermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(storage: permission);

        return permission;

      case PermissionType.ignoreBatteryOptimizations:
        final handler.PermissionStatus status = await _permissionClient
            .requestIgnoreBatteryOptimizationsPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(ignoreBatteryOptimizations: permission);

        return permission;

      case PermissionType.notification:
        final handler.PermissionStatus status =
            await _permissionClient.requestNotificationPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(notification: permission);

        return permission;

      case PermissionType.accessMediaLocation:
        final handler.PermissionStatus status =
            await _permissionClient.requestAccessMediaLocationPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(accessMediaLocation: permission);

        return permission;

      case PermissionType.activityRecognition:
        final handler.PermissionStatus status =
            await _permissionClient.requestActivityRecognitionPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(activityRecognition: permission);

        return permission;

      case PermissionType.unknown:
        final handler.PermissionStatus status =
            await _permissionClient.requestUnkwownPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(unknown: permission);

        return permission;

      case PermissionType.bluetooth:
        final handler.PermissionStatus status =
            await _permissionClient.requestBluetoothPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(bluetooth: permission);

        return permission;

      case PermissionType.manageExternalStorage:
        final handler.PermissionStatus status =
            await _permissionClient.requestManageExternalStoragePermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(manageExternalStorage: permission);

        return permission;

      case PermissionType.systemAlertWindow:
        final handler.PermissionStatus status =
            await _permissionClient.requestSystemAlertWindowPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(systemAlertWindow: permission);

        return permission;

      case PermissionType.requestInstallPackages:
        final handler.PermissionStatus status =
            await _permissionClient.requestInstallPackagesPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(requestInstallPackages: permission);

        return permission;

      case PermissionType.appTrackingTransparency:
        final handler.PermissionStatus status =
            await _permissionClient.requestAppTrackingTransparencyPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(appTrackingTransparency: permission);

        return permission;

      case PermissionType.criticalAlerts:
        final handler.PermissionStatus status =
            await _permissionClient.requestCriticalAlertsPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(criticalAlerts: permission);

        return permission;

      case PermissionType.accessNotificationPolicy:
        final handler.PermissionStatus status =
            await _permissionClient.requestAccessNotificationPolicyPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(accessNotificationPolicy: permission);

        return permission;

      case PermissionType.bluetoothScan:
        final handler.PermissionStatus status =
            await _permissionClient.requestBluetoothScanPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(bluetoothScan: permission);

        return permission;

      case PermissionType.bluetoothAdvertise:
        final handler.PermissionStatus status =
            await _permissionClient.requestBluetoothAdvertisePermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(bluetoothAdvertise: permission);

        return permission;

      case PermissionType.bluetoothConnect:
        final handler.PermissionStatus status =
            await _permissionClient.requestBluetoothConnectPermission();

        final PermissionStatus permission = PermissionStatus.fromStatus(status);
        state = state.copyWith(bluetoothConnect: permission);

        return permission;
    }
  }
}

/// PermissionService Provider
final Provider<PermissionService> permissionServiceProvider =
    Provider<PermissionService>(
  (final ProviderRef<PermissionService> ref) {
    final PermissionClient permissionClient =
        ref.watch(permissionClientProvider);
    final AnalyticsService analyticsService =
        ref.watch(analyticsServiceProvider(null));
    final CrashlyticsService crashlyticsService =
        ref.watch(crashlyticsServiceProvider);

    return PermissionService(
      permissionClient: permissionClient,
      analyticsService: analyticsService,
      crashlyticsService: crashlyticsService,
    );
  },
);
