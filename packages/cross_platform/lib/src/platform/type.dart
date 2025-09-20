// ignore_for_file: public_member_api_docs

enum CrossPlatformType {
  /// Android: <https://www.android.com/>
  android,

  /// Fuchsia: <https://fuchsia.dev/fuchsia-src/concepts>
  fuchsia,

  /// iOS: <https://www.apple.com/ios/>
  iOS,

  /// Linux: <https://www.linux.org>
  linux,

  /// macOS: <https://www.apple.com/macos>
  macOS,

  /// Windows: <https://www.windows.com>
  windows,

  /// Web
  web;

  @pragma("vm:platform-const")
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isMaterial => switch (this) {
    CrossPlatformType.android => true,
    _ => false,
  };

  @pragma("vm:platform-const")
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isCupertino => switch (this) {
    CrossPlatformType.iOS || CrossPlatformType.macOS => true,
    _ => false,
  };

  @pragma("vm:platform-const")
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isMobile => switch (this) {
    CrossPlatformType.android || CrossPlatformType.iOS => true,
    _ => false,
  };

  @pragma("vm:platform-const")
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isWeb => switch (this) {
    CrossPlatformType.web => true,
    _ => false,
  };
}
