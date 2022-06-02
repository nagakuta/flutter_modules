import 'package:analytics_service/src/client.dart';
import 'package:analytics_service/src/service.dart';
import 'package:analytics_service/src/service.mocks.dart';
import 'package:crashlytics_service/crashlytics_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_service/firebase_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';

import 'client.mocks.dart';

void main() {
  group("AnalyticsService", () {
    final MockFirebaseAnalyticsObserver mockFirebaseAnalyticsObserver =
        MockFirebaseAnalyticsObserver();
    final MockFirebaseApp mockFirebaseApp = MockFirebaseApp();
    final MockAnalyticsClient mockAnalyticsClient = MockAnalyticsClient();
    final MockCrashlyticsService mockCrashlyticsService =
        MockCrashlyticsService();

    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        analyticsClientProvider.overrideWithProvider(
          (final _) => Provider<AnalyticsClient>(
            (final _) => mockAnalyticsClient,
          ),
        ),
        crashlyticsServiceProvider.overrideWithValue(mockCrashlyticsService),
      ],
    );

    setUp(() {
      reset(mockFirebaseAnalyticsObserver);
      reset(mockFirebaseApp);
      reset(mockAnalyticsClient);
      reset(mockCrashlyticsService);
    });

    test("observe", () {
      when(
        mockAnalyticsClient.observe(
          nameExtractor: anyNamed("nameExtractor"),
          routeFilter: anyNamed("routeFilter"),
          onError: anyNamed("onError"),
        ),
      ).thenReturn(mockFirebaseAnalyticsObserver);

      final AnalyticsService service =
          container.refresh(analyticsServiceProvider(mockFirebaseApp));

      try {
        final FirebaseAnalyticsObserver observer = service.observe();

        expect(observer, isA<FirebaseAnalyticsObserver>());
        expect(observer, isNotNull);

        verify(
          mockAnalyticsClient.observe(
            nameExtractor: argThat(
              isA<ScreenNameExtractor>().having(
                (final ScreenNameExtractor nameExtractor) => nameExtractor,
                "nameExtractor",
                isNotNull,
              ),
              named: "nameExtractor",
            ),
            routeFilter: argThat(
              isA<RouteFilter>().having(
                (final RouteFilter routeFilter) => routeFilter,
                "routeFilter",
                isNotNull,
              ),
              named: "routeFilter",
            ),
            onError: argThat(
              isA<Function(PlatformException error)?>().having(
                (final Function(PlatformException error)? onError) => onError,
                "onError",
                isNull,
              ),
              named: "onError",
            ),
          ),
        ).called(1);
      } on Exception catch (exception) {
        fail(exception.toString());
      }
    });

    group("logAdImpression", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logAdImpression(
            adPlatform: anyNamed("adPlatform"),
            adSource: anyNamed("adSource"),
            adFormat: anyNamed("adFormat"),
            adUnitName: anyNamed("adUnitName"),
            value: anyNamed("value"),
            currency: anyNamed("currency"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logAdImpression(
            adPlatform: "TEST_AD_PLATFOMR",
            adSource: "TEST_AD_SOURCE",
            adFormat: "TEST_AD_FORMAT",
            adUnitName: "TEST_AD_UNIT_NAME",
            value: 0,
            currency: "TEST_CURRENCY",
          );

          verify(
            mockAnalyticsClient.logAdImpression(
              adPlatform: argThat(
                isA<String?>().having(
                  (final String? adPlatform) => adPlatform,
                  "adPlatform",
                  equals("TEST_AD_PLATFORM"),
                ),
                named: "adPlatform",
              ),
              adSource: argThat(
                isA<String?>().having(
                  (final String? adSource) => adSource,
                  "adSource",
                  equals("TEST_AD_SOURCE"),
                ),
                named: "adSource",
              ),
              adFormat: argThat(
                isA<String?>().having(
                  (final String? adFormat) => adFormat,
                  "adFormat",
                  equals("TEST_AD_FORMAT"),
                ),
                named: "adFormat",
              ),
              adUnitName: argThat(
                isA<String?>().having(
                  (final String? adUnitName) => adUnitName,
                  "adUnitName",
                  equals("TEST_AD_UNIT_NAME"),
                ),
                named: "adUnitName",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logAdImpression(
            adPlatform: anyNamed("adPlatform"),
            adSource: anyNamed("adSource"),
            adFormat: anyNamed("adFormat"),
            adUnitName: anyNamed("adUnitName"),
            value: anyNamed("value"),
            currency: anyNamed("currency"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logAdImpression(
            adPlatform: "TEST_AD_PLATFOMR",
            adSource: "TEST_AD_SOURCE",
            adFormat: "TEST_AD_FORMAT",
            adUnitName: "TEST_AD_UNIT_NAME",
            value: 0,
            currency: "TEST_CURRENCY",
          );

          verify(
            mockAnalyticsClient.logAdImpression(
              adPlatform: argThat(
                isA<String?>().having(
                  (final String? adPlatform) => adPlatform,
                  "adPlatform",
                  equals("TEST_AD_PLATFORM"),
                ),
                named: "adPlatform",
              ),
              adSource: argThat(
                isA<String?>().having(
                  (final String? adSource) => adSource,
                  "adSource",
                  equals("TEST_AD_SOURCE"),
                ),
                named: "adSource",
              ),
              adFormat: argThat(
                isA<String?>().having(
                  (final String? adFormat) => adFormat,
                  "adFormat",
                  equals("TEST_AD_FORMAT"),
                ),
                named: "adFormat",
              ),
              adUnitName: argThat(
                isA<String?>().having(
                  (final String? adUnitName) => adUnitName,
                  "adUnitName",
                  equals("TEST_AD_UNIT_NAME"),
                ),
                named: "adUnitName",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logAddPaymentInfo", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logAddPaymentInfo(
            coupon: anyNamed("coupon"),
            currency: anyNamed("currency"),
            paymentType: anyNamed("paymentType"),
            value: anyNamed("value"),
            items: anyNamed("items"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logAddPaymentInfo(
            coupon: "TEST_COUPON",
            currency: "TEST_CURRENCY",
            paymentType: "TEST_PAYMENT_TYPE",
            value: 0,
            items: <AnalyticsEventItem>[],
          );

          verify(
            mockAnalyticsClient.logAddPaymentInfo(
              coupon: argThat(
                isA<String?>().having(
                  (final String? coupon) => coupon,
                  "coupon",
                  equals("TEST_COUPON"),
                ),
                named: "coupon",
              ),
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              paymentType: argThat(
                isA<String?>().having(
                  (final String? paymentType) => paymentType,
                  "paymentType",
                  equals("TEST_PAYMENT_TYPE"),
                ),
                named: "paymentType",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "coupon",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logAddPaymentInfo(
            coupon: anyNamed("coupon"),
            currency: anyNamed("currency"),
            paymentType: anyNamed("paymentType"),
            value: anyNamed("value"),
            items: anyNamed("items"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logAddPaymentInfo(
            coupon: "TEST_COUPON",
            currency: "TEST_CURRENCY",
            paymentType: "TEST_PAYMENT_TYPE",
            value: 0,
            items: <AnalyticsEventItem>[],
          );

          verify(
            mockAnalyticsClient.logAddPaymentInfo(
              coupon: argThat(
                isA<String?>().having(
                  (final String? coupon) => coupon,
                  "coupon",
                  equals("TEST_COUPON"),
                ),
                named: "coupon",
              ),
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              paymentType: argThat(
                isA<String?>().having(
                  (final String? paymentType) => paymentType,
                  "paymentType",
                  equals("TEST_PAYMENT_TYPE"),
                ),
                named: "paymentType",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "coupon",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logAddShippingInfo", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logAddShippingInfo(
            coupon: anyNamed("coupon"),
            currency: anyNamed("currency"),
            value: anyNamed("value"),
            shippingTier: anyNamed("shippingTier"),
            items: anyNamed("items"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logAddShippingInfo(
            coupon: "TEST_COUPON",
            currency: "TEST_CURRENCY",
            value: 0,
            shippingTier: "TEST_SHIPPING_INFO",
            items: <AnalyticsEventItem>[],
          );

          verify(
            mockAnalyticsClient.logAddShippingInfo(
              coupon: argThat(
                isA<String?>().having(
                  (final String? coupon) => coupon,
                  "coupon",
                  equals("TEST_COUPON"),
                ),
                named: "coupon",
              ),
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              shippingTier: argThat(
                isA<String?>().having(
                  (final String? shippingTier) => shippingTier,
                  "shippingTier",
                  equals("TEST_SHIPPING_TIER"),
                ),
                named: "paymentType",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "coupon",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logAddShippingInfo(
            coupon: anyNamed("coupon"),
            currency: anyNamed("currency"),
            value: anyNamed("value"),
            shippingTier: anyNamed("shippingTier"),
            items: anyNamed("items"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logAddShippingInfo(
            coupon: "TEST_COUPON",
            currency: "TEST_CURRENCY",
            value: 0,
            shippingTier: "TEST_SHIPPING_INFO",
            items: <AnalyticsEventItem>[],
          );

          verify(
            mockAnalyticsClient.logAddShippingInfo(
              coupon: argThat(
                isA<String?>().having(
                  (final String? coupon) => coupon,
                  "coupon",
                  equals("TEST_COUPON"),
                ),
                named: "coupon",
              ),
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              shippingTier: argThat(
                isA<String?>().having(
                  (final String? shippingTier) => shippingTier,
                  "shippingTier",
                  equals("TEST_SHIPPING_TIER"),
                ),
                named: "paymentType",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "coupon",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logAddToCart", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logAddToCart(
            items: anyNamed("items"),
            value: anyNamed("value"),
            currency: anyNamed("currency"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logAddToCart(
            items: <AnalyticsEventItem>[],
            value: 0,
            currency: "TEST_CURRENCY",
          );

          verify(
            mockAnalyticsClient.logAddToCart(
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "coupon",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logAddToCart(
            items: anyNamed("items"),
            value: anyNamed("value"),
            currency: anyNamed("currency"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logAddToCart(
            items: <AnalyticsEventItem>[],
            value: 0,
            currency: "TEST_CURRENCY",
          );

          verify(
            mockAnalyticsClient.logAddToCart(
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "coupon",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logAddToWishlist", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logAddToWishlist(
            items: anyNamed("items"),
            value: anyNamed("value"),
            currency: anyNamed("currency"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logAddToWishlist(
            items: <AnalyticsEventItem>[],
            value: 0,
            currency: "TEST_CURRENCY",
          );

          verify(
            mockAnalyticsClient.logAddToWishlist(
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "coupon",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logAddToWishlist(
            items: anyNamed("items"),
            value: anyNamed("value"),
            currency: anyNamed("currency"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logAddToWishlist(
            items: <AnalyticsEventItem>[],
            value: 0,
            currency: "TEST_CURRENCY",
          );

          verify(
            mockAnalyticsClient.logAddToWishlist(
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "coupon",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logAppOpen", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logAppOpen(
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logAppOpen();

          verify(
            mockAnalyticsClient.logAppOpen(
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logAppOpen(
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logAppOpen();
        } on Exception catch (exception) {
          fail(exception.toString());
        }

        verify(
          mockAnalyticsClient.logAppOpen(
            callOptions: argThat(
              isA<AnalyticsCallOptions?>().having(
                (final AnalyticsCallOptions? callOptions) => callOptions,
                "callOptions",
                isNull,
              ),
              named: "callOptions",
            ),
          ),
        ).called(1);

        verify(
          mockCrashlyticsService.recordException(any, any),
        ).called(1);
      });
    });

    group("logEarnVirtualCurrency", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logEarnVirtualCurrency(
            virtualCurrencyName: anyNamed("virtualCurrencyName"),
            value: anyNamed("value"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logEarnVirtualCurrency(
            virtualCurrencyName: "TEST_VIRTUAL_CURRENCY_NAME",
            value: 0,
          );

          verify(
            mockAnalyticsClient.logEarnVirtualCurrency(
              virtualCurrencyName: argThat(
                isA<String>().having(
                  (final String virtualCurrencyName) => virtualCurrencyName,
                  "virtualCurrencyName",
                  equals("TEST_VIRTUAL_CURRENCY_NAME"),
                ),
                named: "virtualCurrencyName",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logEarnVirtualCurrency(
            virtualCurrencyName: anyNamed("virtualCurrencyName"),
            value: anyNamed("value"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logEarnVirtualCurrency(
            virtualCurrencyName: "TEST_VIRTUAL_CURRENCY_NAME",
            value: 0,
          );

          verify(
            mockAnalyticsClient.logEarnVirtualCurrency(
              virtualCurrencyName: argThat(
                isA<String>().having(
                  (final String virtualCurrencyName) => virtualCurrencyName,
                  "virtualCurrencyName",
                  equals("TEST_VIRTUAL_CURRENCY_NAME"),
                ),
                named: "virtualCurrencyName",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logEvent", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logEvent(
            name: anyNamed("name"),
            parameters: anyNamed("parameters"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logEvent(
            name: "TEST",
            parameters: <String, dynamic>{},
          );

          verify(
            mockAnalyticsClient.logEvent(
              name: argThat(
                isA<String?>().having(
                  (final String? name) => name,
                  "name",
                  equals("TEST"),
                ),
                named: "name",
              ),
              parameters: argThat(
                isA<Map<String, Object?>?>().having(
                  (final Map<String, Object?>? parameters) => parameters,
                  "parameters",
                  isNotNull,
                ),
                named: "parameters",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logEvent(
            name: anyNamed("name"),
            parameters: anyNamed("parameters"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logEvent(
            name: "TEST",
            parameters: <String, dynamic>{},
          );

          verify(
            mockAnalyticsClient.logEvent(
              name: argThat(
                isA<String?>().having(
                  (final String? name) => name,
                  "name",
                  equals("TEST"),
                ),
                named: "name",
              ),
              parameters: argThat(
                isA<Map<String, Object?>?>().having(
                  (final Map<String, Object?>? parameters) => parameters,
                  "parameters",
                  isNotNull,
                ),
                named: "parameters",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logGenerateLead", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logGenerateLead(
            currency: anyNamed("currency"),
            value: anyNamed("value"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logGenerateLead(
            currency: "TEST_CURRENCY",
            value: 0,
          );

          verify(
            mockAnalyticsClient.logGenerateLead(
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logGenerateLead(
            currency: anyNamed("currency"),
            value: anyNamed("value"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logGenerateLead(
            currency: "TEST_CURRENCY",
            value: 0,
          );

          verify(
            mockAnalyticsClient.logGenerateLead(
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logJoinGroup", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logJoinGroup(
            groupId: anyNamed("groupId"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logJoinGroup(groupId: "TEST_GROUP_ID");

          verify(
            mockAnalyticsClient.logJoinGroup(
              groupId: argThat(
                isA<String>().having(
                  (final String groupId) => groupId,
                  "groupId",
                  equals("TEST_GROUP_ID"),
                ),
                named: "groupId",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logJoinGroup(
            groupId: anyNamed("groupId"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logJoinGroup(groupId: "TEST_GROUP_ID");

          verify(
            mockAnalyticsClient.logJoinGroup(
              groupId: argThat(
                isA<String>().having(
                  (final String groupId) => groupId,
                  "groupId",
                  equals("TEST_GROUP_ID"),
                ),
                named: "groupId",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logLevelEnd", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logLevelEnd(
            levelName: anyNamed("levelName"),
            success: anyNamed("success"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logLevelEnd(
            levelName: "TEST_LEVEL_NAME",
            success: 1,
          );

          verify(
            mockAnalyticsClient.logLevelEnd(
              levelName: argThat(
                isA<String?>().having(
                  (final String? levelName) => levelName,
                  "levelName",
                  equals("TEST_LEVEL_NAME"),
                ),
                named: "levelName",
              ),
              success: argThat(
                isA<int?>().having(
                  (final int? success) => success,
                  "success",
                  equals(1),
                ),
                named: "success",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logLevelEnd(
            levelName: anyNamed("levelName"),
            success: anyNamed("success"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logLevelEnd(
            levelName: "TEST_LEVEL_NAME",
            success: 1,
          );

          verify(
            mockAnalyticsClient.logLevelEnd(
              levelName: argThat(
                isA<String?>().having(
                  (final String? levelName) => levelName,
                  "levelName",
                  equals("TEST_LEVEL_NAME"),
                ),
                named: "levelName",
              ),
              success: argThat(
                isA<int?>().having(
                  (final int? success) => success,
                  "success",
                  equals(1),
                ),
                named: "success",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logLevelStart", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logLevelStart(
            levelName: anyNamed("levelName"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logLevelStart(levelName: "TEST_LEVEL_NAME");

          verify(
            mockAnalyticsClient.logLevelStart(
              levelName: argThat(
                isA<String?>().having(
                  (final String? levelName) => levelName,
                  "levelName",
                  equals("TEST_LEVEL_NAME"),
                ),
                named: "levelName",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logLevelStart(
            levelName: anyNamed("levelName"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logLevelStart(levelName: "TEST_LEVEL_NAME");

          verify(
            mockAnalyticsClient.logLevelStart(
              levelName: argThat(
                isA<String?>().having(
                  (final String? levelName) => levelName,
                  "levelName",
                  equals("TEST_LEVEL_NAME"),
                ),
                named: "levelName",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logLevelUp", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logLevelUp(
            level: anyNamed("level"),
            character: anyNamed("character"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logLevelUp(
            level: 1,
            character: "TEST_CHARACTER",
          );

          verify(
            mockAnalyticsClient.logLevelUp(
              level: argThat(
                isA<int>().having(
                  (final int level) => level,
                  "level",
                  equals(1),
                ),
                named: "level",
              ),
              character: argThat(
                isA<String?>().having(
                  (final String? character) => character,
                  "character",
                  equals("TEST_CHARACTER"),
                ),
                named: "character",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logLevelUp(
            level: anyNamed("level"),
            character: anyNamed("character"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logLevelUp(
            level: 1,
            character: "TEST_CHARACTER",
          );

          verify(
            mockAnalyticsClient.logLevelUp(
              level: argThat(
                isA<int>().having(
                  (final int level) => level,
                  "level",
                  equals(1),
                ),
                named: "level",
              ),
              character: argThat(
                isA<String?>().having(
                  (final String? character) => character,
                  "character",
                  equals("TEST_CHARACTER"),
                ),
                named: "character",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logLogin", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logLogin(
            loginMethod: anyNamed("loginMethod"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
        when(
          mockAnalyticsClient.setUserId(
            id: anyNamed("id"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
        when(
          mockCrashlyticsService.setUserIdentifier(any),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logLogin(
            userId: "TEST_USER_ID",
            loginMethod: "TEST_METHOD",
          );

          verifyInOrder(
            <Object>[
              mockAnalyticsClient.logLogin(
                loginMethod: argThat(
                  isA<String?>().having(
                    (final String? loginMethod) => loginMethod,
                    "loginMethod",
                    equals("TEST_METHOD"),
                  ),
                  named: "loginMethod",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
              mockAnalyticsClient.setUserId(
                id: argThat(
                  isA<String?>().having(
                    (final String? id) => id,
                    "id",
                    equals("TEST_USER_ID"),
                  ),
                  named: "id",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
            ],
          );

          verify(
            mockCrashlyticsService.setUserIdentifier(
              argThat(
                isA<String>().having(
                  (final String identifier) => identifier,
                  "identifier",
                  equals("TEST_USER_ID"),
                ),
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed to log logging in", () async {
        when(
          mockAnalyticsClient.logLogin(
            loginMethod: anyNamed("loginMethod"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED LOG LOG IN EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logLogin(
            userId: "TEST_USER_ID",
            loginMethod: "TEST_METHOD",
          );

          verifyInOrder(
            <Object>[
              mockAnalyticsClient.logLogin(
                loginMethod: argThat(
                  isA<String?>().having(
                    (final String? loginMethod) => loginMethod,
                    "loginMethod",
                    equals("TEST_METHOD"),
                  ),
                  named: "loginMethod",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
              mockAnalyticsClient.setUserId(
                id: argThat(
                  isA<String?>().having(
                    (final String? id) => id,
                    "id",
                    equals("TEST_USER_ID"),
                  ),
                  named: "id",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
            ],
          );

          verifyNever(
            mockCrashlyticsService.setUserIdentifier(any),
          );
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed to set user id", () async {
        when(
          mockAnalyticsClient.setUserId(
            id: anyNamed("id"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED SET USER ID EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logLogin(
            userId: "TEST_USER_ID",
            loginMethod: "TEST_METHOD",
          );

          verifyInOrder(
            <Object>[
              mockAnalyticsClient.logLogin(
                loginMethod: argThat(
                  isA<String?>().having(
                    (final String? loginMethod) => loginMethod,
                    "loginMethod",
                    equals("TEST_METHOD"),
                  ),
                  named: "loginMethod",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
              mockAnalyticsClient.setUserId(
                id: argThat(
                  isA<String?>().having(
                    (final String? id) => id,
                    "id",
                    equals("TEST_USER_ID"),
                  ),
                  named: "id",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
            ],
          );

          verifyNever(
            mockCrashlyticsService.setUserIdentifier(any),
          );
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed to set user id with crashlytics", () async {
        when(
          mockCrashlyticsService.setUserIdentifier(any),
        ).thenThrow(
          Exception("MOCKED SET USER IDENTIFIER EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logLogin(
            userId: "TEST_USER_ID",
            loginMethod: "TEST_METHOD",
          );

          verifyInOrder(
            <Object>[
              mockAnalyticsClient.logLogin(
                loginMethod: argThat(
                  isA<String?>().having(
                    (final String? loginMethod) => loginMethod,
                    "loginMethod",
                    equals("TEST_METHOD"),
                  ),
                  named: "loginMethod",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
              mockAnalyticsClient.setUserId(
                id: argThat(
                  isA<String?>().having(
                    (final String? id) => id,
                    "id",
                    equals("TEST_USER_ID"),
                  ),
                  named: "id",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
            ],
          );

          verify(
            mockCrashlyticsService.setUserIdentifier(
              argThat(
                isA<String>().having(
                  (final String identifier) => identifier,
                  "identifier",
                  equals("TEST_USER_ID"),
                ),
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logLogout", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logEvent(
            name: anyNamed("name"),
            parameters: anyNamed("parameters"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
        when(
          mockAnalyticsClient.setUserId(
            id: anyNamed("id"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logLogout(userId: "TEST_USER_ID");

          verifyInOrder(
            <Object>[
              mockAnalyticsClient.logEvent(
                name: argThat(
                  isA<String?>().having(
                    (final String? name) => name,
                    "name",
                    equals("logout"),
                  ),
                  named: "name",
                ),
                parameters: argThat(
                  isA<Map<String, Object?>?>().having(
                    (final Map<String, Object?>? parameters) => parameters,
                    "parameters",
                    containsPair("id", "TEST_USER_ID"),
                  ),
                  named: "parameters",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
              mockAnalyticsClient.setUserId(
                id: argThat(
                  isA<String?>().having(
                    (final String? id) => id,
                    "id",
                    isNull,
                  ),
                  named: "id",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
            ],
          );
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed to set user id", () async {
        when(
          mockAnalyticsClient.setUserId(
            id: anyNamed("id"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED SET USER ID EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logLogout(userId: "TEST_USER_ID");

          verifyInOrder(
            <Object>[
              mockAnalyticsClient.logEvent(
                name: argThat(
                  isA<String?>().having(
                    (final String? name) => name,
                    "name",
                    equals("logout"),
                  ),
                  named: "name",
                ),
                parameters: argThat(
                  isA<Map<String, Object?>?>().having(
                    (final Map<String, Object?>? parameters) => parameters,
                    "parameters",
                    containsPair("id", "TEST_USER_ID"),
                  ),
                  named: "parameters",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
              mockAnalyticsClient.setUserId(
                id: argThat(
                  isA<String?>().having(
                    (final String? id) => id,
                    "id",
                    isNull,
                  ),
                  named: "id",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
            ],
          );

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed to log logging out", () async {
        when(
          mockAnalyticsClient.logEvent(
            name: anyNamed("name"),
            parameters: anyNamed("parameters"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED LOG EVENT EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logLogout(userId: "TEST_USER_ID");

          verifyInOrder(
            <Object>[
              mockAnalyticsClient.logEvent(
                name: argThat(
                  isA<String?>().having(
                    (final String? name) => name,
                    "name",
                    equals("logout"),
                  ),
                  named: "name",
                ),
                parameters: argThat(
                  isA<Map<String, Object?>?>().having(
                    (final Map<String, Object?>? parameters) => parameters,
                    "parameters",
                    containsPair("id", "TEST_USER_ID"),
                  ),
                  named: "parameters",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
              mockAnalyticsClient.setUserId(
                id: argThat(
                  isA<String?>().having(
                    (final String? id) => id,
                    "id",
                    isNull,
                  ),
                  named: "id",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
            ],
          );

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logPostScore", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logPostScore(
            score: anyNamed("score"),
            level: anyNamed("level"),
            character: anyNamed("character"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logPostScore(
            score: 1,
            level: 2,
            character: "TEST_CHARACTER",
          );

          verify(
            mockAnalyticsClient.logPostScore(
              score: argThat(
                isA<int>().having(
                  (final int score) => score,
                  "score",
                  equals(1),
                ),
                named: "score",
              ),
              level: argThat(
                isA<int?>().having(
                  (final int? level) => level,
                  "level",
                  equals(2),
                ),
                named: "level",
              ),
              character: argThat(
                isA<String?>().having(
                  (final String? character) => character,
                  "character",
                  equals("TEST_CHARACTER"),
                ),
                named: "character",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logPostScore(
            score: anyNamed("score"),
            level: anyNamed("level"),
            character: anyNamed("character"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logPostScore(
            score: 1,
            level: 2,
            character: "TEST_CHARACTER",
          );

          verify(
            mockAnalyticsClient.logPostScore(
              score: argThat(
                isA<int>().having(
                  (final int score) => score,
                  "score",
                  equals(1),
                ),
                named: "score",
              ),
              level: argThat(
                isA<int?>().having(
                  (final int? level) => level,
                  "level",
                  equals(2),
                ),
                named: "level",
              ),
              character: argThat(
                isA<String?>().having(
                  (final String? character) => character,
                  "character",
                  equals("TEST_CHARACTER"),
                ),
                named: "character",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logPurchase", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logPurchase(
            currency: anyNamed("currency"),
            coupon: anyNamed("coupon"),
            value: anyNamed("value"),
            items: anyNamed("items"),
            tax: anyNamed("tax"),
            shipping: anyNamed("shipping"),
            transactionId: anyNamed("transactionId"),
            affiliation: anyNamed("affiliation"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logPurchase(
            currency: "TEST_CURRENCY",
            coupon: "TEST_COUPON",
            value: 0,
            items: <AnalyticsEventItem>[],
            tax: 1,
            shipping: 2,
            transactionId: "TEST_TRANSACTION_ID",
            affiliation: "TEST_AFFILIATION",
          );

          verify(
            mockAnalyticsClient.logPurchase(
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              coupon: argThat(
                isA<String?>().having(
                  (final String? coupon) => coupon,
                  "coupon",
                  equals("TEST_COUPON"),
                ),
                named: "coupon",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "items",
              ),
              tax: argThat(
                isA<double?>().having(
                  (final double? tax) => tax,
                  "tax",
                  equals(1.0),
                ),
                named: "tax",
              ),
              shipping: argThat(
                isA<double?>().having(
                  (final double? shipping) => shipping,
                  "shipping",
                  equals(2.0),
                ),
                named: "shipping",
              ),
              transactionId: argThat(
                isA<String?>().having(
                  (final String? transactionId) => transactionId,
                  "transactionId",
                  equals("TEST_TRANSACTION_ID"),
                ),
                named: "transactionId",
              ),
              affiliation: argThat(
                isA<String?>().having(
                  (final String? affiliation) => affiliation,
                  "affiliation",
                  equals("TEST_AFFILIATION"),
                ),
                named: "affiliation",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logPurchase(
            currency: anyNamed("currency"),
            coupon: anyNamed("coupon"),
            value: anyNamed("value"),
            items: anyNamed("items"),
            tax: anyNamed("tax"),
            shipping: anyNamed("shipping"),
            transactionId: anyNamed("transactionId"),
            affiliation: anyNamed("affiliation"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logPurchase(
            currency: "TEST_CURRENCY",
            coupon: "TEST_COUPON",
            value: 0,
            items: <AnalyticsEventItem>[],
            tax: 1,
            shipping: 2,
            transactionId: "TEST_TRANSACTION_ID",
            affiliation: "TEST_AFFILIATION",
          );

          verify(
            mockAnalyticsClient.logPurchase(
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              coupon: argThat(
                isA<String?>().having(
                  (final String? coupon) => coupon,
                  "coupon",
                  equals("TEST_COUPON"),
                ),
                named: "coupon",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "items",
              ),
              tax: argThat(
                isA<double?>().having(
                  (final double? tax) => tax,
                  "tax",
                  equals(1.0),
                ),
                named: "tax",
              ),
              shipping: argThat(
                isA<double?>().having(
                  (final double? shipping) => shipping,
                  "shipping",
                  equals(2.0),
                ),
                named: "shipping",
              ),
              transactionId: argThat(
                isA<String?>().having(
                  (final String? transactionId) => transactionId,
                  "transactionId",
                  equals("TEST_TRANSACTION_ID"),
                ),
                named: "transactionId",
              ),
              affiliation: argThat(
                isA<String?>().having(
                  (final String? affiliation) => affiliation,
                  "affiliation",
                  equals("TEST_AFFILIATION"),
                ),
                named: "affiliation",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logRefund", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logRefund(
            currency: anyNamed("currency"),
            coupon: anyNamed("coupon"),
            value: anyNamed("value"),
            tax: anyNamed("tax"),
            shipping: anyNamed("shipping"),
            transactionId: anyNamed("transactionId"),
            affiliation: anyNamed("affiliation"),
            items: anyNamed("items"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logRefund(
            currency: "TEST_CURRENCY",
            coupon: "TEST_COUPON",
            value: 0,
            tax: 1,
            shipping: 2,
            transactionId: "TEST_TRANSACTION_ID",
            affiliation: "TEST_AFFILIATION",
            items: <AnalyticsEventItem>[],
          );

          verify(
            mockAnalyticsClient.logRefund(
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              coupon: argThat(
                isA<String?>().having(
                  (final String? coupon) => coupon,
                  "coupon",
                  equals("TEST_COUPON"),
                ),
                named: "coupon",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              tax: argThat(
                isA<double?>().having(
                  (final double? tax) => tax,
                  "tax",
                  equals(1.0),
                ),
                named: "tax",
              ),
              shipping: argThat(
                isA<double?>().having(
                  (final double? shipping) => shipping,
                  "shipping",
                  equals(2.0),
                ),
                named: "shipping",
              ),
              transactionId: argThat(
                isA<String?>().having(
                  (final String? transactionId) => transactionId,
                  "transactionId",
                  equals("TEST_TRANSACTION_ID"),
                ),
                named: "transactionId",
              ),
              affiliation: argThat(
                isA<String?>().having(
                  (final String? affiliation) => affiliation,
                  "affiliation",
                  equals("TEST_AFFILIATION"),
                ),
                named: "affiliation",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "items",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logRefund(
            currency: anyNamed("currency"),
            coupon: anyNamed("coupon"),
            value: anyNamed("value"),
            tax: anyNamed("tax"),
            shipping: anyNamed("shipping"),
            transactionId: anyNamed("transactionId"),
            affiliation: anyNamed("affiliation"),
            items: anyNamed("items"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logRefund(
            currency: "TEST_CURRENCY",
            coupon: "TEST_COUPON",
            value: 0,
            tax: 1,
            shipping: 2,
            transactionId: "TEST_TRANSACTION_ID",
            affiliation: "TEST_AFFILIATION",
            items: <AnalyticsEventItem>[],
          );

          verify(
            mockAnalyticsClient.logRefund(
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              coupon: argThat(
                isA<String?>().having(
                  (final String? coupon) => coupon,
                  "coupon",
                  equals("TEST_COUPON"),
                ),
                named: "coupon",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              tax: argThat(
                isA<double?>().having(
                  (final double? tax) => tax,
                  "tax",
                  equals(1.0),
                ),
                named: "tax",
              ),
              shipping: argThat(
                isA<double?>().having(
                  (final double? shipping) => shipping,
                  "shipping",
                  equals(2.0),
                ),
                named: "shipping",
              ),
              transactionId: argThat(
                isA<String?>().having(
                  (final String? transactionId) => transactionId,
                  "transactionId",
                  equals("TEST_TRANSACTION_ID"),
                ),
                named: "transactionId",
              ),
              affiliation: argThat(
                isA<String?>().having(
                  (final String? affiliation) => affiliation,
                  "affiliation",
                  equals("TEST_AFFILIATION"),
                ),
                named: "affiliation",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "items",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logRemoveFromCart", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logRemoveFromCart(
            currency: anyNamed("currency"),
            value: anyNamed("value"),
            items: anyNamed("items"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logRemoveFromCart(
            currency: "TEST_CURRENCY",
            value: 0,
            items: <AnalyticsEventItem>[],
          );

          verify(
            mockAnalyticsClient.logRemoveFromCart(
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "items",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logRemoveFromCart(
            currency: anyNamed("currency"),
            value: anyNamed("value"),
            items: anyNamed("items"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logRemoveFromCart(
            currency: "TEST_CURRENCY",
            value: 0,
            items: <AnalyticsEventItem>[],
          );

          verify(
            mockAnalyticsClient.logRemoveFromCart(
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(0.0),
                ),
                named: "value",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "items",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logScreenView", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logScreenView(
            screenClass: anyNamed("screenClass"),
            screenName: anyNamed("screenName"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
        when(
          mockAnalyticsClient.setCurrentScreen(
            screenName: anyNamed("screenName"),
            screenClassOverride: anyNamed("screenClassOverride"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logScreenView(
            screenName: "TEST_SCREEN_NAME",
            screenClass: "TEST_SCREEN_CLASS",
          );

          verifyInOrder(
            <Object>[
              mockAnalyticsClient.logScreenView(
                screenClass: argThat(
                  isA<String?>().having(
                    (final String? screenClass) => screenClass,
                    "screenClass",
                    equals("TEST_SCREEN_CLASS"),
                  ),
                  named: "screenClass",
                ),
                screenName: argThat(
                  isA<String?>().having(
                    (final String? screenName) => screenName,
                    "screenName",
                    equals("TEST_SCREEN_NAME"),
                  ),
                  named: "screenName",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
              mockAnalyticsClient.setCurrentScreen(
                screenName: argThat(
                  isA<String?>().having(
                    (final String? screenName) => screenName,
                    "screenName",
                    equals("TEST_SCREEN_NAME"),
                  ),
                  named: "screenName",
                ),
                screenClassOverride: argThat(
                  isA<String?>().having(
                    (final String? screenClassOverride) => screenClassOverride,
                    "screenClassOverride",
                    equals("TEST_SCREEN_CLASS"),
                  ),
                  named: "screenClassOverride",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
            ],
          );
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed to log screen view", () async {
        when(
          mockAnalyticsClient.logScreenView(
            screenClass: anyNamed("screenClass"),
            screenName: anyNamed("screenName"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED LOG SCREEN VIEW EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logScreenView(
            screenName: "TEST_SCREEN_NAME",
            screenClass: "TEST_SCREEN_CLASS",
          );

          verifyInOrder(
            <Object>[
              mockAnalyticsClient.logScreenView(
                screenClass: argThat(
                  isA<String?>().having(
                    (final String? screenClass) => screenClass,
                    "screenClass",
                    equals("TEST_SCREEN_CLASS"),
                  ),
                  named: "screenClass",
                ),
                screenName: argThat(
                  isA<String?>().having(
                    (final String? screenName) => screenName,
                    "screenName",
                    equals("TEST_SCREEN_NAME"),
                  ),
                  named: "screenName",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
              mockAnalyticsClient.setCurrentScreen(
                screenName: argThat(
                  isA<String?>().having(
                    (final String? screenName) => screenName,
                    "screenName",
                    equals("TEST_SCREEN_NAME"),
                  ),
                  named: "screenName",
                ),
                screenClassOverride: argThat(
                  isA<String?>().having(
                    (final String? screenClassOverride) => screenClassOverride,
                    "screenClassOverride",
                    equals("TEST_SCREEN_CLASS"),
                  ),
                  named: "screenClassOverride",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
            ],
          );

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed to set current screen", () async {
        when(
          mockAnalyticsClient.setCurrentScreen(
            screenName: anyNamed("screenName"),
            screenClassOverride: anyNamed("screenClassOverride"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED SET CURRENT SCREEN EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logScreenView(
            screenName: "TEST_SCREEN_NAME",
            screenClass: "TEST_SCREEN_CLASS",
          );

          verifyInOrder(
            <Object>[
              mockAnalyticsClient.logScreenView(
                screenClass: argThat(
                  isA<String?>().having(
                    (final String? screenClass) => screenClass,
                    "screenClass",
                    equals("TEST_SCREEN_CLASS"),
                  ),
                  named: "screenClass",
                ),
                screenName: argThat(
                  isA<String?>().having(
                    (final String? screenName) => screenName,
                    "screenName",
                    equals("TEST_SCREEN_NAME"),
                  ),
                  named: "screenName",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
              mockAnalyticsClient.setCurrentScreen(
                screenName: argThat(
                  isA<String?>().having(
                    (final String? screenName) => screenName,
                    "screenName",
                    equals("TEST_SCREEN_NAME"),
                  ),
                  named: "screenName",
                ),
                screenClassOverride: argThat(
                  isA<String?>().having(
                    (final String? screenClassOverride) => screenClassOverride,
                    "screenClassOverride",
                    equals("TEST_SCREEN_CLASS"),
                  ),
                  named: "screenClassOverride",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
            ],
          );
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logSearch", skip: true, () {
      final DateTime startDate = DateTime.now();
      final DateTime endDate = DateTime.now().add(const Duration(days: 1));

      setUp(() {
        when(
          mockAnalyticsClient.logSearch(
            searchTerm: anyNamed("searchTerm"),
            numberOfNights: anyNamed("numberOfNights"),
            numberOfRooms: anyNamed("numberOfRooms"),
            numberOfPassengers: anyNamed("numberOfPassengers"),
            origin: anyNamed("origin"),
            destination: anyNamed("destination"),
            startDate: anyNamed("startDate"),
            endDate: anyNamed("endDate"),
            travelClass: anyNamed("travelClass"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logSearch(
            searchTerm: "TEST_SEARCH_TERM",
            numberOfNights: 1,
            numberOfRooms: 2,
            numberOfPassengers: 3,
            origin: "TEST_ORIGIN",
            destination: "TEST_DESTINATION",
            startDate: startDate,
            endDate: endDate,
            travelClass: "TEST_TRAVEL_CLASS",
          );

          verify(
            mockAnalyticsClient.logSearch(
              searchTerm: argThat(
                isA<String>().having(
                  (final String searchTerm) => searchTerm,
                  "searchTerm",
                  equals("TEST_SEARCH_TERM"),
                ),
                named: "searchTerm",
              ),
              numberOfNights: argThat(
                isA<int?>().having(
                  (final int? numberOfNights) => numberOfNights,
                  "numberOfNights",
                  equals(1),
                ),
                named: "numberOfNights",
              ),
              numberOfRooms: argThat(
                isA<int?>().having(
                  (final int? numberOfRooms) => numberOfRooms,
                  "numberOfRooms",
                  equals(2),
                ),
                named: "numberOfRooms",
              ),
              numberOfPassengers: argThat(
                isA<int?>().having(
                  (final int? numberOfPassengers) => numberOfPassengers,
                  "numberOfPassengers",
                  equals(3),
                ),
                named: "numberOfPassengers",
              ),
              origin: argThat(
                isA<String?>().having(
                  (final String? origin) => origin,
                  "origin",
                  equals("TEST_ORIGIN"),
                ),
                named: "origin",
              ),
              destination: argThat(
                isA<String?>().having(
                  (final String? destination) => destination,
                  "destination",
                  equals("TEST_DESTINATION"),
                ),
                named: "destination",
              ),
              startDate: argThat(
                isA<String?>().having(
                  (final String? startDate) => startDate,
                  "startDate",
                  equals(startDate.toLocal().toIso8601String()),
                ),
                named: "startDate",
              ),
              endDate: argThat(
                isA<String?>().having(
                  (final String? endDate) => endDate,
                  "endDate",
                  equals(endDate.toLocal().toIso8601String()),
                ),
                named: "endDate",
              ),
              travelClass: argThat(
                isA<String?>().having(
                  (final String? travelClass) => travelClass,
                  "travelClass",
                  equals("TEST_TRAVEL_CLASS"),
                ),
                named: "startDate",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logSearch(
            searchTerm: anyNamed("searchTerm"),
            numberOfNights: anyNamed("numberOfNights"),
            numberOfRooms: anyNamed("numberOfRooms"),
            numberOfPassengers: anyNamed("numberOfPassengers"),
            origin: anyNamed("origin"),
            destination: anyNamed("destination"),
            startDate: anyNamed("startDate"),
            endDate: anyNamed("endDate"),
            travelClass: anyNamed("travelClass"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logSearch(
            searchTerm: "TEST_SEARCH_TERM",
            numberOfNights: 1,
            numberOfRooms: 2,
            numberOfPassengers: 3,
            origin: "TEST_ORIGIN",
            destination: "TEST_DESTINATION",
            startDate: startDate,
            endDate: endDate,
            travelClass: "TEST_TRAVEL_CLASS",
          );

          verify(
            mockAnalyticsClient.logSearch(
              searchTerm: argThat(
                isA<String>().having(
                  (final String searchTerm) => searchTerm,
                  "searchTerm",
                  equals("TEST_SEARCH_TERM"),
                ),
                named: "searchTerm",
              ),
              numberOfNights: argThat(
                isA<int?>().having(
                  (final int? numberOfNights) => numberOfNights,
                  "numberOfNights",
                  equals(1),
                ),
                named: "numberOfNights",
              ),
              numberOfRooms: argThat(
                isA<int?>().having(
                  (final int? numberOfRooms) => numberOfRooms,
                  "numberOfRooms",
                  equals(2),
                ),
                named: "numberOfRooms",
              ),
              numberOfPassengers: argThat(
                isA<int?>().having(
                  (final int? numberOfPassengers) => numberOfPassengers,
                  "numberOfPassengers",
                  equals(3),
                ),
                named: "numberOfPassengers",
              ),
              origin: argThat(
                isA<String?>().having(
                  (final String? origin) => origin,
                  "origin",
                  equals("TEST_ORIGIN"),
                ),
                named: "origin",
              ),
              destination: argThat(
                isA<String?>().having(
                  (final String? destination) => destination,
                  "destination",
                  equals("TEST_DESTINATION"),
                ),
                named: "destination",
              ),
              startDate: argThat(
                isA<String?>().having(
                  (final String? startDate) => startDate,
                  "startDate",
                  equals(startDate.toLocal().toIso8601String()),
                ),
                named: "startDate",
              ),
              endDate: argThat(
                isA<String?>().having(
                  (final String? endDate) => endDate,
                  "endDate",
                  equals(endDate.toLocal().toIso8601String()),
                ),
                named: "endDate",
              ),
              travelClass: argThat(
                isA<String?>().having(
                  (final String? travelClass) => travelClass,
                  "travelClass",
                  equals("TEST_TRAVEL_CLASS"),
                ),
                named: "startDate",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logSelectContent", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logSelectContent(
            contentType: anyNamed("contentType"),
            itemId: anyNamed("itemId"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logSelectContent(
            contentType: "TEST_CONTENT_TYPE",
            itemId: "TEST_ITEM_ID",
          );

          verify(
            mockAnalyticsClient.logSelectContent(
              contentType: argThat(
                isA<String>().having(
                  (final String contentType) => contentType,
                  "contentType",
                  equals("TEST_CONTENT_TYPE"),
                ),
                named: "contentType",
              ),
              itemId: argThat(
                isA<String>().having(
                  (final String itemId) => itemId,
                  "itemId",
                  equals("TEST_ITEM_ID"),
                ),
                named: "itemId",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logSelectContent(
            contentType: anyNamed("contentType"),
            itemId: anyNamed("itemId"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logSelectContent(
            contentType: "TEST_CONTENT_TYPE",
            itemId: "TEST_ITEM_ID",
          );

          verify(
            mockAnalyticsClient.logSelectContent(
              contentType: argThat(
                isA<String>().having(
                  (final String contentType) => contentType,
                  "contentType",
                  equals("TEST_CONTENT_TYPE"),
                ),
                named: "contentType",
              ),
              itemId: argThat(
                isA<String>().having(
                  (final String itemId) => itemId,
                  "itemId",
                  equals("TEST_ITEM_ID"),
                ),
                named: "itemId",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logSelectItem", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logSelectItem(
            itemListId: anyNamed("itemListId"),
            itemListName: anyNamed("itemListName"),
            items: anyNamed("items"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logSelectItem(
            itemListId: "TEST_ITEM_LIST_ID",
            itemListName: "TEST_ITEM_LIST_NAME",
            items: <AnalyticsEventItem>[],
          );

          verify(
            mockAnalyticsClient.logSelectItem(
              itemListId: argThat(
                isA<String?>().having(
                  (final String? itemListId) => itemListId,
                  "itemListId",
                  equals("TEST_ITEM_LIST_ID"),
                ),
                named: "itemListId",
              ),
              itemListName: argThat(
                isA<String?>().having(
                  (final String? itemListName) => itemListName,
                  "itemListName",
                  equals("TEST_ITEM_LIST_NAME"),
                ),
                named: "itemListName",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "items",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logSelectItem(
            itemListId: anyNamed("itemListId"),
            itemListName: anyNamed("itemListName"),
            items: anyNamed("items"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logSelectItem(
            itemListId: "TEST_ITEM_LIST_ID",
            itemListName: "TEST_ITEM_LIST_NAME",
            items: <AnalyticsEventItem>[],
          );

          verify(
            mockAnalyticsClient.logSelectItem(
              itemListId: argThat(
                isA<String?>().having(
                  (final String? itemListId) => itemListId,
                  "itemListId",
                  equals("TEST_ITEM_LIST_ID"),
                ),
                named: "itemListId",
              ),
              itemListName: argThat(
                isA<String?>().having(
                  (final String? itemListName) => itemListName,
                  "itemListName",
                  equals("TEST_ITEM_LIST_NAME"),
                ),
                named: "itemListName",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "items",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logSelectPromotion", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logSelectPromotion(
            creativeName: anyNamed("creativeName"),
            creativeSlot: anyNamed("creativeSlot"),
            items: anyNamed("items"),
            locationId: anyNamed("locationId"),
            promotionId: anyNamed("promotionId"),
            promotionName: anyNamed("promotionName"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logSelectPromotion(
            creativeName: "TEST_CREATIVE_NAME",
            creativeSlot: "TEST_CREATIVE_SLOT",
            items: <AnalyticsEventItem>[],
            locationId: "TEST_LOCATION_ID",
            promotionId: "TEST_PROMOTION_ID",
            promotionName: "TEST_PROMOTION_NAME",
          );

          verify(
            mockAnalyticsClient.logSelectPromotion(
              creativeName: argThat(
                isA<String?>().having(
                  (final String? creativeName) => creativeName,
                  "creativeName",
                  equals("TEST_CREATIVE_NAME"),
                ),
                named: "creativeName",
              ),
              creativeSlot: argThat(
                isA<String?>().having(
                  (final String? creativeSlot) => creativeSlot,
                  "creativeSlot",
                  equals("TEST_CREATIVE_SLOT"),
                ),
                named: "creativeSlot",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "items",
              ),
              locationId: argThat(
                isA<String?>().having(
                  (final String? locationId) => locationId,
                  "locationId",
                  equals("TEST_LOCATION_ID"),
                ),
                named: "locationId",
              ),
              promotionId: argThat(
                isA<String?>().having(
                  (final String? promotionId) => promotionId,
                  "promotionId",
                  equals("TEST_PROMOTION_ID"),
                ),
                named: "promotionId",
              ),
              promotionName: argThat(
                isA<String?>().having(
                  (final String? promotionName) => promotionName,
                  "promotionName",
                  equals("TEST_PROMOTION_NAME"),
                ),
                named: "promotionName",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logSelectPromotion(
            creativeName: anyNamed("creativeName"),
            creativeSlot: anyNamed("creativeSlot"),
            items: anyNamed("items"),
            locationId: anyNamed("locationId"),
            promotionId: anyNamed("promotionId"),
            promotionName: anyNamed("promotionName"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logSelectPromotion(
            creativeName: "TEST_CREATIVE_NAME",
            creativeSlot: "TEST_CREATIVE_SLOT",
            items: <AnalyticsEventItem>[],
            locationId: "TEST_LOCATION_ID",
            promotionId: "TEST_PROMOTION_ID",
            promotionName: "TEST_PROMOTION_NAME",
          );

          verify(
            mockAnalyticsClient.logSelectPromotion(
              creativeName: argThat(
                isA<String?>().having(
                  (final String? creativeName) => creativeName,
                  "creativeName",
                  equals("TEST_CREATIVE_NAME"),
                ),
                named: "creativeName",
              ),
              creativeSlot: argThat(
                isA<String?>().having(
                  (final String? creativeSlot) => creativeSlot,
                  "creativeSlot",
                  equals("TEST_CREATIVE_SLOT"),
                ),
                named: "creativeSlot",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "items",
              ),
              locationId: argThat(
                isA<String?>().having(
                  (final String? locationId) => locationId,
                  "locationId",
                  equals("TEST_LOCATION_ID"),
                ),
                named: "locationId",
              ),
              promotionId: argThat(
                isA<String?>().having(
                  (final String? promotionId) => promotionId,
                  "promotionId",
                  equals("TEST_PROMOTION_ID"),
                ),
                named: "promotionId",
              ),
              promotionName: argThat(
                isA<String?>().having(
                  (final String? promotionName) => promotionName,
                  "promotionName",
                  equals("TEST_PROMOTION_NAME"),
                ),
                named: "promotionName",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logSetCheckoutOption", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logSetCheckoutOption(
            checkoutStep: anyNamed("checkoutStep"),
            checkoutOption: anyNamed("checkoutOption"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logSetCheckoutOption(
            checkoutStep: 1,
            checkoutOption: "TEST_CHECKOUT_OPTION",
          );

          verify(
            mockAnalyticsClient.logSetCheckoutOption(
              checkoutStep: argThat(
                isA<int?>().having(
                  (final int? checkoutStep) => checkoutStep,
                  "checkoutStep",
                  equals(1),
                ),
                named: "checkoutStep",
              ),
              checkoutOption: argThat(
                isA<String?>().having(
                  (final String? checkoutOption) => checkoutOption,
                  "checkoutOption",
                  equals("TEST_CHECKOUT_OPTION"),
                ),
                named: "checkoutOption",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logSetCheckoutOption(
            checkoutStep: anyNamed("checkoutStep"),
            checkoutOption: anyNamed("checkoutOption"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logSetCheckoutOption(
            checkoutStep: 1,
            checkoutOption: "TEST_CHECKOUT_OPTION",
          );

          verify(
            mockAnalyticsClient.logSetCheckoutOption(
              checkoutStep: argThat(
                isA<int?>().having(
                  (final int? checkoutStep) => checkoutStep,
                  "checkoutStep",
                  equals(1),
                ),
                named: "checkoutStep",
              ),
              checkoutOption: argThat(
                isA<String?>().having(
                  (final String? checkoutOption) => checkoutOption,
                  "checkoutOption",
                  equals("TEST_CHECKOUT_OPTION"),
                ),
                named: "checkoutOption",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logShare", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logShare(
            contentType: anyNamed("contentType"),
            itemId: anyNamed("itemId"),
            method: anyNamed("method"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logShare(
            contentType: "TEST_CONTENT_TYPE",
            itemId: "TEST_ITEM_ID",
            method: "TEST_METHOD",
          );

          verify(
            mockAnalyticsClient.logShare(
              contentType: argThat(
                isA<String>().having(
                  (final String contentType) => contentType,
                  "contentType",
                  equals("TEST_CONTENT_TYPE"),
                ),
                named: "contentType",
              ),
              itemId: argThat(
                isA<String>().having(
                  (final String itemId) => itemId,
                  "itemId",
                  equals("TEST_ITEM_ID"),
                ),
                named: "itemId",
              ),
              method: argThat(
                isA<String>().having(
                  (final String method) => method,
                  "method",
                  equals("TEST_METHOD"),
                ),
                named: "method",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logShare(
            contentType: anyNamed("contentType"),
            itemId: anyNamed("itemId"),
            method: anyNamed("method"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logShare(
            contentType: "TEST_CONTENT_TYPE",
            itemId: "TEST_ITEM_ID",
            method: "TEST_METHOD",
          );

          verify(
            mockAnalyticsClient.logShare(
              contentType: argThat(
                isA<String>().having(
                  (final String contentType) => contentType,
                  "contentType",
                  equals("TEST_CONTENT_TYPE"),
                ),
                named: "contentType",
              ),
              itemId: argThat(
                isA<String>().having(
                  (final String itemId) => itemId,
                  "itemId",
                  equals("TEST_ITEM_ID"),
                ),
                named: "itemId",
              ),
              method: argThat(
                isA<String>().having(
                  (final String method) => method,
                  "method",
                  equals("TEST_METHOD"),
                ),
                named: "method",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logSignUp", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logSignUp(
            signUpMethod: anyNamed("signUpMethod"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
        when(
          mockAnalyticsClient.setUserId(
            id: anyNamed("id"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
        when(
          mockCrashlyticsService.setUserIdentifier(any),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logSignUp(
            userId: "TEST_USER_ID",
            signUpMethod: "TEST_METHOD",
          );

          verifyInOrder(
            <Object>[
              mockAnalyticsClient.logSignUp(
                signUpMethod: argThat(
                  isA<String?>().having(
                    (final String? signUpMethod) => signUpMethod,
                    "signUpMethod",
                    equals("TEST_METHOD"),
                  ),
                  named: "signUpMethod",
                ),
              ),
              mockAnalyticsClient.setUserId(
                id: argThat(
                  isA<String?>().having(
                    (final String? id) => id,
                    "id",
                    equals("TEST_USER_ID"),
                  ),
                  named: "id",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
            ],
          );

          verify(
            mockCrashlyticsService.setUserIdentifier(
              argThat(
                isA<String>().having(
                  (final String identifier) => identifier,
                  "identifier",
                  equals("TEST_USER_ID"),
                ),
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed to log signing up", () async {
        when(
          mockAnalyticsClient.logSignUp(
            signUpMethod: anyNamed("signUpMethod"),
          ),
        ).thenThrow(
          Exception("MOCKED LOG SIGN UP EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logSignUp(
            userId: "TEST_USER_ID",
            signUpMethod: "TEST_METHOD",
          );

          verifyInOrder(
            <Object>[
              mockAnalyticsClient.logSignUp(
                signUpMethod: argThat(
                  isA<String?>().having(
                    (final String? signUpMethod) => signUpMethod,
                    "signUpMethod",
                    equals("TEST_METHOD"),
                  ),
                  named: "signUpMethod",
                ),
              ),
              mockAnalyticsClient.setUserId(
                id: argThat(
                  isA<String?>().having(
                    (final String? id) => id,
                    "id",
                    equals("TEST_USER_ID"),
                  ),
                  named: "id",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
            ],
          );

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);

          verifyNever(
            mockCrashlyticsService.setUserIdentifier(any),
          );
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed to set user id", () async {
        when(
          mockAnalyticsClient.setUserId(
            id: anyNamed("id"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED SET USER ID EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logSignUp(
            userId: "TEST_USER_ID",
            signUpMethod: "TEST_METHOD",
          );

          verifyInOrder(
            <Object>[
              mockAnalyticsClient.logSignUp(
                signUpMethod: argThat(
                  isA<String?>().having(
                    (final String? signUpMethod) => signUpMethod,
                    "signUpMethod",
                    equals("TEST_METHOD"),
                  ),
                  named: "signUpMethod",
                ),
              ),
              mockAnalyticsClient.setUserId(
                id: argThat(
                  isA<String?>().having(
                    (final String? id) => id,
                    "id",
                    equals("TEST_USER_ID"),
                  ),
                  named: "id",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
            ],
          );

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);

          verifyNever(
            mockCrashlyticsService.setUserIdentifier(any),
          );
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed to set user id with crashlytics", () async {
        when(
          mockCrashlyticsService.setUserIdentifier(any),
        ).thenThrow(
          Exception("MOCKED SET USER IDENTIFIER EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logSignUp(
            userId: "TEST_USER_ID",
            signUpMethod: "TEST_METHOD",
          );

          verifyInOrder(
            <Object>[
              mockAnalyticsClient.logSignUp(
                signUpMethod: argThat(
                  isA<String?>().having(
                    (final String? signUpMethod) => signUpMethod,
                    "signUpMethod",
                    equals("TEST_METHOD"),
                  ),
                  named: "signUpMethod",
                ),
              ),
              mockAnalyticsClient.setUserId(
                id: argThat(
                  isA<String?>().having(
                    (final String? id) => id,
                    "id",
                    equals("TEST_USER_ID"),
                  ),
                  named: "id",
                ),
                callOptions: argThat(
                  isA<AnalyticsCallOptions?>().having(
                    (final AnalyticsCallOptions? callOptions) => callOptions,
                    "callOptions",
                    isNull,
                  ),
                  named: "callOptions",
                ),
              ),
            ],
          );

          verify(
            mockCrashlyticsService.setUserIdentifier(
              argThat(
                isA<String>().having(
                  (final String identifier) => identifier,
                  "identifier",
                  equals("TEST_USER_ID"),
                ),
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logSpendVirtualCurrency", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logSpendVirtualCurrency(
            itemName: anyNamed("itemName"),
            virtualCurrencyName: anyNamed("virtualCurrencyName"),
            value: anyNamed("value"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logSpendVirtualCurrency(
            itemName: "TEST_ITEM_NAME",
            virtualCurrencyName: "TEST_VIRTUAL_CURRENCY_NAME",
            value: 1,
          );

          verify(
            mockAnalyticsClient.logSpendVirtualCurrency(
              itemName: argThat(
                isA<String>().having(
                  (final String itemName) => itemName,
                  "itemName",
                  equals("TEST_ITEM_NAME"),
                ),
                named: "itemName",
              ),
              virtualCurrencyName: argThat(
                isA<String>().having(
                  (final String virtualCurrencyName) => virtualCurrencyName,
                  "virtualCurrencyName",
                  equals("TEST_VIRTUAL_CURRENCY_NAME"),
                ),
                named: "virtualCurrencyName",
              ),
              value: argThat(
                isA<num>().having(
                  (final num value) => value,
                  "value",
                  equals(1),
                ),
                named: "value",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logSpendVirtualCurrency(
            itemName: anyNamed("itemName"),
            virtualCurrencyName: anyNamed("virtualCurrencyName"),
            value: anyNamed("value"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logSpendVirtualCurrency(
            itemName: "TEST_ITEM_NAME",
            virtualCurrencyName: "TEST_VIRTUAL_CURRENCY_NAME",
            value: 1,
          );

          verify(
            mockAnalyticsClient.logSpendVirtualCurrency(
              itemName: argThat(
                isA<String>().having(
                  (final String itemName) => itemName,
                  "itemName",
                  equals("TEST_ITEM_NAME"),
                ),
                named: "itemName",
              ),
              virtualCurrencyName: argThat(
                isA<String>().having(
                  (final String virtualCurrencyName) => virtualCurrencyName,
                  "virtualCurrencyName",
                  equals("TEST_VIRTUAL_CURRENCY_NAME"),
                ),
                named: "virtualCurrencyName",
              ),
              value: argThat(
                isA<num>().having(
                  (final num value) => value,
                  "value",
                  equals(1),
                ),
                named: "value",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logTutorialBegin", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logTutorialBegin(),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logTutorialBegin();

          verify(
            mockAnalyticsClient.logTutorialBegin(),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logTutorialBegin(),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logTutorialBegin();

          verify(
            mockAnalyticsClient.logTutorialBegin(),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logTutorialComplete", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logTutorialComplete(),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logTutorialComplete();

          verify(
            mockAnalyticsClient.logTutorialComplete(),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logTutorialComplete(),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logTutorialComplete();

          verify(
            mockAnalyticsClient.logTutorialComplete(),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logUnlockAchievement", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logUnlockAchievement(
            id: anyNamed("id"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logUnlockAchievement(
            id: "TEST_ID",
          );

          verify(
            mockAnalyticsClient.logUnlockAchievement(
              id: argThat(
                isA<String>().having(
                  (final String id) => id,
                  "id",
                  equals("TEST_ID"),
                ),
                named: "id",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logUnlockAchievement(
            id: anyNamed("id"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logUnlockAchievement(
            id: "TEST_ID",
          );

          verify(
            mockAnalyticsClient.logUnlockAchievement(
              id: argThat(
                isA<String>().having(
                  (final String id) => id,
                  "id",
                  equals("TEST_ID"),
                ),
                named: "id",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logViewItem", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logViewItem(
            currency: anyNamed("currency"),
            value: anyNamed("value"),
            items: anyNamed("items"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logViewItem(
            currency: "TEST_CURRENCY",
            value: 1,
            items: <AnalyticsEventItem>[],
          );

          verify(
            mockAnalyticsClient.logViewItem(
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(1.0),
                ),
                named: "value",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "items",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logViewItem(
            currency: anyNamed("currency"),
            value: anyNamed("value"),
            items: anyNamed("items"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logViewItem(
            currency: "TEST_CURRENCY",
            value: 1,
            items: <AnalyticsEventItem>[],
          );

          verify(
            mockAnalyticsClient.logViewItem(
              currency: argThat(
                isA<String?>().having(
                  (final String? currency) => currency,
                  "currency",
                  equals("TEST_CURRENCY"),
                ),
                named: "currency",
              ),
              value: argThat(
                isA<double?>().having(
                  (final double? value) => value,
                  "value",
                  equals(1.0),
                ),
                named: "value",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "items",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logViewItemList", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logViewItemList(
            items: anyNamed("items"),
            itemListId: anyNamed("itemListId"),
            itemListName: anyNamed("itemListName"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logViewItemList(
            items: <AnalyticsEventItem>[],
            itemListId: "TEST_ITEM_LIST_ID",
            itemListName: "TEST_ITEM_LIST_NAME",
          );

          verify(
            mockAnalyticsClient.logViewItemList(
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "items",
              ),
              itemListId: argThat(
                isA<String?>().having(
                  (final String? itemListId) => itemListId,
                  "itemListId",
                  equals("TEST_ITEM_LIST_ID"),
                ),
                named: "itemListId",
              ),
              itemListName: argThat(
                isA<String?>().having(
                  (final String? itemListName) => itemListName,
                  "itemListName",
                  equals("TEST_ITEM_LIST_NAME"),
                ),
                named: "itemListName",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logViewItemList(
            items: anyNamed("items"),
            itemListId: anyNamed("itemListId"),
            itemListName: anyNamed("itemListName"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logViewItemList(
            items: <AnalyticsEventItem>[],
            itemListId: "TEST_ITEM_LIST_ID",
            itemListName: "TEST_ITEM_LIST_NAME",
          );

          verify(
            mockAnalyticsClient.logViewItemList(
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "items",
              ),
              itemListId: argThat(
                isA<String?>().having(
                  (final String? itemListId) => itemListId,
                  "itemListId",
                  equals("TEST_ITEM_LIST_ID"),
                ),
                named: "itemListId",
              ),
              itemListName: argThat(
                isA<String?>().having(
                  (final String? itemListName) => itemListName,
                  "itemListName",
                  equals("TEST_ITEM_LIST_NAME"),
                ),
                named: "itemListName",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logViewPromotion", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logViewPromotion(
            creativeName: anyNamed("creativeName"),
            creativeSlot: anyNamed("creativeSlot"),
            items: anyNamed("items"),
            locationId: anyNamed("locationId"),
            promotionId: anyNamed("promotionId"),
            promotionName: anyNamed("promotionName"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logViewPromotion(
            creativeName: "TEST_CREATIVE_NAME",
            creativeSlot: "TEST_CREATIVE_SLOT",
            items: <AnalyticsEventItem>[],
            locationId: "TEST_LOCATION_ID",
            promotionId: "TEST_PROMOTION_ID",
            promotionName: "TEST_PROMOTION_NAME",
          );

          verify(
            mockAnalyticsClient.logViewPromotion(
              creativeName: argThat(
                isA<String?>().having(
                  (final String? creativeName) => creativeName,
                  "creativeName",
                  equals("TEST_CREATIVE_NAME"),
                ),
                named: "creativeName",
              ),
              creativeSlot: argThat(
                isA<String?>().having(
                  (final String? creativeSlot) => creativeSlot,
                  "creativeSlot",
                  equals("TEST_CREATIVE_SLOT"),
                ),
                named: "creativeSlot",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "items",
              ),
              locationId: argThat(
                isA<String?>().having(
                  (final String? locationId) => locationId,
                  "locationId",
                  equals("TEST_LOCATION_ID"),
                ),
                named: "locationId",
              ),
              promotionId: argThat(
                isA<String?>().having(
                  (final String? promotionId) => promotionId,
                  "promotionId",
                  equals("TEST_PROMOTION_ID"),
                ),
                named: "promotionId",
              ),
              promotionName: argThat(
                isA<String?>().having(
                  (final String? promotionName) => promotionName,
                  "promotionName",
                  equals("TEST_PROMOTION_NAME"),
                ),
                named: "promotionName",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logViewPromotion(
            creativeName: anyNamed("creativeName"),
            creativeSlot: anyNamed("creativeSlot"),
            items: anyNamed("items"),
            locationId: anyNamed("locationId"),
            promotionId: anyNamed("promotionId"),
            promotionName: anyNamed("promotionName"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logViewPromotion(
            creativeName: "TEST_CREATIVE_NAME",
            creativeSlot: "TEST_CREATIVE_SLOT",
            items: <AnalyticsEventItem>[],
            locationId: "TEST_LOCATION_ID",
            promotionId: "TEST_PROMOTION_ID",
            promotionName: "TEST_PROMOTION_NAME",
          );

          verify(
            mockAnalyticsClient.logViewPromotion(
              creativeName: argThat(
                isA<String?>().having(
                  (final String? creativeName) => creativeName,
                  "creativeName",
                  equals("TEST_CREATIVE_NAME"),
                ),
                named: "creativeName",
              ),
              creativeSlot: argThat(
                isA<String?>().having(
                  (final String? creativeSlot) => creativeSlot,
                  "creativeSlot",
                  equals("TEST_CREATIVE_SLOT"),
                ),
                named: "creativeSlot",
              ),
              items: argThat(
                isA<List<AnalyticsEventItem>?>().having(
                  (final List<AnalyticsEventItem>? items) => items,
                  "items",
                  isEmpty,
                ),
                named: "items",
              ),
              locationId: argThat(
                isA<String?>().having(
                  (final String? locationId) => locationId,
                  "locationId",
                  equals("TEST_LOCATION_ID"),
                ),
                named: "locationId",
              ),
              promotionId: argThat(
                isA<String?>().having(
                  (final String? promotionId) => promotionId,
                  "promotionId",
                  equals("TEST_PROMOTION_ID"),
                ),
                named: "promotionId",
              ),
              promotionName: argThat(
                isA<String?>().having(
                  (final String? promotionName) => promotionName,
                  "promotionName",
                  equals("TEST_PROMOTION_NAME"),
                ),
                named: "promotionName",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("logViewSearchResults", skip: true, () {
      setUp(() {
        when(
          mockAnalyticsClient.logViewSearchResults(
            searchTerm: anyNamed("searchTerm"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logViewSearchResults(
            searchTerm: "TEST_SEARCH_TERM",
          );

          verify(
            mockAnalyticsClient.logViewSearchResults(
              searchTerm: argThat(
                isA<String>().having(
                  (final String searchTerm) => searchTerm,
                  "searchTerm",
                  equals("TEST_SEARCH_TERM"),
                ),
                named: "searchTerm",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.logViewSearchResults(
            searchTerm: anyNamed("searchTerm"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.logViewSearchResults(
            searchTerm: "TEST_SEARCH_TERM",
          );

          verify(
            mockAnalyticsClient.logViewSearchResults(
              searchTerm: argThat(
                isA<String>().having(
                  (final String searchTerm) => searchTerm,
                  "searchTerm",
                  equals("TEST_SEARCH_TERM"),
                ),
                named: "searchTerm",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("setConsent", () {
      setUp(() {
        when(
          mockAnalyticsClient.setConsent(
            adStorageConsentGranted: anyNamed("adStorageConsentGranted"),
            analyticsStorageConsentGranted:
                anyNamed("analyticsStorageConsentGranted"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.setConsent(
            adStorageConsentGranted: true,
            analyticsStorageConsentGranted: true,
          );

          verify(
            mockAnalyticsClient.setConsent(
              adStorageConsentGranted: argThat(
                isA<bool?>().having(
                  (final bool? adStorageConsentGranted) =>
                      adStorageConsentGranted,
                  "adStorageConsentGranted",
                  isTrue,
                ),
                named: "adStorageConsentGranted",
              ),
              analyticsStorageConsentGranted: argThat(
                isA<bool?>().having(
                  (final bool? analyticsStorageConsentGranted) =>
                      analyticsStorageConsentGranted,
                  "analyticsStorageConsentGranted",
                  isTrue,
                ),
                named: "analyticsStorageConsentGranted",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.setConsent(
            adStorageConsentGranted: anyNamed("adStorageConsentGranted"),
            analyticsStorageConsentGranted:
                anyNamed("analyticsStorageConsentGranted"),
          ),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.setConsent(
            adStorageConsentGranted: true,
            analyticsStorageConsentGranted: true,
          );

          verify(
            mockAnalyticsClient.setConsent(
              adStorageConsentGranted: argThat(
                isA<bool?>().having(
                  (final bool? adStorageConsentGranted) =>
                      adStorageConsentGranted,
                  "adStorageConsentGranted",
                  isTrue,
                ),
                named: "adStorageConsentGranted",
              ),
              analyticsStorageConsentGranted: argThat(
                isA<bool?>().having(
                  (final bool? analyticsStorageConsentGranted) =>
                      analyticsStorageConsentGranted,
                  "analyticsStorageConsentGranted",
                  isTrue,
                ),
                named: "analyticsStorageConsentGranted",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("setDefaultEventParameters", () {
      setUp(() {
        when(
          mockAnalyticsClient.setDefaultEventParameters(any),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.setDefaultEventParameters(
            <String, Object>{
              "TEST_FIELD": "TEST_VALUE",
            },
          );

          verify(
            mockAnalyticsClient.setDefaultEventParameters(
              argThat(
                isA<Map<String, Object>?>().having(
                  (final Map<String, Object>? defaultParameters) =>
                      defaultParameters,
                  "defaultParameters",
                  isNotNull,
                ),
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.setDefaultEventParameters(any),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.setDefaultEventParameters(
            <String, Object>{
              "TEST_FIELD": "TEST_VALUE",
            },
          );

          verify(
            mockAnalyticsClient.setDefaultEventParameters(
              argThat(
                isA<Map<String, Object>?>().having(
                  (final Map<String, Object>? defaultParameters) =>
                      defaultParameters,
                  "defaultParameters",
                  isNotNull,
                ),
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("setDefaultEventParameters", () {
      setUp(() {
        when(
          mockAnalyticsClient.setSessionTimeoutDuration(any),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.setSessionTimeoutDuration(
            const Duration(seconds: 1),
          );

          verify(
            mockAnalyticsClient.setSessionTimeoutDuration(
              argThat(
                isA<Duration?>().having(
                  (final Duration? timeout) => timeout,
                  "timeout",
                  isNotNull,
                ),
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.setSessionTimeoutDuration(any),
        ).thenThrow(
          Exception("MOCKED EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.setSessionTimeoutDuration(
            const Duration(seconds: 1),
          );

          verify(
            mockAnalyticsClient.setSessionTimeoutDuration(
              argThat(
                isA<Duration?>().having(
                  (final Duration? timeout) => timeout,
                  "timeout",
                  isNotNull,
                ),
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });

    group("setUserProperty", () {
      setUp(() {
        when(
          mockAnalyticsClient.setUserProperty(
            name: anyNamed("name"),
            value: anyNamed("value"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenAnswer(
          (final _) => Future<void>.value(),
        );
      });

      test("succeed", () async {
        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.setUserProperty(
            name: "TEST_NAME",
            value: "TEST_VALUE",
          );

          verify(
            mockAnalyticsClient.setUserProperty(
              name: argThat(
                isA<String?>().having(
                  (final String? name) => name,
                  "name",
                  equals("TEST_NAME"),
                ),
                named: "name",
              ),
              value: argThat(
                isA<String?>().having(
                  (final String? value) => value,
                  "value",
                  equals("TEST_VALUE"),
                ),
                named: "value",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });

      test("failed", () async {
        when(
          mockAnalyticsClient.setUserProperty(
            name: anyNamed("name"),
            value: anyNamed("value"),
            callOptions: anyNamed("callOptions"),
          ),
        ).thenThrow(
          Exception("MOCKED SET USER PROPERTY EXCEPTION"),
        );

        final AnalyticsService service =
            container.refresh(analyticsServiceProvider(mockFirebaseApp));

        try {
          service.setUserProperty(
            name: "TEST_NAME",
            value: "TEST_VALUE",
          );

          verify(
            mockAnalyticsClient.setUserProperty(
              name: argThat(
                isA<String?>().having(
                  (final String? name) => name,
                  "name",
                  equals("TEST_NAME"),
                ),
                named: "name",
              ),
              value: argThat(
                isA<String?>().having(
                  (final String? value) => value,
                  "value",
                  equals("TEST_VALUE"),
                ),
                named: "value",
              ),
              callOptions: argThat(
                isA<AnalyticsCallOptions?>().having(
                  (final AnalyticsCallOptions? callOptions) => callOptions,
                  "callOptions",
                  isNull,
                ),
                named: "callOptions",
              ),
            ),
          ).called(1);

          verify(
            mockCrashlyticsService.recordException(any, any),
          ).called(1);
        } on Exception catch (exception) {
          fail(exception.toString());
        }
      });
    });
  });
}
