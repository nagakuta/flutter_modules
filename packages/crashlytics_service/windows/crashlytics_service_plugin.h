#ifndef FLUTTER_PLUGIN_CRASHLYTICS_SERVICE_PLUGIN_H_
#define FLUTTER_PLUGIN_CRASHLYTICS_SERVICE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace crashlytics_service {

class CrashlyticsServicePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  CrashlyticsServicePlugin();

  virtual ~CrashlyticsServicePlugin();

  // Disallow copy and assign.
  CrashlyticsServicePlugin(const CrashlyticsServicePlugin&) = delete;
  CrashlyticsServicePlugin& operator=(const CrashlyticsServicePlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace crashlytics_service

#endif  // FLUTTER_PLUGIN_CRASHLYTICS_SERVICE_PLUGIN_H_
