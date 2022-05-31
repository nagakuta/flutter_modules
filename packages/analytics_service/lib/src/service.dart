import 'dart:async';

import 'package:crashlytics_service/crashlytics_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_service/firebase_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:logging_service/logging_service.dart';
import 'package:mockito/annotations.dart';
import 'package:riverpod/riverpod.dart';

import '/src/client.dart';

/// Analytics Service
@GenerateMocks(
  <Type>[
    AnalyticsService,
    FirebaseAnalyticsObserver,
    AnalyticsEventItem,
  ],
)
abstract class AnalyticsService {
  /// 画面遷移を検知するための observer を生成
  FirebaseAnalyticsObserver observe({
    final ScreenNameExtractor nameExtractor = defaultNameExtractor,
    final RouteFilter routeFilter = defaultRouteFilter,
    final Function(PlatformException error)? onError,
  });

  /// カスタムイベントを送信
  void logEvent({
    required final String name,
    final Map<String, Object?>? parameters,
  });

  /// アナリティクス利用の同意状態を設定
  void setConsent({
    final bool? adStorageConsentGranted,
    final bool? analyticsStorageConsentGranted,
  });

  /// 現在開いている画面情報を送信
  void logScreenView({
    required final String screenName,
    final String screenClass = "Flutter",
  });

  /// ユーザ属性を設定
  void setUserProperty({
    required final String name,
    required final String? value,
  });

  /// 支払情報の追加を送信
  void logAddPaymentInfo({
    final String? coupon,
    final String? currency,
    final String? paymentType,
    final double? value,
    final List<AnalyticsEventItem>? items,
  });

  /// 配送情報の追加を送信
  void logAddShippingInfo({
    final String? coupon,
    final String? currency,
    final double? value,
    final String? shippingTier,
    final List<AnalyticsEventItem>? items,
  });

  /// カートへの商品追加を送信
  void logAddToCart({
    final List<AnalyticsEventItem>? items,
    final double? value,
    final String? currency,
  });

  /// 欲しい物リストへの商品追加を送信
  void logAddToWishlist({
    final List<AnalyticsEventItem>? items,
    final double? value,
    final String? currency,
  });

  /// 表示された広告情報を送信
  void logAdImpression({
    final String? adPlatform,
    final String? adSource,
    final String? adFormat,
    final String? adUnitName,
    final double? value,
    final String? currency,
  });

  /// アプリが foreground になった際のログを送信
  void logAppOpen();

  /// 購入手続きの開始を送信
  void logBeginCheckout({
    final double? value,
    final String? currency,
    final List<AnalyticsEventItem>? items,
    final String? coupon,
  });

  /// キャンペーンの詳細情報を送信
  void logCampaignDetails({
    required final String source,
    required final String medium,
    required final String campaign,
    final String? term,
    final String? content,
    final String? aclid,
    final String? cp1,
  });

  /// 仮想通貨の獲得を送信
  void logEarnVirtualCurrency({
    required final String virtualCurrencyName,
    required final num value,
  });

  /// 問い合わせ開始を送信
  void logGenerateLead({
    final String? currency,
    final double? value,
  });

  /// グループへの参加を送信
  void logJoinGroup({
    required final String groupId,
  });

  /// レベルアップを送信
  void logLevelUp({
    required final int level,
    final String? character,
  });

  /// 新しいレベル開始を送信
  void logLevelStart({
    required final String levelName,
  });

  /// 一つのレベル完了を送信
  void logLevelEnd({
    required final String levelName,
    final int? success,
  });

  /// 購入時オプションの追加を送信
  void logSetCheckoutOption({
    required final int checkoutStep,
    required final String checkoutOption,
  });

  /// ログインを送信
  void logLogin({
    required final String userId,
    final String? loginMethod,
  });

  /// スコアを送信
  void logPostScore({
    required final int score,
    final int? level,
    final String? character,
  });

