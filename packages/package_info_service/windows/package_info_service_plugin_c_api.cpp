#include "include/package_info_service/package_info_service_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "package_info_service_plugin.h"

void PackageInfoServicePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  package_info_service::PackageInfoServicePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
