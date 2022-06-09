#include "include/auth_service/auth_service_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "auth_service_plugin.h"

void AuthServicePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  auth_service::AuthServicePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
