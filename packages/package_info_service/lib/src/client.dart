import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod/riverpod.dart';

/// Package Info Client
abstract class PackageInfoClient {
  /// Retrieves package information from the platform.
  Future<PackageInfo> getPackageInfo();
}

// ignore: public_member_api_docs
class PackageInfoClientImpl implements PackageInfoClient {
  // ignore: public_member_api_docs
  const PackageInfoClientImpl();

  @override
  Future<PackageInfo> getPackageInfo() => PackageInfo.fromPlatform();
}

/// PackageInfoClient Provider
final Provider<PackageInfoClient> packageInfoClientProvider =
    Provider<PackageInfoClient>(
  (final _) => const PackageInfoClientImpl(),
);