  /// 購入の完了を送信
  void logPurchase({
    final String? currency,
    final String? coupon,
    final double? value,
    final List<AnalyticsEventItem>? items,
    final double? tax,
    final double? shipping,
    final String? transactionId,
    final String? affiliation,
  });

  /// カートからの商品削除を送信
  void logRemoveFromCart({
    final String? currency,
    final double? value,
    final List<AnalyticsEventItem>? items,
  });

  /// リストからの商品選択を送信
  void logSelectItem({
    final String? itemListId,
    final String? itemListName,
    final List<AnalyticsEventItem>? items,
  });

  /// プロモーションの選択を送信
  void logSelectPromotion({
    final String? creativeName,
    final String? creativeSlot,
    final List<AnalyticsEventItem>? items,
    final String? locationId,
    final String? promotionId,
    final String? promotionName,
  });

  /// カートの表示を送信
  void logViewCart({
    final String? currency,
    final double? value,
    final List<AnalyticsEventItem>? items,
  });

  /// 検索内容を送信
  void logSearch({
    required final String searchTerm,
    final int? numberOfNights,
    final int? numberOfRooms,
    final int? numberOfPassengers,
    final String? origin,
    final String? destination,
    final DateTime? startDate,
    final DateTime? endDate,
    final String? travelClass,
  });

  /// コンテンツの選択を送信
  void logSelectContent({
    required final String contentType,
    required final String itemId,
  });

  /// コンテンツの共有を送信
  void logShare({
    required final String contentType,
    required final String itemId,
    required final String method,
  });

  /// サインアップを送信
  void logSignUp({
    required final String userId,
    required final String signUpMethod,
  });

  /// 仮想通貨の使用を送信
  void logSpendVirtualCurrency({
    required final String itemName,
    required final String virtualCurrencyName,
    required final num value,
  });

  /// チュートリアルの開始を送信
  void logTutorialBegin();

  /// チュートリアルの完了を送信
  void logTutorialComplete();

  /// 実績の達成を送信
  void logUnlockAchievement({
    required final String id,
  });

  /// 商品の表示を送信
  void logViewItem({
    final String? currency,
    final double? value,
    final List<AnalyticsEventItem>? items,
  });

  /// 商品一覧の表示を送信
  void logViewItemList({
    final List<AnalyticsEventItem>? items,
    final String? itemListId,
    final String? itemListName,
  });

  /// プロモーションの表示を送信
  void logViewPromotion({
    final String? creativeName,
    final String? creativeSlot,
    final List<AnalyticsEventItem>? items,
    final String? locationId,
    final String? promotionId,
    final String? promotionName,
  });

  /// 検索結果の表示を送信
  void logViewSearchResults({
    required final String searchTerm,
  });

  /// 払い戻しを送信
  void logRefund({
    final String? currency,
    final String? coupon,
    final double? value,
    final double? tax,
    final double? shipping,
    final String? transactionId,
    final String? affiliation,
    final List<AnalyticsEventItem>? items,
  });

  /// ユーザがログアウトした際のログを送信
  void logLogout({required final String userId});

  /// イベントログのデフォルトパラメータを追加
  void setDefaultEventParameters(final Map<String, Object> defaultParameters);

  /// ログ送信のセッションタイムアウト時間を設定
  void setSessionTimeoutDuration(final Duration timeout);
}

// ignore: public_member_api_docs
class AnalyticsServiceImpl implements AnalyticsService {
  // ignore: public_member_api_docs
  const AnalyticsServiceImpl({
    required final AnalyticsClient analyticsClient,
    required final CrashlyticsService crashlyticsService,
    required final LoggingService loggingService,
  })  : _analyticsClient = analyticsClient,
        _crashlyticsService = crashlyticsService,
        _loggingService = loggingService;

  final AnalyticsClient _analyticsClient;
  final CrashlyticsService _crashlyticsService;
  final LoggingService _loggingService;

