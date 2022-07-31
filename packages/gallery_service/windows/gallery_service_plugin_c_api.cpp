#include "include/gallery_service/gallery_service_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "gallery_service_plugin.h"

void GalleryServicePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  gallery_service::GalleryServicePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
