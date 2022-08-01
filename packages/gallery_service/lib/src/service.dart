import 'package:analytics_service/analytics_service.dart';
import 'package:crashlytics_service/crashlytics_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_service/permission_service.dart';
import 'package:riverpod/riverpod.dart';

import '/src/client.dart';
import '/src/exception.dart';
import '/src/types.dart';

/// Gallery Service
abstract class GalleryService {
  Future<GalleryFile> pickMedia({
    required final GalleryFileType fileType,
    required final ImageSource source,
    final double? maxWidth,
    final double? maxHeight,
    final int? imageQuality,
    final CameraDevice preferredCameraDevice = CameraDevice.rear,
  });

  Future<List<GalleryFile>> pickMultiMedia({
    required final GalleryFileType fileType,
    required final ImageSource source,
    final double? maxWidth,
    final double? maxHeight,
    final int? imageQuality,
    final CameraDevice preferredCameraDevice = CameraDevice.rear,
  });
}

// ignore: public_member_api_docs
class GalleryServiceImpl implements GalleryService {
  // ignore: public_member_api_docs
  const GalleryServiceImpl({
    required final GalleryClient galleryClient,
    required final AnalyticsService analyticsService,
    required final CrashlyticsService crashlyticsService,
    required final PermissionService permissionService,
  })  : _galleryClient = galleryClient,
        _analyticsService = analyticsService,
        _crashlyticsService = crashlyticsService,
        _permissionService = permissionService;

  final GalleryClient _galleryClient;
  final AnalyticsService _analyticsService;
  final CrashlyticsService _crashlyticsService;
  final PermissionService _permissionService;

  @override
  Future<GalleryFile> pickMedia({
    required final GalleryFileType fileType,
    required final ImageSource source,
    final double? maxWidth,
    final double? maxHeight,
    final int? imageQuality,
    final CameraDevice preferredCameraDevice = CameraDevice.rear,
    final Duration? maxDuration,
  }) async {
    switch (fileType) {
      case GalleryFileType.movie:
        final XFile? file = await _galleryClient.pickVideo(
          source: source,
          preferredCameraDevice: preferredCameraDevice,
          maxDuration: maxDuration,
        );

        if (file == null) {
          throw const GalleryServiceException.fileNotFound();
        }

        return GalleryFile.movie(
          file.path,
          mimeType: file.mimeType,
          name: file.name,
          length: await file.length(),
          bytes: await file.readAsBytes(),
          lastModified: await file.lastModified(),
        );
      case GalleryFileType.photo:
        final XFile? file = await _galleryClient.pickImage(
          source: source,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          imageQuality: imageQuality,
          preferredCameraDevice: preferredCameraDevice,
        );

        if (file == null) {
          throw const GalleryServiceException.fileNotFound();
        }

        return GalleryFile.photo(
          file.path,
          mimeType: file.mimeType,
          name: file.name,
          length: await file.length(),
          bytes: await file.readAsBytes(),
          lastModified: await file.lastModified(),
        );
    }
  }

  @override
  Future<List<GalleryFile>> pickMultiMedia({
    required final GalleryFileType fileType,
    required final ImageSource source,
    final double? maxWidth,
    final double? maxHeight,
    final int? imageQuality,
    final CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) {
    // TODO: implement pickMultiMedia
    throw UnimplementedError();
  }
}

/// GalleryService Provider
final Provider<GalleryService> galleryServiceProvider =
    Provider<GalleryService>(
  (final ProviderRef<GalleryService> ref) {
    final GalleryClient galleryClient = ref.watch(galleryClientProvider);
    final AnalyticsService analyticsService =
        ref.watch(analyticsServiceProvider(null));
    final CrashlyticsService crashlyticsService =
        ref.watch(crashlyticsServiceProvider);
    final PermissionService permissionService =
        ref.watch(permissionServiceProvider);

    return GalleryServiceImpl(
      galleryClient: galleryClient,
      analyticsService: analyticsService,
      crashlyticsService: crashlyticsService,
      permissionService: permissionService,
    );
  },
);
