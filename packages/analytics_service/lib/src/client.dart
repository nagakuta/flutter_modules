import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_service/firebase_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod/riverpod.dart';

/// Analytics Client
abstract class AnalyticsClient {
  /// Creates a [NavigatorObserver] that sends events to [FirebaseAnalytics].
  FirebaseAnalyticsObserver observe({
    required final ScreenNameExtractor nameExtractor,
    required final RouteFilter routeFilter,
    final Function(PlatformException error)? onError,
  });

  /// Logs a custom Flutter Analytics event with the given [name]
  /// and event [parameters].
  Future<void> logEvent({
    required final String name,
    final Map<String, Object?>? parameters,
    final AnalyticsCallOptions? callOptions,
  });

  /// Sets the applicable end user consent state.
  Future<void> setConsent({
    final bool? adStorageConsentGranted,
    final bool? analyticsStorageConsentGranted,
  });

  /// Adds parameters that will be set on every event logged from the SDK,
  /// including automatic ones.
  Future<void> setDefaultEventParameters(
    final Map<String, Object> defaultParameters,
  );

  /// Sets the user ID property.
  Future<void> setUserId({
    final String? id,
    final AnalyticsCallOptions? callOptions,
  });

  /// Sets the current [screenName], which specifies the current visual context
  /// in your app.
  Future<void> setCurrentScreen({
    required final String? screenName,
    final String screenClassOverride = "Flutter",
    final AnalyticsCallOptions? callOptions,
  });

