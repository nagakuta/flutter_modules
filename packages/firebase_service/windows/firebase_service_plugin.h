#ifndef FLUTTER_PLUGIN_FIREBASE_SERVICE_PLUGIN_H_
#define FLUTTER_PLUGIN_FIREBASE_SERVICE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace firebase_service {

class FirebaseServicePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FirebaseServicePlugin();

  virtual ~FirebaseServicePlugin();

  // Disallow copy and assign.
  FirebaseServicePlugin(const FirebaseServicePlugin&) = delete;
  FirebaseServicePlugin& operator=(const FirebaseServicePlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace firebase_service

#endif  // FLUTTER_PLUGIN_FIREBASE_SERVICE_PLUGIN_H_
