import 'package:permission_handler/permission_handler.dart' as handler;
import 'package:riverpod/riverpod.dart';

/// Permission Client
abstract class PermissionClient {
  /// The current status of this permission.
  Future<handler.PermissionStatus> getCalendarStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getCameraStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getContactsStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getLocationStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getLocationAlwaysStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getLocationWhenInUseStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getMediaLibraryStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getMicrophoneStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getPhoneStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getPhotosStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getPhotosAddOnlyStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getRemindersStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getSensorsStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getSmsStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getSpeechStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getStorageStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getIgnoreBatteryOptimizationsStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getNotificationStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getAccessMediaLocationStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getActivityRecognitionStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getUnknownStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getBluetoothStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getManageExternalStorageStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getSystemAlertWindowStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getRequestInstallPackagesStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getAppTrackingTransparencyStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getCriticalAlertsStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getAccessNotificationPolicyStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getBluetoothScanStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getBluetoothAdvertiseStatus();

  /// The current status of this permission.
  Future<handler.PermissionStatus> getBluetoothConnectStatus();

  /// Checks the current status of the service associated with this permission.
  Future<handler.ServiceStatus> getLocationServiceStatus();

  /// Checks the current status of the service associated with this permission.
  Future<handler.ServiceStatus> getLocationAlwaysServiceStatus();

  /// Checks the current status of the service associated with this permission.
  Future<handler.ServiceStatus> getLocationWhenInUseServiceStatus();

  /// Checks the current status of the service associated with this permission.
  Future<handler.ServiceStatus> getPhoneServiceStatus();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestCalendarPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestCameraPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestContactsPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestLocationPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestLocationAlwaysPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestLocationWhenInUsePermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestMediaLibraryPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestMicrophonePermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestPhonePermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestPhotosPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestPhotosAddOnlyPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestRemindersPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestSensorsPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestSmsPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestSpeechPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestStoragePermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus>
      requestIgnoreBatteryOptimizationsPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestNotificationPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestAccessMediaLocationPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestActivityRecognitionPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestUnkwownPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestBluetoothPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestManageExternalStoragePermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestSystemAlertWindowPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestInstallPackagesPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestAppTrackingTransparencyPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestCriticalAlertsPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestAccessNotificationPolicyPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestBluetoothScanPermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestBluetoothAdvertisePermission();

  /// Request the user for access to this [handler.Permission], if access hasn't
  /// already been grant access before.
  Future<handler.PermissionStatus> requestBluetoothConnectPermission();

  /// Opens the app settings page.
  Future<bool> openAppSettings();
}

// ignore: public_member_api_docs
class PermissionClientImpl implements PermissionClient {
  // ignore: public_member_api_docs
  const PermissionClientImpl();

  @override
  Future<handler.PermissionStatus> getAccessMediaLocationStatus() =>
      handler.Permission.accessMediaLocation.status;

  @override
  Future<handler.PermissionStatus> getAccessNotificationPolicyStatus() =>
      handler.Permission.accessNotificationPolicy.status;

  @override
  Future<handler.PermissionStatus> getActivityRecognitionStatus() =>
      handler.Permission.activityRecognition.status;

  @override
  Future<handler.PermissionStatus> getAppTrackingTransparencyStatus() =>
      handler.Permission.appTrackingTransparency.status;

  @override
  Future<handler.PermissionStatus> getBluetoothAdvertiseStatus() =>
      handler.Permission.bluetoothAdvertise.status;

  @override
  Future<handler.PermissionStatus> getBluetoothConnectStatus() =>
      handler.Permission.bluetoothConnect.status;

  @override
  Future<handler.PermissionStatus> getBluetoothScanStatus() =>
      handler.Permission.bluetoothScan.status;

  @override
  Future<handler.PermissionStatus> getBluetoothStatus() =>
      handler.Permission.bluetooth.status;

  @override
  Future<handler.PermissionStatus> getCalendarStatus() =>
      handler.Permission.calendar.status;

  @override
  Future<handler.PermissionStatus> getCameraStatus() =>
      handler.Permission.camera.status;

  @override
  Future<handler.PermissionStatus> getContactsStatus() =>
      handler.Permission.contacts.status;

  @override
  Future<handler.PermissionStatus> getCriticalAlertsStatus() =>
      handler.Permission.criticalAlerts.status;

  @override
  Future<handler.PermissionStatus> getIgnoreBatteryOptimizationsStatus() =>
      handler.Permission.ignoreBatteryOptimizations.status;

  @override
  Future<handler.PermissionStatus> getLocationAlwaysStatus() =>
      handler.Permission.locationAlways.status;

  @override
  Future<handler.PermissionStatus> getLocationStatus() =>
      handler.Permission.location.status;

  @override
  Future<handler.PermissionStatus> getLocationWhenInUseStatus() =>
      handler.Permission.locationWhenInUse.status;

  @override
  Future<handler.PermissionStatus> getManageExternalStorageStatus() =>
      handler.Permission.manageExternalStorage.status;

  @override
  Future<handler.PermissionStatus> getMediaLibraryStatus() =>
      handler.Permission.mediaLibrary.status;

  @override
  Future<handler.PermissionStatus> getMicrophoneStatus() =>
      handler.Permission.microphone.status;

  @override
  Future<handler.PermissionStatus> getNotificationStatus() =>
      handler.Permission.notification.status;

  @override
  Future<handler.PermissionStatus> getPhoneStatus() =>
      handler.Permission.phone.status;

  @override
  Future<handler.PermissionStatus> getPhotosAddOnlyStatus() =>
      handler.Permission.photosAddOnly.status;

  @override
  Future<handler.PermissionStatus> getPhotosStatus() =>
      handler.Permission.photos.status;

