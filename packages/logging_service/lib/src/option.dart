import 'package:freezed_annotation/freezed_annotation.dart';

part 'option.freezed.dart';

/// ログとして表示する情報
@Freezed(
  map: FreezedMapOptions(maybeMap: false),
  when: FreezedWhenOptions(maybeWhen: false),
)
class LogOption with _$LogOption {
  /// `Level.SHOUT` のログ情報
  const factory LogOption.shout({
    required final Object error,
    final StackTrace? stackTrace,
  }) = ShoutLogOption;

  /// `Level.SEVERE` のログ情報
  const factory LogOption.severe({
    required final Object error,
    final StackTrace? stackTrace,
  }) = SevereLogOption;

  /// `Level.WARNING` のログ情報
  const factory LogOption.warning({
    required final Exception exception,
    final StackTrace? stackTrace,
  }) = WarningLogOption;

  /// `Level.INFO` のログ情報
  const factory LogOption.info({
    required final String message,
  }) = InfoLogOption;

  const LogOption._();
}
