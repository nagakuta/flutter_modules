import 'package:image_picker/image_picker.dart';
import 'package:riverpod/riverpod.dart';

/// Gallery Client
abstract class GalleryClient {
  /// Returns an [XFile] object wrapping the image that was picked.
  Future<XFile?> pickImage({
    required final ImageSource source,
    final double? maxWidth,
    final double? maxHeight,
    final int? imageQuality,
    final CameraDevice preferredCameraDevice = CameraDevice.rear,
  });

  /// Returns a [List] object wrapping the images that were picked.
  Future<List<XFile>?> pickMultiImage({
    final double? maxWidth,
    final double? maxHeight,
    final int? imageQuality,
  });

  /// Returns an [XFile] object wrapping the video that was picked.
  Future<XFile?> pickVideo({
    required final ImageSource source,
    final CameraDevice preferredCameraDevice = CameraDevice.rear,
    final Duration? maxDuration,
  });

  /// Retrieve the lost [XFile] when [pickImage], [pickMultiImage]
  /// or [pickVideo] failed because the MainActivity is destroyed.
  /// (Android only)
  Future<LostDataResponse> retrieveLostData();
}

// ignore: public_member_api_docs
class GalleryClientImpl implements GalleryClient {
  // ignore: public_member_api_docs
  const GalleryClientImpl({
    required final ImagePicker imagePicker,
  }) : _imagePicker = imagePicker;

  final ImagePicker _imagePicker;

  @override
  Future<XFile?> pickImage({
    required final ImageSource source,
    final double? maxWidth,
    final double? maxHeight,
    final int? imageQuality,
    final CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) =>
      _imagePicker.pickImage(
        source: source,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
        preferredCameraDevice: preferredCameraDevice,
      );

  @override
  Future<List<XFile>?> pickMultiImage({
    final double? maxWidth,
    final double? maxHeight,
    final int? imageQuality,
  }) =>
      _imagePicker.pickMultiImage(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
      );

  @override
  Future<XFile?> pickVideo({
    required final ImageSource source,
    final CameraDevice preferredCameraDevice = CameraDevice.rear,
    final Duration? maxDuration,
  }) =>
      _imagePicker.pickVideo(
        source: source,
        preferredCameraDevice: preferredCameraDevice,
        maxDuration: maxDuration,
      );

  @override
  Future<LostDataResponse> retrieveLostData() =>
      _imagePicker.retrieveLostData();
}

/// GalleryClient Provider
final Provider<GalleryClient> galleryClientProvider = Provider<GalleryClient>(
  (final _) {
    final ImagePicker imagePicker = ImagePicker();
    return GalleryClientImpl(imagePicker: imagePicker);
  },
);
