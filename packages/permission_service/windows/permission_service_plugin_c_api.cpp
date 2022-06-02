#include "include/permission_service/permission_service_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "permission_service_plugin.h"

void PermissionServicePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  permission_service::PermissionServicePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
