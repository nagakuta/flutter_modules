#ifndef FLUTTER_PLUGIN_GALLERY_SERVICE_PLUGIN_H_
#define FLUTTER_PLUGIN_GALLERY_SERVICE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace gallery_service {

class GalleryServicePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  GalleryServicePlugin();

  virtual ~GalleryServicePlugin();

  // Disallow copy and assign.
  GalleryServicePlugin(const GalleryServicePlugin&) = delete;
  GalleryServicePlugin& operator=(const GalleryServicePlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace gallery_service

#endif  // FLUTTER_PLUGIN_GALLERY_SERVICE_PLUGIN_H_
