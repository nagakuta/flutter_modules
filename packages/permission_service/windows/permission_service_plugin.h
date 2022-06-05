#ifndef FLUTTER_PLUGIN_PERMISSION_SERVICE_PLUGIN_H_
#define FLUTTER_PLUGIN_PERMISSION_SERVICE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace permission_service {

class PermissionServicePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PermissionServicePlugin();

  virtual ~PermissionServicePlugin();

  // Disallow copy and assign.
  PermissionServicePlugin(const PermissionServicePlugin&) = delete;
  PermissionServicePlugin& operator=(const PermissionServicePlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace permission_service

#endif  // FLUTTER_PLUGIN_PERMISSION_SERVICE_PLUGIN_H_