  /// Sets a user property to a given value.
  Future<void> setUserProperty({
    required final String name,
    required final String? value,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `add_payment_info` event.
  Future<void> logAddPaymentInfo({
    final String? coupon,
    final String? currency,
    final String? paymentType,
    final double? value,
    final List<AnalyticsEventItem>? items,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `add_shipping_info` event.
  Future<void> logAddShippingInfo({
    final String? coupon,
    final String? currency,
    final double? value,
    final String? shippingTier,
    final List<AnalyticsEventItem>? items,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `add_to_cart` event.
  Future<void> logAddToCart({
    final List<AnalyticsEventItem>? items,
    final double? value,
    final String? currency,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `add_to_wishlist` event.
  Future<void> logAddToWishlist({
    final List<AnalyticsEventItem>? items,
    final double? value,
    final String? currency,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `ad_impression` event.
  Future<void> logAdImpression({
    final String? adPlatform,
    final String? adSource,
    final String? adFormat,
    final String? adUnitName,
    final double? value,
    final String? currency,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `app_open` event.
  Future<void> logAppOpen({final AnalyticsCallOptions? callOptions});

  /// Logs the standard `begin_checkout` event.
  Future<void> logBeginCheckout({
    final double? value,
    final String? currency,
    final List<AnalyticsEventItem>? items,
    final String? coupon,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `campaign_details` event.
  Future<void> logCampaignDetails({
    required final String source,
    required final String medium,
    required final String campaign,
    final String? term,
    final String? content,
    final String? aclid,
    final String? cp1,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `earn_virtual_currency` event.
  Future<void> logEarnVirtualCurrency({
    required final String virtualCurrencyName,
    required final num value,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `generate_lead` event.
  Future<void> logGenerateLead({
    final String? currency,
    final double? value,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `join_group` event.
  Future<void> logJoinGroup({
    required final String groupId,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `level_up` event.
  Future<void> logLevelUp({
    required final int level,
    final String? character,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `level_start` event.
  Future<void> logLevelStart({
    required final String levelName,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `level_end` event.
  Future<void> logLevelEnd({
    required final String levelName,
    final int? success,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `set_checkout_option` event.
  Future<void> logSetCheckoutOption({
    required final int checkoutStep,
    required final String checkoutOption,
  });

  /// Logs the standard `login` event.
  Future<void> logLogin({
    final String? loginMethod,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `post_score` event.
  Future<void> logPostScore({
    required final int score,
    final int? level,
    final String? character,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `purchase` event.
  Future<void> logPurchase({
    final String? currency,
    final String? coupon,
    final double? value,
    final List<AnalyticsEventItem>? items,
    final double? tax,
    final double? shipping,
    final String? transactionId,
    final String? affiliation,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `remove_from_cart` event.
  Future<void> logRemoveFromCart({
    final String? currency,
    final double? value,
    final List<AnalyticsEventItem>? items,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `screen_view` event.
  Future<void> logScreenView({
    final String? screenClass,
    final String? screenName,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `select_item` event.
  Future<void> logSelectItem({
    final String? itemListId,
    final String? itemListName,
    final List<AnalyticsEventItem>? items,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `select_promotion` event.
  Future<void> logSelectPromotion({
    final String? creativeName,
    final String? creativeSlot,
    final List<AnalyticsEventItem>? items,
    final String? locationId,
    final String? promotionId,
    final String? promotionName,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `view_cart` event.
  Future<void> logViewCart({
    final String? currency,
    final double? value,
    final List<AnalyticsEventItem>? items,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `search` event.
  Future<void> logSearch({
    required final String searchTerm,
    final int? numberOfNights,
    final int? numberOfRooms,
    final int? numberOfPassengers,
    final String? origin,
    final String? destination,
    final String? startDate,
    final String? endDate,
    final String? travelClass,
    final AnalyticsCallOptions? callOptions,
  });

  /// Logs the standard `select_content` event.
  Future<void> logSelectContent({
    required final String contentType,
    required final String itemId,
  });

  /// Logs the standard `share` event.
  Future<void> logShare({
    required final String contentType,
    required final String itemId,
    required final String method,
  });

  /// Logs the standard `sign_up` event.
  Future<void> logSignUp({required final String signUpMethod});

  /// Logs the standard `spend_virtual_currency` event.
  Future<void> logSpendVirtualCurrency({
    required final String itemName,
    required final String virtualCurrencyName,
    required final num value,
  });

  /// Logs the standard `tutorial_begin` event.
  Future<void> logTutorialBegin();

  /// Logs the standard `tutorial_complete` event.
  Future<void> logTutorialComplete();

  /// Logs the standard `unlock_achievement` event with a given achievement
  /// [id].
  Future<void> logUnlockAchievement({
    required final String id,
  });

  /// Logs the standard `view_item` event.
  Future<void> logViewItem({
    final String? currency,
    final double? value,
    final List<AnalyticsEventItem>? items,
  });

  /// Logs the standard `view_item_list` event.
  Future<void> logViewItemList({
    final List<AnalyticsEventItem>? items,
    final String? itemListId,
    final String? itemListName,
  });

  /// Logs the standard `view_promotion` event.
  Future<void> logViewPromotion({
    final String? creativeName,
    final String? creativeSlot,
    final List<AnalyticsEventItem>? items,
    final String? locationId,
    final String? promotionId,
    final String? promotionName,
  });

  /// Logs the standard `view_search_results` event.
  Future<void> logViewSearchResults({
    required final String searchTerm,
  });

  /// Logs the standard `refund` event.
  Future<void> logRefund({
    final String? currency,
    final String? coupon,
    final double? value,
    final double? tax,
    final double? shipping,
    final String? transactionId,
    final String? affiliation,
    final List<AnalyticsEventItem>? items,
  });

  /// Sets the duration of inactivity that terminates the current session.
  Future<void> setSessionTimeoutDuration(final Duration timeout);
}

// ignore: public_member_api_docs
class AnalyticsClientImpl implements AnalyticsClient {
  // ignore: public_member_api_docs
  const AnalyticsClientImpl({
    required final FirebaseAnalytics analytics,
  }) : _analytics = analytics;

  final FirebaseAnalytics _analytics;

  @override
  FirebaseAnalyticsObserver observe({
    required final ScreenNameExtractor nameExtractor,
    required final RouteFilter routeFilter,
    final Function(PlatformException error)? onError,
  }) =>
      FirebaseAnalyticsObserver(
        analytics: _analytics,
        nameExtractor: nameExtractor,
        routeFilter: routeFilter,
        onError: onError,
      );

  @override
  Future<void> logAdImpression({
    final String? adPlatform,
    final String? adSource,
    final String? adFormat,
    final String? adUnitName,
    final double? value,
    final String? currency,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logAdImpression(
        adPlatform: adPlatform,
        adSource: adSource,
        adFormat: adFormat,
        adUnitName: adUnitName,
        value: value,
        currency: currency,
        callOptions: callOptions,
      );

  @override
  Future<void> logAddPaymentInfo({
    final String? coupon,
    final String? currency,
    final String? paymentType,
    final double? value,
    final List<AnalyticsEventItem>? items,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logAddPaymentInfo(
        coupon: coupon,
        currency: currency,
        paymentType: paymentType,
        value: value,
        items: items,
        callOptions: callOptions,
      );

  @override
  Future<void> logAddShippingInfo({
    final String? coupon,
    final String? currency,
    final double? value,
    final String? shippingTier,
    final List<AnalyticsEventItem>? items,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logAddShippingInfo(
        coupon: coupon,
        currency: currency,
        value: value,
        shippingTier: shippingTier,
        items: items,
        callOptions: callOptions,
      );

  @override
  Future<void> logAddToCart({
    final List<AnalyticsEventItem>? items,
    final double? value,
    final String? currency,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logAddToCart(
        items: items,
        value: value,
        currency: currency,
        callOptions: callOptions,
      );

  @override
  Future<void> logAddToWishlist({
    final List<AnalyticsEventItem>? items,
    final double? value,
    final String? currency,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logAddToWishlist(
        items: items,
        value: value,
        currency: currency,
        callOptions: callOptions,
      );

  @override
  Future<void> logAppOpen({final AnalyticsCallOptions? callOptions}) =>
      _analytics.logAppOpen(callOptions: callOptions);

  @override
  Future<void> logBeginCheckout({
    final double? value,
    final String? currency,
    final List<AnalyticsEventItem>? items,
    final String? coupon,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logBeginCheckout(
        value: value,
        currency: currency,
        items: items,
        coupon: coupon,
        callOptions: callOptions,
      );

  @override
  Future<void> logCampaignDetails({
    required final String source,
    required final String medium,
    required final String campaign,
    final String? term,
    final String? content,
    final String? aclid,
    final String? cp1,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logCampaignDetails(
        source: source,
        medium: medium,
        campaign: campaign,
        term: term,
        content: content,
        aclid: aclid,
        cp1: cp1,
        callOptions: callOptions,
      );

  @override
  Future<void> logEarnVirtualCurrency({
    required final String virtualCurrencyName,
    required final num value,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logEarnVirtualCurrency(
        virtualCurrencyName: virtualCurrencyName,
        value: value,
        callOptions: callOptions,
      );

  @override
  Future<void> logEvent({
    required final String name,
    final Map<String, Object?>? parameters,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logEvent(
        name: name,
        parameters: parameters,
        callOptions: callOptions,
      );

  @override
  Future<void> logGenerateLead({
    final String? currency,
    final double? value,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logGenerateLead(
        currency: currency,
        value: value,
        callOptions: callOptions,
      );

  @override
  Future<void> logJoinGroup({
    required final String groupId,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logJoinGroup(
        groupId: groupId,
        callOptions: callOptions,
      );

  @override
  Future<void> logLevelEnd({
    required final String levelName,
    final int? success,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logLevelEnd(
        levelName: levelName,
        success: success,
        callOptions: callOptions,
      );

  @override
  Future<void> logLevelStart({
    required final String levelName,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logLevelStart(
        levelName: levelName,
        callOptions: callOptions,
      );

  @override
  Future<void> logLevelUp({
    required final int level,
    final String? character,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logLevelUp(
        level: level,
        character: character,
        callOptions: callOptions,
      );

  @override
  Future<void> logLogin({
    final String? loginMethod,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logLogin(
        loginMethod: loginMethod,
        callOptions: callOptions,
      );

  @override
  Future<void> logPostScore({
    required final int score,
    final int? level,
    final String? character,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logPostScore(
        score: score,
        level: level,
        character: character,
        callOptions: callOptions,
      );

  @override
  Future<void> logPurchase({
    final String? currency,
    final String? coupon,
    final double? value,
    final List<AnalyticsEventItem>? items,
    final double? tax,
    final double? shipping,
    final String? transactionId,
    final String? affiliation,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logPurchase(
        currency: currency,
        coupon: coupon,
        value: value,
        items: items,
        tax: tax,
        shipping: shipping,
        transactionId: transactionId,
        affiliation: affiliation,
        callOptions: callOptions,
      );

  @override
  Future<void> logRefund({
    final String? currency,
    final String? coupon,
    final double? value,
    final double? tax,
    final double? shipping,
    final String? transactionId,
    final String? affiliation,
    final List<AnalyticsEventItem>? items,
  }) =>
      _analytics.logRefund(
        currency: currency,
        coupon: coupon,
        value: value,
        tax: tax,
        shipping: shipping,
        transactionId: transactionId,
        affiliation: affiliation,
        items: items,
      );

  @override
  Future<void> logRemoveFromCart({
    final String? currency,
    final double? value,
    final List<AnalyticsEventItem>? items,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logRemoveFromCart(
        currency: currency,
        value: value,
        items: items,
        callOptions: callOptions,
      );

  @override
  Future<void> logScreenView({
    final String? screenClass,
    final String? screenName,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logScreenView(
        screenClass: screenClass,
        screenName: screenName,
        callOptions: callOptions,
      );

  @override
  Future<void> logSearch({
    required final String searchTerm,
    final int? numberOfNights,
    final int? numberOfRooms,
    final int? numberOfPassengers,
    final String? origin,
    final String? destination,
    final String? startDate,
    final String? endDate,
    final String? travelClass,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logSearch(
        searchTerm: searchTerm,
        numberOfNights: numberOfNights,
        numberOfRooms: numberOfRooms,
        numberOfPassengers: numberOfPassengers,
        origin: origin,
        destination: destination,
        startDate: startDate,
        endDate: endDate,
        travelClass: travelClass,
        callOptions: callOptions,
      );

  @override
  Future<void> logSelectContent({
    required final String contentType,
    required final String itemId,
  }) =>
      _analytics.logSelectContent(
        contentType: contentType,
        itemId: itemId,
      );

  @override
  Future<void> logSelectItem({
    final String? itemListId,
    final String? itemListName,
    final List<AnalyticsEventItem>? items,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logSelectItem(
        itemListId: itemListId,
        itemListName: itemListName,
        items: items,
        callOptions: callOptions,
      );

  @override
  Future<void> logSelectPromotion({
    final String? creativeName,
    final String? creativeSlot,
    final List<AnalyticsEventItem>? items,
    final String? locationId,
    final String? promotionId,
    final String? promotionName,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logSelectPromotion(
        creativeName: creativeName,
        creativeSlot: creativeSlot,
        items: items,
        locationId: locationId,
        promotionId: promotionId,
        promotionName: promotionName,
        callOptions: callOptions,
      );

  @override
  Future<void> logSetCheckoutOption({
    required final int checkoutStep,
    required final String checkoutOption,
  }) =>
      _analytics.logSetCheckoutOption(
        checkoutStep: checkoutStep,
        checkoutOption: checkoutOption,
      );

  @override
  Future<void> logShare({
    required final String contentType,
    required final String itemId,
    required final String method,
  }) =>
      _analytics.logShare(
        contentType: contentType,
        itemId: itemId,
        method: method,
      );

  @override
  Future<void> logSignUp({required final String signUpMethod}) =>
      _analytics.logSignUp(signUpMethod: signUpMethod);

  @override
  Future<void> logSpendVirtualCurrency({
    required final String itemName,
    required final String virtualCurrencyName,
    required final num value,
  }) =>
      _analytics.logSpendVirtualCurrency(
        itemName: itemName,
        virtualCurrencyName: virtualCurrencyName,
        value: value,
      );

  @override
  Future<void> logTutorialBegin() => _analytics.logTutorialBegin();

  @override
  Future<void> logTutorialComplete() => _analytics.logTutorialComplete();

  @override
  Future<void> logUnlockAchievement({required final String id}) =>
      _analytics.logUnlockAchievement(id: id);

  @override
  Future<void> logViewCart({
    final String? currency,
    final double? value,
    final List<AnalyticsEventItem>? items,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.logViewCart(
        currency: currency,
        value: value,
        items: items,
        callOptions: callOptions,
      );

  @override
  Future<void> logViewItem({
    final String? currency,
    final double? value,
    final List<AnalyticsEventItem>? items,
  }) =>
      _analytics.logViewItem(
        currency: currency,
        value: value,
        items: items,
      );

  @override
  Future<void> logViewItemList({
    final List<AnalyticsEventItem>? items,
    final String? itemListId,
    final String? itemListName,
  }) =>
      _analytics.logViewItemList(
        items: items,
        itemListId: itemListId,
        itemListName: itemListName,
      );

  @override
  Future<void> logViewPromotion({
    final String? creativeName,
    final String? creativeSlot,
    final List<AnalyticsEventItem>? items,
    final String? locationId,
    final String? promotionId,
    final String? promotionName,
  }) =>
      _analytics.logViewPromotion(
        creativeName: creativeName,
        creativeSlot: creativeSlot,
        items: items,
        locationId: locationId,
        promotionId: promotionId,
        promotionName: promotionName,
      );

  @override
  Future<void> logViewSearchResults({required final String searchTerm}) =>
      _analytics.logViewSearchResults(searchTerm: searchTerm);

  @override
  Future<void> setConsent({
    final bool? adStorageConsentGranted,
    final bool? analyticsStorageConsentGranted,
  }) =>
      _analytics.setConsent(
        adStorageConsentGranted: adStorageConsentGranted,
        analyticsStorageConsentGranted: analyticsStorageConsentGranted,
      );

  @override
  Future<void> setCurrentScreen({
    required final String? screenName,
    final String screenClassOverride = "Flutter",
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.setCurrentScreen(
        screenName: screenName,
        screenClassOverride: screenClassOverride,
        callOptions: callOptions,
      );

  @override
  Future<void> setDefaultEventParameters(
    final Map<String, Object> defaultParameters,
  ) =>
      _analytics.setDefaultEventParameters(defaultParameters);

  @override
  Future<void> setSessionTimeoutDuration(final Duration timeout) =>
      _analytics.setSessionTimeoutDuration(timeout);

  @override
  Future<void> setUserId({
    final String? id,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.setUserId(
        id: id,
        callOptions: callOptions,
      );

  @override
  Future<void> setUserProperty({
    required final String name,
    required final String? value,
    final AnalyticsCallOptions? callOptions,
  }) =>
      _analytics.setUserProperty(
        name: name,
        value: value,
        callOptions: callOptions,
      );
}

/// AnalyticsClient Provider
final ProviderFamily<AnalyticsClient, FirebaseApp> analyticsClientProvider =
    Provider.family(
  (
    final _,
    final FirebaseApp app,
  ) {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instanceFor(app: app)
      ..setAnalyticsCollectionEnabled(kReleaseMode);

    return AnalyticsClientImpl(analytics: analytics);
  },
);