  @override
  FirebaseAnalyticsObserver observe({
    final ScreenNameExtractor nameExtractor = defaultNameExtractor,
    final RouteFilter routeFilter = defaultRouteFilter,
    final Function(PlatformException error)? onError,
  }) =>
      _analyticsClient.observe(
        nameExtractor: nameExtractor,
        routeFilter: routeFilter,
        onError: onError,
      );

  @override
  void logAdImpression({
    final String? adPlatform,
    final String? adSource,
    final String? adFormat,
    final String? adUnitName,
    final double? value,
    final String? currency,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logAdImpression(
            adPlatform: adPlatform,
            adSource: adSource,
            adFormat: adFormat,
            adUnitName: adUnitName,
            value: value,
            currency: currency,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "ad_impression: platform: $adPlatform, source: $adSource, format: $adFormat, unit_name: $adUnitName, value: $value, currency: $currency", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logAddPaymentInfo({
    final String? coupon,
    final String? currency,
    final String? paymentType,
    final double? value,
    final List<AnalyticsEventItem>? items,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logAddPaymentInfo(
            coupon: coupon,
            currency: currency,
            paymentType: paymentType,
            value: value,
            items: items,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "add_payment_info: coupon: $coupon, currency: $currency, payment_type: $paymentType, value: $value, items: $items", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logAddShippingInfo({
    final String? coupon,
    final String? currency,
    final double? value,
    final String? shippingTier,
    final List<AnalyticsEventItem>? items,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logAddShippingInfo(
            coupon: coupon,
            currency: currency,
            value: value,
            shippingTier: shippingTier,
            items: items,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "add_shipping_info: coupon: $coupon, currency: $currency, value: $value, shipping_tier: $shippingTier, items: $items", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logAddToCart({
    final List<AnalyticsEventItem>? items,
    final double? value,
    final String? currency,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logAddToCart(
            items: items,
            value: value,
            currency: currency,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "add_to_cart: items: $items, value: $value, currency: $currency",
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logAddToWishlist({
    final List<AnalyticsEventItem>? items,
    final double? value,
    final String? currency,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logAddToWishlist(
            items: items,
            value: value,
            currency: currency,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "add_to_wishlist: items: $items, value: $value, currency: $currency", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logAppOpen() {
    try {
      if (kReleaseMode) {
        unawaited(_analyticsClient.logAppOpen());
      } else {
        _loggingService.info(message: "app_open");
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logBeginCheckout({
    final double? value,
    final String? currency,
    final List<AnalyticsEventItem>? items,
    final String? coupon,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logBeginCheckout(
            value: value,
            currency: currency,
            items: items,
            coupon: coupon,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "begin_checkout: value: $value, currency: $currency, items: $items, coupon: $coupon", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logCampaignDetails({
    required final String source,
    required final String medium,
    required final String campaign,
    final String? term,
    final String? content,
    final String? aclid,
    final String? cp1,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logCampaignDetails(
            source: source,
            medium: medium,
            campaign: campaign,
            term: term,
            content: content,
            aclid: aclid,
            cp1: cp1,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "campaign_details: source: $source, medium: $medium, campaign: $campaign, term: $term, content: $content, aclid: $aclid, cp1: $cp1", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logEarnVirtualCurrency({
    required final String virtualCurrencyName,
    required final num value,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logEarnVirtualCurrency(
            virtualCurrencyName: virtualCurrencyName,
            value: value,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "earn_virtual_currency: virtual_currency_name: $virtualCurrencyName, value: $value", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logEvent({
    required final String name,
    final Map<String, Object?>? parameters,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logEvent(
            name: name,
            parameters: parameters,
          ),
        );
      } else {
        _loggingService.info(
          message: "event: name: $name, parameters: $parameters",
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logGenerateLead({
    final String? currency,
    final double? value,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logGenerateLead(
            currency: currency,
            value: value,
          ),
        );
      } else {
        _loggingService.info(
          message: "generate_lead: currency: $currency, value: $value",
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logJoinGroup({
    required final String groupId,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(_analyticsClient.logJoinGroup(groupId: groupId));
      } else {
        _loggingService.info(message: "join_group: group_id: $groupId");
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logLevelEnd({
    required final String levelName,
    final int? success,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logLevelEnd(
            levelName: levelName,
            success: success,
          ),
        );
      } else {
        _loggingService.info(
          message: "level_end: level_name: $levelName, success: $success",
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logLevelStart({
    required final String levelName,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(_analyticsClient.logLevelStart(levelName: levelName));
      } else {
        _loggingService.info(message: "level_start: level_name: $levelName");
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logLevelUp({
    required final int level,
    final String? character,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logLevelUp(
            level: level,
            character: character,
          ),
        );
      } else {
        _loggingService.info(
          message: "level_up: level: $level, character: $character",
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logLogin({
    required final String userId,
    final String? loginMethod,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          Future.wait(
            <Future<void>>[
              _analyticsClient.logLogin(loginMethod: loginMethod),
              _analyticsClient.setUserId(id: userId),
            ],
          ),
        );
        _crashlyticsService.setUserIdentifier(userId);
      } else {
        _loggingService.info(
          message: "login: id: $userId, method: $loginMethod",
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logLogout({
    required final String userId,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          Future.wait(
            <Future<void>>[
              _analyticsClient.logEvent(
                name: "logout",
                parameters: <String, dynamic>{"id": userId},
              ),
              _analyticsClient.setUserId(),
            ],
          ),
        );
      } else {
        _loggingService.info(
          message: "logout: id: $userId",
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logPostScore({
    required final int score,
    final int? level,
    final String? character,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logPostScore(
            score: score,
            level: level,
            character: character,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "post_score: score: $score, level: $level, character: $character",
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logPurchase({
    final String? currency,
    final String? coupon,
    final double? value,
    final List<AnalyticsEventItem>? items,
    final double? tax,
    final double? shipping,
    final String? transactionId,
    final String? affiliation,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logPurchase(
            currency: currency,
            coupon: coupon,
            value: value,
            items: items,
            tax: tax,
            shipping: shipping,
            transactionId: transactionId,
            affiliation: affiliation,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "purchase: currency: $currency, coupon: $coupon, value: $value, items: $items, tax: $tax, shipping: $shipping, transaction_id: $transactionId, affiliation: $affiliation", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logRefund({
    final String? currency,
    final String? coupon,
    final double? value,
    final double? tax,
    final double? shipping,
    final String? transactionId,
    final String? affiliation,
    final List<AnalyticsEventItem>? items,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logRefund(
            currency: currency,
            coupon: coupon,
            value: value,
            tax: tax,
            shipping: shipping,
            transactionId: transactionId,
            affiliation: affiliation,
            items: items,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "refund: currency: $currency, coupon: $coupon, value: $value, tax: $tax, shipping: $shipping, transaction_id: $transactionId, affiliation: $affiliation, items: $items", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logRemoveFromCart({
    final String? currency,
    final double? value,
    final List<AnalyticsEventItem>? items,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logRemoveFromCart(
            currency: currency,
            value: value,
            items: items,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "remove_from_cart: currency: $currency, value: $value, items: $items", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logScreenView({
    required final String screenName,
    final String screenClass = "Flutter",
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          Future.wait(
            <Future<void>>[
              _analyticsClient.logScreenView(
                screenName: screenName,
                screenClass: screenClass,
              ),
              _analyticsClient.setCurrentScreen(
                screenName: screenName,
                screenClassOverride: screenClass,
              ),
            ],
          ),
        );
      } else {
        _loggingService.info(
          message: "screen_view: name: $screenName, class: $screenClass",
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logSearch({
    required final String searchTerm,
    final int? numberOfNights,
    final int? numberOfRooms,
    final int? numberOfPassengers,
    final String? origin,
    final String? destination,
    final DateTime? startDate,
    final DateTime? endDate,
    final String? travelClass,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logSearch(
            searchTerm: searchTerm,
            numberOfNights: numberOfNights,
            numberOfRooms: numberOfRooms,
            numberOfPassengers: numberOfPassengers,
            origin: origin,
            destination: destination,
            startDate: startDate?.toLocal().toIso8601String(),
            endDate: endDate?.toLocal().toIso8601String(),
            travelClass: travelClass,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "search: term: $searchTerm, number_of_nights: $numberOfNights, number_of_rooms: $numberOfRooms, number_of_passengers: $numberOfPassengers, origin: $origin, destination: $destination, start_date: $startDate, end_date: $endDate, travel_class: $travelClass", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logSelectContent({
    required final String contentType,
    required final String itemId,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logSelectContent(
            contentType: contentType,
            itemId: itemId,
          ),
        );
      } else {
        _loggingService.info(
          message: "select_content: type: $contentType, id: $itemId",
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logSelectItem({
    final String? itemListId,
    final String? itemListName,
    final List<AnalyticsEventItem>? items,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logSelectItem(
            itemListId: itemListId,
            itemListName: itemListName,
            items: items,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "select_item: list_id: $itemListId, list_name: $itemListName, items: $items", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logSelectPromotion({
    final String? creativeName,
    final String? creativeSlot,
    final List<AnalyticsEventItem>? items,
    final String? locationId,
    final String? promotionId,
    final String? promotionName,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logSelectPromotion(
            creativeName: creativeName,
            creativeSlot: creativeSlot,
            items: items,
            locationId: locationId,
            promotionId: promotionId,
            promotionName: promotionName,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "select_promotion: creative_name: $creativeName, creative_slot: $creativeSlot, items: $items, location_id: $locationId, id: $promotionId, name: $promotionName", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logSetCheckoutOption({
    required final int checkoutStep,
    required final String checkoutOption,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logSetCheckoutOption(
            checkoutStep: checkoutStep,
            checkoutOption: checkoutOption,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "set_checkout_option: step: $checkoutStep, option: $checkoutOption", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logShare({
    required final String contentType,
    required final String itemId,
    required final String method,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logShare(
            contentType: contentType,
            itemId: itemId,
            method: method,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "share: content_type: $contentType, item_id: $itemId, method: $method", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logSignUp({
    required final String userId,
    required final String signUpMethod,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          Future.wait(
            <Future<void>>[
              _analyticsClient.logSignUp(signUpMethod: signUpMethod),
              _analyticsClient.setUserId(id: userId),
            ],
          ),
        );
        _crashlyticsService.setUserIdentifier(userId);
      } else {
        _loggingService.info(
          message: "sign_up: id: $userId, method: $signUpMethod",
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logSpendVirtualCurrency({
    required final String itemName,
    required final String virtualCurrencyName,
    required final num value,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logSpendVirtualCurrency(
            itemName: itemName,
            virtualCurrencyName: virtualCurrencyName,
            value: value,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "spend_virtual_currency: item_name: $itemName, virtual_currency_name: $virtualCurrencyName, value: $value", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logTutorialBegin() {
    try {
      if (kReleaseMode) {
        unawaited(_analyticsClient.logTutorialBegin());
      } else {
        _loggingService.info(message: "tutorial_begin");
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logTutorialComplete() {
    try {
      if (kReleaseMode) {
        unawaited(_analyticsClient.logTutorialComplete());
      } else {
        _loggingService.info(message: "tutorial_complete");
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logUnlockAchievement({required final String id}) {
    try {
      if (kReleaseMode) {
        unawaited(_analyticsClient.logUnlockAchievement(id: id));
      } else {
        _loggingService.info(message: "unlock_achievement: id: $id");
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logViewCart({
    final String? currency,
    final double? value,
    final List<AnalyticsEventItem>? items,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logViewCart(
            currency: currency,
            value: value,
            items: items,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "view_cart: currency: $currency, value: $value, items: $items",
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logViewItem({
    final String? currency,
    final double? value,
    final List<AnalyticsEventItem>? items,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logViewItem(
            currency: currency,
            value: value,
            items: items,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "view_item: currency: $currency, value: $value, items: $items",
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logViewItemList({
    final List<AnalyticsEventItem>? items,
    final String? itemListId,
    final String? itemListName,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logViewItemList(
            items: items,
            itemListId: itemListId,
            itemListName: itemListName,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "view_item_list: items: $items, id: $itemListId, name: $itemListName", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logViewPromotion({
    final String? creativeName,
    final String? creativeSlot,
    final List<AnalyticsEventItem>? items,
    final String? locationId,
    final String? promotionId,
    final String? promotionName,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logViewPromotion(
            creativeName: creativeName,
            creativeSlot: creativeSlot,
            items: items,
            locationId: locationId,
            promotionId: promotionId,
            promotionName: promotionName,
          ),
        );
      } else {
        _loggingService.info(
          message:
              "view_promotion: creative_name: $creativeName, creative_slot: $creativeSlot, items: $items, location_id: $locationId, id: $promotionId, name: $promotionName", // ignore: lines_longer_than_80_chars
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void logViewSearchResults({
    required final String searchTerm,
  }) {
    try {
      if (kReleaseMode) {
        unawaited(
          _analyticsClient.logViewSearchResults(searchTerm: searchTerm),
        );
      } else {
        _loggingService.info(
          message: "view_search_results: search_term: $searchTerm",
        );
      }
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void setConsent({
    final bool? adStorageConsentGranted,
    final bool? analyticsStorageConsentGranted,
  }) {
    try {
      unawaited(
        _analyticsClient.setConsent(
          adStorageConsentGranted: adStorageConsentGranted,
          analyticsStorageConsentGranted: analyticsStorageConsentGranted,
        ),
      );
      _loggingService.info(
        message:
            "set_consent: ad_storage_consent_granted: $adStorageConsentGranted, analytics_storage_consent_granted: $analyticsStorageConsentGranted", // ignore: lines_longer_than_80_chars
      );
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void setDefaultEventParameters(final Map<String, Object> defaultParameters) {
    try {
      unawaited(_analyticsClient.setDefaultEventParameters(defaultParameters));
      _loggingService.info(
        message: "set_default_event_parameters: parameters: $defaultParameters",
      );
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void setSessionTimeoutDuration(final Duration timeout) {
    try {
      unawaited(_analyticsClient.setSessionTimeoutDuration(timeout));
      _loggingService.info(
        message: "set_session_timeout_duration: timeout: $timeout",
      );
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }

  @override
  void setUserProperty({
    required final String name,
    required final String? value,
  }) {
    try {
      unawaited(
        _analyticsClient.setUserProperty(
          name: name,
          value: value,
        ),
      );
      _loggingService.info(
        message: "set_user_property: name: $name, value: $value",
      );
    } on Exception catch (exception) {
      _crashlyticsService.recordException(exception, StackTrace.current);
    }
  }
}

/// AnalyticsService Provider
final ProviderFamily<AnalyticsService, FirebaseApp> analyticsServiceProvider =
    Provider.family(
  (
    final ProviderRef<AnalyticsService> ref,
    final FirebaseApp app,
  ) {
    final AnalyticsClient analyticsClient =
        ref.watch(analyticsClientProvider(app));
    final CrashlyticsService crashlyticsService =
        ref.watch(crashlyticsServiceProvider);
    final LoggingService loggingService = ref.watch(loggingServiceProvider);

    return AnalyticsServiceImpl(
      analyticsClient: analyticsClient,
      crashlyticsService: crashlyticsService,
      loggingService: loggingService,
    );
  },
);