  @override
  Future<handler.PermissionStatus> getRemindersStatus() =>
      handler.Permission.reminders.status;

  @override
  Future<handler.PermissionStatus> getRequestInstallPackagesStatus() =>
      handler.Permission.requestInstallPackages.status;

  @override
  Future<handler.PermissionStatus> getSensorsStatus() =>
      handler.Permission.sensors.status;

  @override
  Future<handler.PermissionStatus> getSmsStatus() =>
      handler.Permission.sms.status;

  @override
  Future<handler.PermissionStatus> getSpeechStatus() =>
      handler.Permission.speech.status;

  @override
  Future<handler.PermissionStatus> getStorageStatus() =>
      handler.Permission.storage.status;

  @override
  Future<handler.PermissionStatus> getSystemAlertWindowStatus() =>
      handler.Permission.systemAlertWindow.status;

  @override
  Future<handler.PermissionStatus> getUnknownStatus() =>
      handler.Permission.unknown.status;

  @override
  Future<handler.ServiceStatus> getLocationAlwaysServiceStatus() =>
      handler.Permission.locationAlways.serviceStatus;

  @override
  Future<handler.ServiceStatus> getLocationServiceStatus() =>
      handler.Permission.location.serviceStatus;

  @override
  Future<handler.ServiceStatus> getLocationWhenInUseServiceStatus() =>
      handler.Permission.locationWhenInUse.serviceStatus;

  @override
  Future<handler.ServiceStatus> getPhoneServiceStatus() =>
      handler.Permission.phone.serviceStatus;

  @override
  Future<handler.PermissionStatus> requestAccessMediaLocationPermission() =>
      handler.Permission.accessMediaLocation.request();

  @override
  Future<handler.PermissionStatus>
      requestAccessNotificationPolicyPermission() =>
          handler.Permission.accessNotificationPolicy.request();

  @override
  Future<handler.PermissionStatus> requestActivityRecognitionPermission() =>
      handler.Permission.activityRecognition.request();

  @override
  Future<handler.PermissionStatus> requestAppTrackingTransparencyPermission() =>
      handler.Permission.appTrackingTransparency.request();

  @override
  Future<handler.PermissionStatus> requestBluetoothAdvertisePermission() =>
      handler.Permission.bluetoothAdvertise.request();

  @override
  Future<handler.PermissionStatus> requestBluetoothConnectPermission() =>
      handler.Permission.bluetoothConnect.request();

  @override
  Future<handler.PermissionStatus> requestBluetoothScanPermission() =>
      handler.Permission.bluetoothScan.request();

  @override
  Future<handler.PermissionStatus> requestBluetoothPermission() =>
      handler.Permission.bluetooth.request();

  @override
  Future<handler.PermissionStatus> requestCalendarPermission() =>
      handler.Permission.calendar.request();

  @override
  Future<handler.PermissionStatus> requestCameraPermission() =>
      handler.Permission.camera.request();

  @override
  Future<handler.PermissionStatus> requestContactsPermission() =>
      handler.Permission.contacts.request();

  @override
  Future<handler.PermissionStatus> requestCriticalAlertsPermission() =>
      handler.Permission.criticalAlerts.request();

  @override
  Future<handler.PermissionStatus>
      requestIgnoreBatteryOptimizationsPermission() =>
          handler.Permission.ignoreBatteryOptimizations.request();

  @override
  Future<handler.PermissionStatus> requestLocationAlwaysPermission() =>
      handler.Permission.locationAlways.request();

  @override
  Future<handler.PermissionStatus> requestLocationPermission() =>
      handler.Permission.location.request();

  @override
  Future<handler.PermissionStatus> requestLocationWhenInUsePermission() =>
      handler.Permission.locationWhenInUse.request();

  @override
  Future<handler.PermissionStatus> requestManageExternalStoragePermission() =>
      handler.Permission.manageExternalStorage.request();

  @override
  Future<handler.PermissionStatus> requestMediaLibraryPermission() =>
      handler.Permission.mediaLibrary.request();

  @override
  Future<handler.PermissionStatus> requestMicrophonePermission() =>
      handler.Permission.microphone.request();

  @override
  Future<handler.PermissionStatus> requestNotificationPermission() =>
      handler.Permission.notification.request();

  @override
  Future<handler.PermissionStatus> requestPhonePermission() =>
      handler.Permission.phone.request();

  @override
  Future<handler.PermissionStatus> requestPhotosAddOnlyPermission() =>
      handler.Permission.photosAddOnly.request();

  @override
  Future<handler.PermissionStatus> requestPhotosPermission() =>
      handler.Permission.photos.request();

  @override
  Future<handler.PermissionStatus> requestRemindersPermission() =>
      handler.Permission.reminders.request();

  @override
  Future<handler.PermissionStatus> requestInstallPackagesPermission() =>
      handler.Permission.requestInstallPackages.request();

  @override
  Future<handler.PermissionStatus> requestSensorsPermission() =>
      handler.Permission.sensors.status;

  @override
  Future<handler.PermissionStatus> requestSmsPermission() =>
      handler.Permission.sms.request();

  @override
  Future<handler.PermissionStatus> requestSpeechPermission() =>
      handler.Permission.speech.request();

  @override
  Future<handler.PermissionStatus> requestStoragePermission() =>
      handler.Permission.storage.request();

  @override
  Future<handler.PermissionStatus> requestSystemAlertWindowPermission() =>
      handler.Permission.systemAlertWindow.request();

  @override
  Future<handler.PermissionStatus> requestUnkwownPermission() =>
      handler.Permission.unknown.request();

  @override
  Future<bool> openAppSettings() => handler.openAppSettings();
}

/// PermissionClient Provider
final Provider<PermissionClient> permissionClientProvider =
    Provider<PermissionClient>((final _) => const PermissionClientImpl());
