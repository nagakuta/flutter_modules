import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart' as handler;

part 'types.freezed.dart';

/// Permission Type
enum PermissionType {
  // ignore: public_member_api_docs
  calendar,
  // ignore: public_member_api_docs
  camera,
  // ignore: public_member_api_docs
  contacts,
  // ignore: public_member_api_docs
  location,
  // ignore: public_member_api_docs
  locationAlways,
  // ignore: public_member_api_docs
  locationWhenInUse,
  // ignore: public_member_api_docs
  mediaLibrary,
  // ignore: public_member_api_docs
  microphone,
  // ignore: public_member_api_docs
  phone,
  // ignore: public_member_api_docs
  photos,
  // ignore: public_member_api_docs
  photosAddOnly,
  // ignore: public_member_api_docs
  reminders,
  // ignore: public_member_api_docs
  sensors,
  // ignore: public_member_api_docs
  sms,
  // ignore: public_member_api_docs
  speech,
  // ignore: public_member_api_docs
  storage,
  // ignore: public_member_api_docs
  ignoreBatteryOptimizations,
  // ignore: public_member_api_docs
  notification,
  // ignore: public_member_api_docs
  accessMediaLocation,
  // ignore: public_member_api_docs
  activityRecognition,
  // ignore: public_member_api_docs
  unknown,
  // ignore: public_member_api_docs
  bluetooth,
  // ignore: public_member_api_docs
  manageExternalStorage,
  // ignore: public_member_api_docs
  systemAlertWindow,
  // ignore: public_member_api_docs
  requestInstallPackages,
  // ignore: public_member_api_docs
  appTrackingTransparency,
  // ignore: public_member_api_docs
  criticalAlerts,
  // ignore: public_member_api_docs
  accessNotificationPolicy,
  // ignore: public_member_api_docs
  bluetoothScan,
  // ignore: public_member_api_docs
  bluetoothAdvertise,
  // ignore: public_member_api_docs
  bluetoothConnect;

  @override
  String toString() {
    switch (this) {
      case PermissionType.calendar:
        return "calendar";
      case PermissionType.camera:
        return "camera";
      case PermissionType.contacts:
        return "contacts";
      case PermissionType.location:
        return "location";
      case PermissionType.locationAlways:
        return "location_always";
      case PermissionType.locationWhenInUse:
        return "location_when_in_use";
      case PermissionType.mediaLibrary:
        return "media_library";
      case PermissionType.microphone:
        return "microphone";
      case PermissionType.phone:
        return "phone";
      case PermissionType.photos:
        return "photos";
      case PermissionType.photosAddOnly:
        return "photos_add_only";
      case PermissionType.reminders:
        return "reminders";
      case PermissionType.sensors:
        return "sensors";
      case PermissionType.sms:
        return "sms";
      case PermissionType.speech:
        return "speech";
      case PermissionType.storage:
        return "storage";
      case PermissionType.ignoreBatteryOptimizations:
        return "ignore_battery_optimizations";
      case PermissionType.notification:
        return "notification";
      case PermissionType.accessMediaLocation:
        return "access_media_location";
      case PermissionType.activityRecognition:
        return "activity_recognition";
      case PermissionType.unknown:
        return "unknown";
      case PermissionType.bluetooth:
        return "bluetooth";
      case PermissionType.manageExternalStorage:
        return "manage_external_storage";
      case PermissionType.systemAlertWindow:
        return "system_alert_window";
      case PermissionType.requestInstallPackages:
        return "request_install_packages";
      case PermissionType.appTrackingTransparency:
        return "app_tracking_transparency";
      case PermissionType.criticalAlerts:
        return "critical_alerts";
      case PermissionType.accessNotificationPolicy:
        return "access_notification_policy";
      case PermissionType.bluetoothScan:
        return "bluetooth_scan";
      case PermissionType.bluetoothAdvertise:
        return "bluetooth_advertise";
      case PermissionType.bluetoothConnect:
        return "bluetooth_connect";
    }
  }
}

/// Service Type
enum ServiceType {
  // ignore: public_member_api_docs
  location,
  // ignore: public_member_api_docs
  locationAlways,
  // ignore: public_member_api_docs
  locationWhenInUse,
  // ignore: public_member_api_docs
  phone;

  @override
  String toString() {
    switch (this) {
      case ServiceType.location:
        return "location";
      case ServiceType.locationAlways:
        return "location_always";
      case ServiceType.locationWhenInUse:
        return "location_when_in_use";
      case ServiceType.phone:
        return "phone";
    }
  }
}

/// Permission
@Freezed(
  map: FreezedMapOptions.none,
  when: FreezedWhenOptions.none,
)
class Permission with _$Permission {
  // ignore: public_member_api_docs
  const factory Permission({
    @Default(PermissionStatus.notDetermined()) final PermissionStatus calendar,
    @Default(PermissionStatus.notDetermined()) final PermissionStatus camera,
    @Default(PermissionStatus.notDetermined()) final PermissionStatus contacts,
    @Default(PermissionStatus.notDetermined()) final PermissionStatus location,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus locationAlways,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus locationWhenInUse,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus mediaLibrary,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus microphone,
    @Default(PermissionStatus.notDetermined()) final PermissionStatus phone,
    @Default(PermissionStatus.notDetermined()) final PermissionStatus photos,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus photosAddOnly,
    @Default(PermissionStatus.notDetermined()) final PermissionStatus reminders,
    @Default(PermissionStatus.notDetermined()) final PermissionStatus sensors,
    @Default(PermissionStatus.notDetermined()) final PermissionStatus sms,
    @Default(PermissionStatus.notDetermined()) final PermissionStatus speech,
    @Default(PermissionStatus.notDetermined()) final PermissionStatus storage,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus ignoreBatteryOptimizations,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus notification,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus accessMediaLocation,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus activityRecognition,
    @Default(PermissionStatus.notDetermined()) final PermissionStatus unknown,
    @Default(PermissionStatus.notDetermined()) final PermissionStatus bluetooth,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus manageExternalStorage,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus systemAlertWindow,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus requestInstallPackages,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus appTrackingTransparency,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus criticalAlerts,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus accessNotificationPolicy,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus bluetoothScan,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus bluetoothAdvertise,
    @Default(PermissionStatus.notDetermined())
        final PermissionStatus bluetoothConnect,
  }) = _Permission;

