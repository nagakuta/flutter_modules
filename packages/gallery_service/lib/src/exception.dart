import 'package:freezed_annotation/freezed_annotation.dart';

part 'exception.freezed.dart';

/// GalleryService Exception
@freezed
class GalleryServiceException
    with _$GalleryServiceException
    implements Exception {
  // ignore: public_member_api_docs
  const factory GalleryServiceException.fileNotFound() =
      GalleryFileNotFoundException;

  const GalleryServiceException._();

  @override
  String toString() => when(
        fileNotFound: () => "GalleryServiceException: File not found.",
      );
}
