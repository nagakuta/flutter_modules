import 'package:freezed_annotation/freezed_annotation.dart';

part 'exception.freezed.dart';

/// AtomicWidget Exception
@freezed
class AtomicWidgetException with _$AtomicWidgetException implements Exception {
  // ignore: public_member_api_docs
  const factory AtomicWidgetException.shouldUseTemplateWidget() = ShouldUseTemplateWidgetException;

  const AtomicWidgetException._();

  @override
  String toString() => when(
        shouldUseTemplateWidget: () => "AtomicWidgetException: Should use TemplateWidget.",
      );
}
