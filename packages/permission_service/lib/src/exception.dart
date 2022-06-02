import 'package:freezed_annotation/freezed_annotation.dart';

part 'exception.freezed.dart';

/// PermissionService Exception
@freezed
class PermissionServiceException
    with _$PermissionServiceException
    implements Exception {
  // ignore: public_member_api_docs
  const factory PermissionServiceException.serviceNotSupported() =
      PermissionServiceNotSupportedException;

  // ignore: public_member_api_docs
  const factory PermissionServiceException.alreadyGranted() =
      PermissionAlreadyGrantedException;

  // ignore: public_member_api_docs
  const factory PermissionServiceException.cannotOpenAppSettings() =
      PermissionCannotOpenAppSettingsException;

  const PermissionServiceException._();

  @override
  String toString() => when(
        serviceNotSupported: () =>
            "PermissionServiceException: Service not supported.",
        alreadyGranted: () => "PermissionServiceException: Already granted.",
        cannotOpenAppSettings: () =>
            "PermissionServiceException: Cannot open app settings.",
      );
}
