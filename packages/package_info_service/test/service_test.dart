import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:package_info_service/src/client.dart';
import 'package:package_info_service/src/service.dart';
import 'package:package_info_service/src/service.mocks.dart';
import 'package:riverpod/riverpod.dart';

import 'client.mocks.dart';

void main() {
  final MockPackageInfo mockPackageInfo = MockPackageInfo();
  final MockPackageInfoClient mockPackageInfoClient = MockPackageInfoClient();

  final ProviderContainer container = ProviderContainer(
    overrides: <Override>[
      packageInfoClientProvider.overrideWithValue(mockPackageInfoClient),
    ],
  );

  setUp(() {
    reset(mockPackageInfo);
    reset(mockPackageInfoClient);
    when(mockPackageInfo.appName).thenReturn("TEST_APP_NAME");
    when(mockPackageInfo.buildNumber).thenReturn("TEST_BUILD_NUMBER");
    when(mockPackageInfo.buildSignature).thenReturn("TEST_BUILD_SIGNATURE");
    when(mockPackageInfo.packageName).thenReturn("TEST_PACKAGE_NAME");
    when(mockPackageInfo.version).thenReturn("TEST_VERSION");
  });

  group("PackageInfoProvider", () {
    setUp(() {
      when(
        mockPackageInfoClient.getPackageInfo(),
      ).thenAnswer(
        (final _) async => mockPackageInfo,
      );
    });

    test("succeed", () async {
      try {
        expect(
          container.refresh(packageInfoProvider),
          isA<AsyncLoading<PackageInfo>>(),
        );

        await container.read(packageInfoProvider.future);

        final AsyncValue<PackageInfo> state =
            container.read(packageInfoProvider);

        expect(state, isA<AsyncData<PackageInfo>>());
        expect(state.value, isA<PackageInfo>());
        expect(state.value, isNotNull);
        expect(state.value?.appName, equals("TEST_APP_NAME"));
        expect(state.value?.buildNumber, equals("TEST_BUILD_NUMBER"));
        expect(state.value?.buildSignature, equals("TEST_BUILD_SIGNATURE"));
        expect(state.value?.packageName, equals("TEST_PACKAGE_NAME"));
        expect(state.value?.version, equals("TEST_VERSION"));
      } on Exception catch (exception) {
        fail(exception.toString());
      }
    });

    test("failed", () async {
      when(
        mockPackageInfoClient.getPackageInfo(),
      ).thenThrow(
        Exception("MOCKED GET PACKAGE INFO EXCEPTION"),
      );

      expect(
        container.refresh(packageInfoProvider),
        isA<AsyncLoading<PackageInfo>>(),
      );

      expect(
        container.refresh(packageInfoProvider.future),
        throwsA(
          isException.having(
            (final Exception exception) => exception.toString(),
            "message",
            equals("Exception: MOCKED GET PACKAGE INFO EXCEPTION"),
          ),
        ),
      );
    });
  });
}
