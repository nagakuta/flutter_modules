// ignore_for_file: cascade_invocations
import 'package:logging_service/logging_service.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  final ProviderContainer container = ProviderContainer();
  final LoggingService service = container.read(loggingServiceProvider);

  // Display logs according to level.
  service.log(LogOption.shout(error: ArgumentError()));
  service.log(LogOption.severe(error: ArgumentError()));
  service.log(LogOption.warning(exception: Exception()));
  service.log(const LogOption.info(message: "Example"));

  // Display a log of Level.SHOUT
  service.shout(error: ArgumentError());

  // Display a log of Level.SEVERE
  service.severe(error: ArgumentError());

  // Display a log of Level.WARNING
  service.warning(exception: Exception());

  // Display a log of Level.INFO
  service.info(message: "Example");
}
