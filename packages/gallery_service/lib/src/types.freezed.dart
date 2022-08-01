// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GalleryFile {
  String get path => throw _privateConstructorUsedError;
  String? get mimeType => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get length => throw _privateConstructorUsedError;
  Uint8List? get bytes => throw _privateConstructorUsedError;
  DateTime? get lastModified => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path, String? mimeType, String? name,
            int? length, Uint8List? bytes, DateTime? lastModified)
        photo,
    required TResult Function(String path, String? mimeType, String? name,
            int? length, Uint8List? bytes, DateTime? lastModified)
        movie,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GalleryPhotoFile value) photo,
    required TResult Function(GalleryMovieFile value) movie,
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GalleryFileCopyWith<GalleryFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryFileCopyWith<$Res> {
  factory $GalleryFileCopyWith(
          GalleryFile value, $Res Function(GalleryFile) then) =
      _$GalleryFileCopyWithImpl<$Res>;
  $Res call(
      {String path,
      String? mimeType,
      String? name,
      int? length,
      Uint8List? bytes,
      DateTime? lastModified});
}

/// @nodoc
class _$GalleryFileCopyWithImpl<$Res> implements $GalleryFileCopyWith<$Res> {
  _$GalleryFileCopyWithImpl(this._value, this._then);

  final GalleryFile _value;
  // ignore: unused_field
  final $Res Function(GalleryFile) _then;

