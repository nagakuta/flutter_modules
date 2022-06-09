#ifndef FLUTTER_PLUGIN_AUTH_SERVICE_PLUGIN_H_
#define FLUTTER_PLUGIN_AUTH_SERVICE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace auth_service {

class AuthServicePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  AuthServicePlugin();

  virtual ~AuthServicePlugin();

  // Disallow copy and assign.
  AuthServicePlugin(const AuthServicePlugin&) = delete;
  AuthServicePlugin& operator=(const AuthServicePlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace auth_service

#endif  // FLUTTER_PLUGIN_AUTH_SERVICE_PLUGIN_H_