  const Permission._();
}

// ignore: public_member_api_docs
extension PermissionExtension on Permission {
  // ignore: public_member_api_docs
  PermissionStatus getPermissionStatus(final PermissionType type) {
    switch (type) {
      case PermissionType.calendar:
        return calendar;
      case PermissionType.camera:
        return camera;
      case PermissionType.contacts:
        return contacts;
      case PermissionType.location:
        return location;
      case PermissionType.locationAlways:
        return locationAlways;
      case PermissionType.locationWhenInUse:
        return locationWhenInUse;
      case PermissionType.mediaLibrary:
        return mediaLibrary;
      case PermissionType.microphone:
        return microphone;
      case PermissionType.phone:
        return phone;
      case PermissionType.photos:
        return photos;
      case PermissionType.photosAddOnly:
        return photosAddOnly;
      case PermissionType.reminders:
        return reminders;
      case PermissionType.sensors:
        return sensors;
      case PermissionType.sms:
        return sms;
      case PermissionType.speech:
        return speech;
      case PermissionType.storage:
        return storage;
      case PermissionType.ignoreBatteryOptimizations:
        return ignoreBatteryOptimizations;
      case PermissionType.notification:
        return notification;
      case PermissionType.accessMediaLocation:
        return accessMediaLocation;
      case PermissionType.activityRecognition:
        return activityRecognition;
      case PermissionType.unknown:
        return unknown;
      case PermissionType.bluetooth:
        return bluetooth;
      case PermissionType.manageExternalStorage:
        return manageExternalStorage;
      case PermissionType.systemAlertWindow:
        return systemAlertWindow;
      case PermissionType.requestInstallPackages:
        return requestInstallPackages;
      case PermissionType.appTrackingTransparency:
        return appTrackingTransparency;
      case PermissionType.criticalAlerts:
        return criticalAlerts;
      case PermissionType.accessNotificationPolicy:
        return accessNotificationPolicy;
      case PermissionType.bluetoothScan:
        return bluetoothScan;
      case PermissionType.bluetoothAdvertise:
        return bluetoothAdvertise;
      case PermissionType.bluetoothConnect:
        return bluetoothConnect;
    }
  }
}

/// Permission Status
@freezed
class PermissionStatus with _$PermissionStatus {
  // ignore: public_member_api_docs
  const factory PermissionStatus.denied() = DeniedPermissionStatus;

  // ignore: public_member_api_docs
  const factory PermissionStatus.granted() = GrantedPermissionStatus;

  // ignore: public_member_api_docs
  const factory PermissionStatus.restricted() = RestrictedPermissionStatus;

  // ignore: public_member_api_docs
  const factory PermissionStatus.limited() = LimitedPermissionStatus;

  // ignore: public_member_api_docs
  const factory PermissionStatus.permanentlyDenied() =
      PermanentlyDeniedPermissionStatus;

  // ignore: public_member_api_docs
  const factory PermissionStatus.notDetermined() =
      NotDeterminedPermissionStatus;

  const PermissionStatus._();

  // ignore: public_member_api_docs
  factory PermissionStatus.fromStatus(final handler.PermissionStatus status) {
    switch (status) {
      case handler.PermissionStatus.denied:
        return const PermissionStatus.denied();
      case handler.PermissionStatus.granted:
        return const PermissionStatus.granted();
      case handler.PermissionStatus.restricted:
        return const PermissionStatus.restricted();
      case handler.PermissionStatus.limited:
        return const PermissionStatus.limited();
      case handler.PermissionStatus.permanentlyDenied:
        return const PermissionStatus.permanentlyDenied();
    }
  }

  @override
  String toString() => when(
        denied: () => "denied",
        granted: () => "granted",
        restricted: () => "resticted",
        limited: () => "limited",
        permanentlyDenied: () => "permanently_denied",
        notDetermined: () => "not_determined",
      );
}

/// Service Status
@freezed
class ServiceStatus with _$ServiceStatus {
  // ignore: public_member_api_docs
  const factory ServiceStatus.disabled() = DisabledServiceStatus;

  // ignore: public_member_api_docs
  const factory ServiceStatus.enabled() = EnabledServiceStatus;

  // ignore: public_member_api_docs
  const factory ServiceStatus.notApplicable() = NotApplicableServiceStatus;

  // ignore: public_member_api_docs
  const ServiceStatus._();

  // ignore: public_member_api_docs
  factory ServiceStatus.fromStatus(final handler.ServiceStatus status) {
    switch (status) {
      case handler.ServiceStatus.disabled:
        return const ServiceStatus.disabled();
      case handler.ServiceStatus.enabled:
        return const ServiceStatus.enabled();
      case handler.ServiceStatus.notApplicable:
        return const ServiceStatus.notApplicable();
    }
  }

  @override
  String toString() => when(
        disabled: () => "disabled",
        enabled: () => "enabled",
        notApplicable: () => "not_applicable",
      );
}