  @override
  $Res call({
    Object? path = freezed,
    Object? mimeType = freezed,
    Object? name = freezed,
    Object? length = freezed,
    Object? bytes = freezed,
    Object? lastModified = freezed,
  }) {
    return _then(_value.copyWith(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: mimeType == freezed
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      bytes: bytes == freezed
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      lastModified: lastModified == freezed
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$GalleryPhotoFileCopyWith<$Res>
    implements $GalleryFileCopyWith<$Res> {
  factory _$$GalleryPhotoFileCopyWith(
          _$GalleryPhotoFile value, $Res Function(_$GalleryPhotoFile) then) =
      __$$GalleryPhotoFileCopyWithImpl<$Res>;
  @override
  $Res call(
      {String path,
      String? mimeType,
      String? name,
      int? length,
      Uint8List? bytes,
      DateTime? lastModified});
}

/// @nodoc
class __$$GalleryPhotoFileCopyWithImpl<$Res>
    extends _$GalleryFileCopyWithImpl<$Res>
    implements _$$GalleryPhotoFileCopyWith<$Res> {
  __$$GalleryPhotoFileCopyWithImpl(
      _$GalleryPhotoFile _value, $Res Function(_$GalleryPhotoFile) _then)
      : super(_value, (v) => _then(v as _$GalleryPhotoFile));

  @override
  _$GalleryPhotoFile get _value => super._value as _$GalleryPhotoFile;

  @override
  $Res call({
    Object? path = freezed,
    Object? mimeType = freezed,
    Object? name = freezed,
    Object? length = freezed,
    Object? bytes = freezed,
    Object? lastModified = freezed,
  }) {
    return _then(_$GalleryPhotoFile(
      path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: mimeType == freezed
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      bytes: bytes == freezed
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      lastModified: lastModified == freezed
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$GalleryPhotoFile extends GalleryPhotoFile {
  const _$GalleryPhotoFile(this.path,
      {this.mimeType, this.name, this.length, this.bytes, this.lastModified})
      : super._();

  @override
  final String path;
  @override
  final String? mimeType;
  @override
  final String? name;
  @override
  final int? length;
  @override
  final Uint8List? bytes;
  @override
  final DateTime? lastModified;

  @override
  String toString() {
    return 'GalleryFile.photo(path: $path, mimeType: $mimeType, name: $name, length: $length, bytes: $bytes, lastModified: $lastModified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryPhotoFile &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality().equals(other.mimeType, mimeType) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.length, length) &&
            const DeepCollectionEquality().equals(other.bytes, bytes) &&
            const DeepCollectionEquality()
                .equals(other.lastModified, lastModified));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(path),
      const DeepCollectionEquality().hash(mimeType),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(length),
      const DeepCollectionEquality().hash(bytes),
      const DeepCollectionEquality().hash(lastModified));

  @JsonKey(ignore: true)
  @override
  _$$GalleryPhotoFileCopyWith<_$GalleryPhotoFile> get copyWith =>
      __$$GalleryPhotoFileCopyWithImpl<_$GalleryPhotoFile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path, String? mimeType, String? name,
            int? length, Uint8List? bytes, DateTime? lastModified)
        photo,
    required TResult Function(String path, String? mimeType, String? name,
            int? length, Uint8List? bytes, DateTime? lastModified)
        movie,
  }) {
    return photo(path, mimeType, name, length, bytes, lastModified);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GalleryPhotoFile value) photo,
    required TResult Function(GalleryMovieFile value) movie,
  }) {
    return photo(this);
  }
}

abstract class GalleryPhotoFile extends GalleryFile {
  const factory GalleryPhotoFile(final String path,
      {final String? mimeType,
      final String? name,
      final int? length,
      final Uint8List? bytes,
      final DateTime? lastModified}) = _$GalleryPhotoFile;
  const GalleryPhotoFile._() : super._();

  @override
  String get path;
  @override
  String? get mimeType;
  @override
  String? get name;
  @override
  int? get length;
  @override
  Uint8List? get bytes;
  @override
  DateTime? get lastModified;
  @override
  @JsonKey(ignore: true)
  _$$GalleryPhotoFileCopyWith<_$GalleryPhotoFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GalleryMovieFileCopyWith<$Res>
    implements $GalleryFileCopyWith<$Res> {
  factory _$$GalleryMovieFileCopyWith(
          _$GalleryMovieFile value, $Res Function(_$GalleryMovieFile) then) =
      __$$GalleryMovieFileCopyWithImpl<$Res>;
  @override
  $Res call(
      {String path,
      String? mimeType,
      String? name,
      int? length,
      Uint8List? bytes,
      DateTime? lastModified});
}

/// @nodoc
class __$$GalleryMovieFileCopyWithImpl<$Res>
    extends _$GalleryFileCopyWithImpl<$Res>
    implements _$$GalleryMovieFileCopyWith<$Res> {
  __$$GalleryMovieFileCopyWithImpl(
      _$GalleryMovieFile _value, $Res Function(_$GalleryMovieFile) _then)
      : super(_value, (v) => _then(v as _$GalleryMovieFile));

  @override
  _$GalleryMovieFile get _value => super._value as _$GalleryMovieFile;

  @override
  $Res call({
    Object? path = freezed,
    Object? mimeType = freezed,
    Object? name = freezed,
    Object? length = freezed,
    Object? bytes = freezed,
    Object? lastModified = freezed,
  }) {
    return _then(_$GalleryMovieFile(
      path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: mimeType == freezed
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      bytes: bytes == freezed
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      lastModified: lastModified == freezed
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$GalleryMovieFile extends GalleryMovieFile {
  const _$GalleryMovieFile(this.path,
      {this.mimeType, this.name, this.length, this.bytes, this.lastModified})
      : super._();

  @override
  final String path;
  @override
  final String? mimeType;
  @override
  final String? name;
  @override
  final int? length;
  @override
  final Uint8List? bytes;
  @override
  final DateTime? lastModified;

  @override
  String toString() {
    return 'GalleryFile.movie(path: $path, mimeType: $mimeType, name: $name, length: $length, bytes: $bytes, lastModified: $lastModified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryMovieFile &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality().equals(other.mimeType, mimeType) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.length, length) &&
            const DeepCollectionEquality().equals(other.bytes, bytes) &&
            const DeepCollectionEquality()
                .equals(other.lastModified, lastModified));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(path),
      const DeepCollectionEquality().hash(mimeType),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(length),
      const DeepCollectionEquality().hash(bytes),
      const DeepCollectionEquality().hash(lastModified));

  @JsonKey(ignore: true)
  @override
  _$$GalleryMovieFileCopyWith<_$GalleryMovieFile> get copyWith =>
      __$$GalleryMovieFileCopyWithImpl<_$GalleryMovieFile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path, String? mimeType, String? name,
            int? length, Uint8List? bytes, DateTime? lastModified)
        photo,
    required TResult Function(String path, String? mimeType, String? name,
            int? length, Uint8List? bytes, DateTime? lastModified)
        movie,
  }) {
    return movie(path, mimeType, name, length, bytes, lastModified);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GalleryPhotoFile value) photo,
    required TResult Function(GalleryMovieFile value) movie,
  }) {
    return movie(this);
  }
}

abstract class GalleryMovieFile extends GalleryFile {
  const factory GalleryMovieFile(final String path,
      {final String? mimeType,
      final String? name,
      final int? length,
      final Uint8List? bytes,
      final DateTime? lastModified}) = _$GalleryMovieFile;
  const GalleryMovieFile._() : super._();

  @override
  String get path;
  @override
  String? get mimeType;
  @override
  String? get name;
  @override
  int? get length;
  @override
  Uint8List? get bytes;
  @override
  DateTime? get lastModified;
  @override
  @JsonKey(ignore: true)
  _$$GalleryMovieFileCopyWith<_$GalleryMovieFile> get copyWith =>
      throw _privateConstructorUsedError;
}
