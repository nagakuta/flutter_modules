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

  /// サービスの初期化
  Future<void> initializeService() async {
    await Future.wait<void>(
      PermissionType.values.map(
        (final PermissionType type) async {
          try {
            final PermissionStatus _ = await _getPermissionStatus(type);
          } on Exception catch (exception) {
            _crashlyticsService.recordException(exception, StackTrace.current);
          }
        },
      ),
    );

    _analyticsService.logEvent(
      name: "initialize_permission_service",
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
    late ServiceStatus serviceStatus;
    switch (type) {
      case ServiceType.location:
        final handler.ServiceStatus status =
            await _permissionClient.getLocationServiceStatus();
        serviceStatus = ServiceStatus.fromStatus(status);
        break;
      case ServiceType.locationAlways:
        final handler.ServiceStatus status =
            await _permissionClient.getLocationAlwaysServiceStatus();
        serviceStatus = ServiceStatus.fromStatus(status);
        break;
      case ServiceType.locationWhenInUse:
        final handler.ServiceStatus status =
            await _permissionClient.getLocationWhenInUseServiceStatus();
        serviceStatus = ServiceStatus.fromStatus(status);
        break;
      case ServiceType.phone:
        final handler.ServiceStatus status =
            await _permissionClient.getPhoneServiceStatus();
        serviceStatus = ServiceStatus.fromStatus(status);
        break;
    }

    _analyticsService.logEvent(
      name: "get_service_status",
      parameters: <String, dynamic>{
        type.toString(): serviceStatus.toString(),
      },
    );

    return serviceStatus;
  }

  /// 利用権限をリクエスト
  Future<PermissionStatus> requestPermissions(
    final PermissionType type,
  ) async {
    final PermissionStatus status = await _getPermissionStatus(type);
    if (status is GrantedPermissionStatus) {
      return status;
    }

    late PermissionStatus permissionStatus;
    switch (type) {
      case PermissionType.calendar:
        final handler.PermissionStatus status =
            await _permissionClient.requestCalendarPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(calendar: permissionStatus);
        break;
      case PermissionType.camera:
        final handler.PermissionStatus status =
            await _permissionClient.requestCameraPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(camera: permissionStatus);
        break;
      case PermissionType.contacts:
        final handler.PermissionStatus status =
            await _permissionClient.requestContactsPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(contacts: permissionStatus);
        break;
      case PermissionType.location:
        final handler.PermissionStatus status =
            await _permissionClient.requestLocationPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(location: permissionStatus);
        break;
      case PermissionType.locationAlways:
        final handler.PermissionStatus status =
            await _permissionClient.requestLocationAlwaysPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(locationAlways: permissionStatus);
        break;
      case PermissionType.locationWhenInUse:
        final handler.PermissionStatus status =
            await _permissionClient.requestLocationWhenInUsePermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(locationWhenInUse: permissionStatus);
        break;
      case PermissionType.mediaLibrary:
        final handler.PermissionStatus status =
            await _permissionClient.requestMediaLibraryPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(mediaLibrary: permissionStatus);
        break;
      case PermissionType.microphone:
        final handler.PermissionStatus status =
            await _permissionClient.requestMicrophonePermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(microphone: permissionStatus);
        break;
      case PermissionType.phone:
        final handler.PermissionStatus status =
            await _permissionClient.requestPhonePermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(phone: permissionStatus);
        break;
      case PermissionType.photos:
        final handler.PermissionStatus status =
            await _permissionClient.requestPhotosPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(photos: permissionStatus);
        break;
      case PermissionType.photosAddOnly:
        final handler.PermissionStatus status =
            await _permissionClient.requestPhotosAddOnlyPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(photosAddOnly: permissionStatus);
        break;
      case PermissionType.reminders:
        final handler.PermissionStatus status =
            await _permissionClient.requestRemindersPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(reminders: permissionStatus);
        break;
      case PermissionType.sensors:
        final handler.PermissionStatus status =
            await _permissionClient.requestSensorsPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(sensors: permissionStatus);
        break;
      case PermissionType.sms:
        final handler.PermissionStatus status =
            await _permissionClient.requestSmsPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(sms: permissionStatus);
        break;
      case PermissionType.speech:
        final handler.PermissionStatus status =
            await _permissionClient.requestSpeechPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(speech: permissionStatus);
        break;
      case PermissionType.storage:
        final handler.PermissionStatus status =
            await _permissionClient.requestStoragePermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(storage: permissionStatus);
        break;
      case PermissionType.ignoreBatteryOptimizations:
        final handler.PermissionStatus status = await _permissionClient
            .requestIgnoreBatteryOptimizationsPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(ignoreBatteryOptimizations: permissionStatus);
        break;
      case PermissionType.notification:
        final handler.PermissionStatus status =
            await _permissionClient.requestNotificationPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(notification: permissionStatus);
        break;
      case PermissionType.accessMediaLocation:
        final handler.PermissionStatus status =
            await _permissionClient.requestAccessMediaLocationPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(accessMediaLocation: permissionStatus);
        break;
      case PermissionType.activityRecognition:
        final handler.PermissionStatus status =
            await _permissionClient.requestActivityRecognitionPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(activityRecognition: permissionStatus);
        break;
      case PermissionType.unknown:
        final handler.PermissionStatus status =
            await _permissionClient.requestUnkwownPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(unknown: permissionStatus);
        break;
      case PermissionType.bluetooth:
        final handler.PermissionStatus status =
            await _permissionClient.requestBluetoothPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(bluetooth: permissionStatus);
        break;
      case PermissionType.manageExternalStorage:
        final handler.PermissionStatus status =
            await _permissionClient.requestManageExternalStoragePermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(manageExternalStorage: permissionStatus);
        break;
      case PermissionType.systemAlertWindow:
        final handler.PermissionStatus status =
            await _permissionClient.requestSystemAlertWindowPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(systemAlertWindow: permissionStatus);
        break;
      case PermissionType.requestInstallPackages:
        final handler.PermissionStatus status =
            await _permissionClient.requestInstallPackagesPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(requestInstallPackages: permissionStatus);
        break;
      case PermissionType.appTrackingTransparency:
        final handler.PermissionStatus status =
            await _permissionClient.requestAppTrackingTransparencyPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(appTrackingTransparency: permissionStatus);
        break;
      case PermissionType.criticalAlerts:
        final handler.PermissionStatus status =
            await _permissionClient.requestCriticalAlertsPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(criticalAlerts: permissionStatus);
        break;
      case PermissionType.accessNotificationPolicy:
        final handler.PermissionStatus status =
            await _permissionClient.requestAccessNotificationPolicyPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(accessNotificationPolicy: permissionStatus);
        break;
      case PermissionType.bluetoothScan:
        final handler.PermissionStatus status =
            await _permissionClient.requestBluetoothScanPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(bluetoothScan: permissionStatus);
        break;
      case PermissionType.bluetoothAdvertise:
        final handler.PermissionStatus status =
            await _permissionClient.requestBluetoothAdvertisePermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(bluetoothAdvertise: permissionStatus);
        break;
      case PermissionType.bluetoothConnect:
        final handler.PermissionStatus status =
            await _permissionClient.requestBluetoothConnectPermission();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(bluetoothConnect: permissionStatus);
        break;
    }

    _analyticsService.logEvent(
      name: "request_permissions",
      parameters: <String, dynamic>{
        type.toString(): permissionStatus.toString(),
      },
    );

    return permissionStatus;
  }

  /// OS 内のアプリの設定を開く
  Future<void> openAppSettings() async {
    final bool hasOpened = await _permissionClient.openAppSettings();

    if (!hasOpened) {
      throw const PermissionServiceException.cannotOpenAppSettings();
    }
  }

  Future<PermissionStatus> _getPermissionStatus(
    final PermissionType type,
  ) async {
    late PermissionStatus permissionStatus;
    switch (type) {
      case PermissionType.calendar:
        final handler.PermissionStatus status =
            await _permissionClient.getCalendarStatus();
        permissionStatus = PermissionStatus.fromStatus(status);

        state = state.copyWith(calendar: permissionStatus);
        break;
      case PermissionType.camera:
        final handler.PermissionStatus status =
            await _permissionClient.getCameraStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(camera: permissionStatus);
        break;
      case PermissionType.contacts:
        final handler.PermissionStatus status =
            await _permissionClient.getContactsStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(contacts: permissionStatus);
        break;
      case PermissionType.location:
        final handler.PermissionStatus status =
            await _permissionClient.getLocationStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(location: permissionStatus);
        break;
      case PermissionType.locationAlways:
        final handler.PermissionStatus status =
            await _permissionClient.getLocationAlwaysStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(locationAlways: permissionStatus);
        break;
      case PermissionType.locationWhenInUse:
        final handler.PermissionStatus status =
            await _permissionClient.getLocationWhenInUseStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(locationWhenInUse: permissionStatus);
        break;
      case PermissionType.mediaLibrary:
        final handler.PermissionStatus status =
            await _permissionClient.getMediaLibraryStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(mediaLibrary: permissionStatus);
        break;
      case PermissionType.microphone:
        final handler.PermissionStatus status =
            await _permissionClient.getMicrophoneStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(microphone: permissionStatus);
        break;
      case PermissionType.phone:
        final handler.PermissionStatus status =
            await _permissionClient.getPhoneStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(phone: permissionStatus);
        break;
      case PermissionType.photos:
        final handler.PermissionStatus status =
            await _permissionClient.getPhotosStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(photos: permissionStatus);
        break;
      case PermissionType.photosAddOnly:
        final handler.PermissionStatus status =
            await _permissionClient.getPhotosAddOnlyStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(photosAddOnly: permissionStatus);
        break;
      case PermissionType.reminders:
        final handler.PermissionStatus status =
            await _permissionClient.getRemindersStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(reminders: permissionStatus);
        break;
      case PermissionType.sensors:
        final handler.PermissionStatus status =
            await _permissionClient.getSensorsStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(sensors: permissionStatus);
        break;
      case PermissionType.sms:
        final handler.PermissionStatus status =
            await _permissionClient.getSmsStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(sms: permissionStatus);
        break;
      case PermissionType.speech:
        final handler.PermissionStatus status =
            await _permissionClient.getSpeechStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(speech: permissionStatus);
        break;
      case PermissionType.storage:
        final handler.PermissionStatus status =
            await _permissionClient.getStorageStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(storage: permissionStatus);
        break;
      case PermissionType.ignoreBatteryOptimizations:
        final handler.PermissionStatus status =
            await _permissionClient.getIgnoreBatteryOptimizationsStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(ignoreBatteryOptimizations: permissionStatus);
        break;
      case PermissionType.notification:
        final handler.PermissionStatus status =
            await _permissionClient.getNotificationStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(notification: permissionStatus);
        break;
      case PermissionType.accessMediaLocation:
        final handler.PermissionStatus status =
            await _permissionClient.getAccessMediaLocationStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(accessMediaLocation: permissionStatus);
        break;
      case PermissionType.activityRecognition:
        final handler.PermissionStatus status =
            await _permissionClient.getActivityRecognitionStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(activityRecognition: permissionStatus);
        break;
      case PermissionType.unknown:
        final handler.PermissionStatus status =
            await _permissionClient.getUnknownStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(unknown: permissionStatus);
        break;
      case PermissionType.bluetooth:
        final handler.PermissionStatus status =
            await _permissionClient.getBluetoothStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(bluetooth: permissionStatus);
        break;
      case PermissionType.manageExternalStorage:
        final handler.PermissionStatus status =
            await _permissionClient.getManageExternalStorageStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(manageExternalStorage: permissionStatus);
        break;
      case PermissionType.systemAlertWindow:
        final handler.PermissionStatus status =
            await _permissionClient.getSystemAlertWindowStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(systemAlertWindow: permissionStatus);
        break;
      case PermissionType.requestInstallPackages:
        final handler.PermissionStatus status =
            await _permissionClient.getRequestInstallPackagesStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(requestInstallPackages: permissionStatus);
        break;
      case PermissionType.appTrackingTransparency:
        final handler.PermissionStatus status =
            await _permissionClient.getAppTrackingTransparencyStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(appTrackingTransparency: permissionStatus);
        break;
      case PermissionType.criticalAlerts:
        final handler.PermissionStatus status =
            await _permissionClient.getCriticalAlertsStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(criticalAlerts: permissionStatus);
        break;
      case PermissionType.accessNotificationPolicy:
        final handler.PermissionStatus status =
            await _permissionClient.getAccessNotificationPolicyStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(accessNotificationPolicy: permissionStatus);
        break;
      case PermissionType.bluetoothScan:
        final handler.PermissionStatus status =
            await _permissionClient.getBluetoothScanStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(bluetoothScan: permissionStatus);
        break;
      case PermissionType.bluetoothAdvertise:
        final handler.PermissionStatus status =
            await _permissionClient.getBluetoothAdvertiseStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(bluetoothAdvertise: permissionStatus);
        break;
      case PermissionType.bluetoothConnect:
        final handler.PermissionStatus status =
            await _permissionClient.getBluetoothConnectStatus();
        permissionStatus = PermissionStatus.fromStatus(status);
        state = state.copyWith(bluetoothConnect: permissionStatus);
        break;
    }

    _analyticsService.logEvent(
      name: "get_permission_status",
      parameters: <String, dynamic>{
        type.name: permissionStatus.toString(),
      },
    );

    return permissionStatus;
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
    )..initializeService();
  },
);
