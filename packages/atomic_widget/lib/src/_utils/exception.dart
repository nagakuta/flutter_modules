import 'package:freezed_annotation/freezed_annotation.dart';

part 'exception.freezed.dart';

/// AtomicWidget Exception
@Freezed(
  copyWith: false,
  fromJson: false,
  toJson: false,
  map: FreezedMapOptions.none,
  when: FreezedWhenOptions.none,
)
sealed class AtomicWidgetException with _$AtomicWidgetException implements Exception {
  // ignore: public_member_api_docs
  const factory AtomicWidgetException.shouldUseTemplateWidget() = ShouldUseTemplateWidgetException;

  const AtomicWidgetException._();

  @override
  String toString() {
    final String message = switch (this) {
      ShouldUseTemplateWidgetException() => "Should use `TemplateWidget`.",
    };

    return "AtomicWidgetException: $message";
  }
}
