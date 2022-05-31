import 'package:mockito/annotations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod/riverpod.dart';

import 'client.dart';

/// Package Info Provider
@GenerateMocks(<Type>[PackageInfo])
final FutureProvider<PackageInfo> packageInfoProvider =
    FutureProvider<PackageInfo>(
  (final FutureProviderRef<PackageInfo> ref) async {
    final PackageInfoClient packageInfoClient =
        ref.watch(packageInfoClientProvider);

    return packageInfoClient.getPackageInfo();
  },
);
