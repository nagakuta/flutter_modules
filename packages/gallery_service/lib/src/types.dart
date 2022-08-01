import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'types.freezed.dart';

/// Gallery File Type
enum GalleryFileType {
  // ignore: public_member_api_docs
  photo,
  // ignore: public_member_api_docs
  movie,
}

@Freezed(
  map: FreezedMapOptions(
    mapOrNull: false,
    maybeMap: false,
  ),
  when: FreezedWhenOptions(
    whenOrNull: false,
    maybeWhen: false,
  ),
)

/// Gallery File
class GalleryFile with _$GalleryFile {
  // ignore: public_member_api_docs
  const factory GalleryFile.photo(
    final String path, {
    final String? mimeType,
    final String? name,
    final int? length,
    final Uint8List? bytes,
    final DateTime? lastModified,
  }) = GalleryPhotoFile;

  // ignore: public_member_api_docs
  const factory GalleryFile.movie(
    final String path, {
    final String? mimeType,
    final String? name,
    final int? length,
    final Uint8List? bytes,
    final DateTime? lastModified,
  }) = GalleryMovieFile;

  const GalleryFile._();
}
