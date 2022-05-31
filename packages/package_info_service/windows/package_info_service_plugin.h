#ifndef FLUTTER_PLUGIN_PACKAGE_INFO_SERVICE_PLUGIN_H_
#define FLUTTER_PLUGIN_PACKAGE_INFO_SERVICE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace package_info_service {

class PackageInfoServicePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PackageInfoServicePlugin();

  virtual ~PackageInfoServicePlugin();

  // Disallow copy and assign.
  PackageInfoServicePlugin(const PackageInfoServicePlugin&) = delete;
  PackageInfoServicePlugin& operator=(const PackageInfoServicePlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace package_info_service

#endif  // FLUTTER_PLUGIN_PACKAGE_INFO_SERVICE_PLUGIN_H_
